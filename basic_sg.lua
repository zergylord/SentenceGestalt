require 'nngraph'
require 'optim'
util = require 'util/model_utils.lua'
refresh = 1e3
num_words_per_sentence = 7
num_probes = 10

word_dim = 85
hid_dim = 10
sg_dim = 100
local word_input = nn.Identity()()
local rec_input = nn.Identity()()
local hid = nn.ReLU()(nn.Linear(word_dim+sg_dim,hid_dim)(nn.JoinTable(1){word_input,rec_input}))
local sg = nn.Sigmoid()(nn.Linear(hid_dim,sg_dim)(hid))
sg_net = nn.gModule({word_input,rec_input},{sg})

probe_dim = 85
role_dim = 85
local probe_input = nn.Identity()()
local sg_input = nn.Identity()()
local hid = nn.ReLU()(nn.Linear(probe_dim+sg_dim,role_dim)(nn.JoinTable(1){probe_input,sg_input}))
local role = nn.Sigmoid()(hid)
probe_net = nn.gModule({probe_input,sg_input},{role})

local word_input = nn.Identity()()
local rec_input = nn.Identity()()
local probe_input = nn.Identity()()
local output = probe_net{probe_input,sg_net{word_input,rec_input}}
full_net = nn.gModule({word_input,rec_input,probe_input},{output})

w,dw = full_net:getParameters()


out = sg_net:forward{torch.rand(word_dim),torch.rand(sg_dim)}
out = sg_net:forward{torch.rand(word_dim),out}

bce_crit = nn.BCECriterion()

probe = torch.rand(num_probes,probe_dim)
role_targets = torch.rand(num_probes,role_dim):gt(.5):double()
timer = torch.Timer()

train = function(x)
    if x ~= w then
        w:copy(x)
    end
    full_net:zeroGradParameters()
    
    local sentence = torch.zeros(num_words_per_sentence,word_dim)
    local sg = torch.zeros(num_words_per_sentence+1,sg_dim)
    local sg_grad = torch.zeros(num_words_per_sentence,sg_dim)
    local loss = 0
    for t = 1,num_words_per_sentence do
        --calculate sentence gestalt
        local word = sentence[t]
        sg[t+1] = sg_net:forward{word,sg[t]}
        --run through the probes
        for p = 1,num_probes do
            local role = probe_net:forward{probe[p],sg[t+1]}
            loss = loss + bce_crit:forward(role,role_targets[p])
            local grad = bce_crit:backward(role,role_targets[p])
            --update probe network
            sg_grad[t] = sg_grad[t] + probe_net:backward({probe[p],sg[t+1]},grad)[2]
        end
        --update SG network
        sg_net:backward({word,sg[t]},sg_grad[t])
        --sg TD
        if t > 1 then
            loss = loss + bce_crit:forward(sg[t],sg[t+1])
            local grad = bce_crit:backward(sg[t],sg[t+1])
            sg_net:backward({word,sg[t]},grad)
        end
    end
    return loss,dw
end
config = {
    learningRate = 3e-4
}
local cumloss = 0
for i = 1,1e5 do
    x,batchloss = optim.sgd(train,w,config)
    cumloss = cumloss + batchloss[1]
    if i % refresh == 0 then
        print(i,cumloss,w:norm(),dw:norm(),timer:time().real)
        timer:reset()
        cumloss = 0
    end
end







