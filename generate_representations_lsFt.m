all_feat = {'passive_voice','woman','man','girl','boy','drink_v','eat','feed','fish','plant','water','play','wear','read','write','look_at','like','kitchen','living_room','garden','lake','park','balkony','office','backyard','veranda','bedroom',...
    'egg','toast','cereals','soup','pizza','salad','iced_tea','juice','lemonade','cacao','tea','coffee',...
    'chess','monopoly','backgammon','jeans','shirt','pajamas','novel','email','sms','paper','newspaper','letter','rose','daisy','tulip','pine','oak','birch','robin','canary','sparrow','sunfish','salmon','eel',...
    'breakfast','dinner','excursion','afternoon','holiday','sunday','morning','evening','person','agent','adult','female','male','child','action','location',...   
    'consumeable','food','game','entertaining','strategic','with_dice','old',...
    'garment','to_cover_body','contains_language','contains_letters','art',...
    'communication_digital','communication_short','communication_paper','scientific','information','can_grow','has_roots','has_petals','red','yellow','colorful','has_bark','green',...
    'tall','white_bark','can_move','can_fly','brown','can_swim','long','white','brown','healthy','in_bowl','round','light',...
    'drink','from_fruit','from_leaves','sweet','with_chocolate','hot','activating','for_legs','for_upper_part','for_night','situation'};



%agents
sem(1).con={'woman'};
sem(1).feat={'person','agent','adult','female','woman'};
sem(2).con={'man'};
sem(2).feat={'person','agent','adult','male','man'};
sem(3).con={'girl'};
sem(3).feat={'person','agent','child','female','girl'};
sem(4).con={'boy'};
sem(4).feat={'person','agent','child','male','boy'};


%actions
sem(6).con={'drink_v'};
sem(6).feat={'action','drink_v'};
sem(7).con={'eat'};
sem(7).feat={'action','eat'};
sem(8).con={'feed'};
sem(8).feat={'action','feed'};
sem(9).con={'fish'};
sem(9).feat={'action','fish'};
sem(10).con={'plant'};
sem(10).feat={'action','plant'};
sem(11).con={'water'};
sem(11).feat={'action','water'};
sem(12).con={'play'};
sem(12).feat={'action','play'};
sem(13).con={'wear'};
sem(13).feat={'action','wear'};
sem(14).con={'read'};
sem(14).feat={'action','read'};
sem(15).con={'write'};
sem(15).feat={'action','write'};
sem(16).con={'look_at'};
sem(16).feat={'action','look_at'};
sem(17).con={'like'};
sem(17).feat={'action','like'};

%locations
sem(18).con={'kitchen'};
sem(18).feat={'location','kitchen'};
sem(19).con={'living_room'};
sem(19).feat={'location','living_room'};
sem(20).con={'garden'};
sem(20).feat={'location','garden'};
sem(21).con={'lake'};
sem(21).feat={'location','lake'};


%situations 
sem(22).con={'breakfast'};
sem(22).feat={'situation','breakfast'};
sem(23).con={'dinner'};
sem(23).feat={'situation','dinner'};
sem(24).con={'excursion'};
sem(24).feat={'situation','excursion'};
sem(25).con={'afternoon'};
sem(25).feat={'situation','afternoon'};



%patients

%food and drinks

%food
sem(36).con={'egg'};
sem(36).feat={'consumeable','food','white','egg'};
sem(37).con={'toast'};
sem(37).feat={'consumeable','food','brown','toast'};

sem(38).con={'soup'};
sem(38).feat={'consumeable','food','in_bowl','soup'};
sem(39).con={'pizza'};
sem(39).feat={'consumeable','food','round','pizza'};
sem(40).con={'salad'};
sem(40).feat={'consumeable','food','light','salad'};

%drinks 
%evening drinks 
sem(41).con={'iced_tea'};
sem(41).feat={'consumeable','drink','from_leaves','iced_tea'};
sem(42).con={'juice'};
sem(42).feat={'consumeable','drink','from_fruit','juice'};
sem(43).con={'lemonade'};
sem(43).feat={'consumeable','drink','sweet','lemonade'};
%morning drinks 
sem(44).con={'cacao'};
sem(44).feat={'consumeable','drink','with_chocolate','cacao'};
sem(45).con={'tea'};
sem(45).feat={'consumeable','drink','hot','tea'};

%artifacts
%games
sem(46).con={'chess'};
sem(46).feat={'game','entertaining','strategic','chess'};
sem(47).con={'monopoly'};
sem(47).feat={'game','entertaining','with_dice','monopoly'};
sem(48).con={'backgammon'};
sem(48).feat={'game','entertaining','old','backgammon'};

%garments
sem(49).con={'jeans'};
sem(49).feat={'garment','to_cover_body','for_legs','jeans'}; 
sem(50).con={'shirt'};
sem(50).feat={'garment','to_cover_body','for_upper_part','shirt'};
sem(51).con={'pajamas'};
sem(51).feat={'garment','to_cover_body','for_night','pajamas'};


%reading/writing things
sem(54).con={'novel'};
sem(54).feat={'contains_language','contains_letters','art','novel'};
sem(55).con={'email'};
sem(55).feat={'contains_language','contains_letters','communication_digital','email'};
sem(56).con={'sms'};
sem(56).feat={'contains_language','contains_letters','communication_short','sms'};
sem(57).con={'paper'};
sem(57).feat={'contains_language','contains_letters','scientific','paper'};
sem(58).con={'newspaper'};
sem(58).feat={'contains_language','contains_letters','information','newspaper'};
sem(59).con={'letter'};
sem(59).feat={'contains_language','contains_letters','communication_paper','letter'};

%living things
%flowers
sem(60).con={'rose'};
sem(60).feat={'can_grow','has_roots','has_petals','red','rose'};
sem(61).con={'daisy'};
sem(61).feat={'can_grow','has_roots','has_petals','yellow','daisy'};
sem(62).con={'tulip'};
sem(62).feat={'can_grow','has_roots','has_petals','colorful','tulip'};
%trees
sem(63).con={'pine'};
sem(63).feat={'can_grow','has_roots','has_bark','green','pine'};
sem(64).con={'oak'};
sem(64).feat={'can_grow','has_roots','has_bark','tall','oak'};
sem(65).con={'birch'};
sem(65).feat={'can_grow','has_roots','has_bark','white_bark','birch'};
%birds
sem(66).con={'robin'};
sem(66).feat={'can_grow','can_move','can_fly','red','robin'};
sem(67).con={'canary'};
sem(67).feat={'can_grow','can_move','can_fly','yellow','canary'};
sem(68).con={'sparrow'};
sem(68).feat={'can_grow','can_move','can_fly','brown','sparrow'};
%fish
sem(69).con={'sunfish'};
sem(69).feat={'can_grow','can_move','can_swim','yellow','sunfish'};
sem(70).con={'salmon'};
sem(70).feat={'can_grow','can_move','can_swim','red','salmon'};
sem(71).con={'eel'};
sem(71).feat={'can_grow','can_move','can_swim','long','eel'};

%function words
sem(72).con={'during'};
sem(72).feat={};
sem(73).con={'at'};
sem(73).feat={};
sem(74).con={'was'};
sem(74).feat={''};
sem(75).con={'by'};
sem(75).feat={};
sem(76).con={'with'};
sem(76).feat={};

%more loc
sem(78).con={'park'};
sem(78).feat={'location','park'};
sem(79).con={'balkony'};
sem(79).feat={'location','balkony'};
sem(80).con={'office'};
sem(80).feat={'location','office'};
sem(81).con={'backyard'};
sem(81).feat={'location','backyard'};
sem(82).con={'veranda'};
sem(82).feat={'location','veranda'};
sem(83).con={'bedroom'};
sem(83).feat={'location','bedroom'};

sem(84).con={'cereals'}; 
sem(84).feat={'consumeable','food','healthy','cereals'};
sem(85).con={'coffee'}; 
sem(85).feat={'consumeable','drink','activating','coffee'};

sem(86).con={'holiday'};
sem(86).feat={'situation','holiday'};
sem(87).con={'sunday'};
sem(87).feat={'situation','sunday'};
sem(88).con={'morning'};
sem(88).feat={'situation','morning'};
sem(89).con={'evening'};
sem(89).feat={'situation','evening'};






for n = 1:length(sem) 
    sem(n).vec = zeros(1,length(all_feat));
end

for i = 1:length(sem) 
    a = zeros(length(sem(i).feat),length(all_feat));
    for j = 1:length(all_feat)
        for k = 1:length(sem(i).feat)
            a(k,j) = strcmp(sem(i).feat(k), all_feat(j));
            %sem(i).vec(1,j) = strcmp(sem(i).feat(k), all_feat(j))
        end
    end
    sem(i).vec = sum(a); 
end

m = zeros(length(sem),length(all_feat)); 
for l = 1:length(sem)
    m(l,:) = sem(l).vec;
end

