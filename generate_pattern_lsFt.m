%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
age1_uplim = 26;
age2_lowlim = 25;
age2_uplim = 51;
age3_lowlim = 50;
age3_uplim = 76;
age4_lowlim = 75;
age4_uplim = 101;

num_input = 89;
num_output = 133;
num_feat = 128;
num_feat_plus1 = 129;

pat1_uplim = 71;
pat2_lowlim = 70;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%constituents
constituent1 = zeros(1,num_input); 
constituent2 = zeros(1,num_input);
constituent3 = zeros(1,num_input);
constituent4 = zeros(1,num_input);
constituent5 = zeros(1,num_input);
constituent6 = zeros(1,num_input);
constituent7 = zeros(1,num_input);

constituentBlank = zeros(1,num_input);

%give roles to probe for fillers 
role_act        = zeros(1,num_output); 
role_act(1,num_feat+1) = 1;
role_age        = zeros(1,num_output);
role_age(1,num_feat+2) = 1;
role_pat        = zeros(1,num_output);
role_pat(1,num_feat+3) = 1;
role_loc        = zeros(1,num_output);
role_loc(1,num_feat+4) = 1;
role_sit        = zeros(1,num_output);
role_sit(1,num_feat+5) = 1;


%give fillers to probe for roles
filler_act    = zeros(1,num_output);
filler_age    = zeros(1,num_output);
filler_pat    = zeros(1,num_output);
filler_loc    = zeros(1,num_output);
filler_sit    = zeros(1,num_output);


%role_filler
role_filler_act   = zeros(1,num_output);
role_filler_age   = zeros(1,num_output);
role_filler_pat   = zeros(1,num_output);
role_filler_loc   = zeros(1,num_output);
role_filler_sit   = zeros(1,num_output);





loc_c = 1; %always show location constituent
sit = 0; %decide below which situation
sit_c = 0; %decide below whether to show situation constituent
ins_c = 2; %never show instrument
cop_c = 2; %never show co-patient
pas = 0; %decide below whether to present sentence in passive voice



       
       
if act == 1 %"wear"
    roles = [1 2 3 4]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    c = 5; % fixed number of constituents
   
   constituent2(13) = 1;
   filler_act(1,1:num_feat)=sem(13).vec;%wear

    if age < age1_uplim %choose agent       
        constituent1(2) = 1;
        filler_age(1,1:num_feat)=sem(2).vec;%he
    elseif (age > age2_lowlim) && (age < age2_uplim) 
        constituent1(1) = 1;
        filler_age(1,1:num_feat)=sem(1).vec;%she
    elseif (age > age3_lowlim) && (age < age3_uplim) 
        constituent1(3) = 1;
        filler_age(1,1:num_feat)=sem(3).vec;%girl
    elseif (age > age4_lowlim) && (age < age4_uplim) 
        constituent1(4) = 1;
        filler_age(1,1:num_feat)=sem(4).vec;%boy
    end
              
            if pat > pat2_lowlim
                constituent3(49) = 1;
                filler_pat(1,1:num_feat)=sem(49).vec;%jeans           
            elseif pat < pat1_uplim
                constituent3(50) = 1;
                filler_pat(1,1:num_feat)=sem(50).vec;%shirt              
            end
                    
    
            filler_loc(1,1:num_feat)=sem(80).vec;%office
            constituent4(80)=1;
            constituent4(73)=1; %at/in... location-marker

            
    
    
 

elseif act == 2; %eat
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       c = 1; %initiate constituent counter
       sit = randi(2,1); %which situation?
       sit_c = randi(2,1); %present situation constituent?
       pas = randi(100,1); %passive voice?

                         
       
       if sit == 1
           filler_sit(1,1:num_feat)=sem(22).vec;%breakfast
           if sit_c == 1
               constituent1(22) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < age1_uplim 
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
           elseif (age > age4_lowlim)&&(age < age4_uplim) 
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end          
           end
           c = c+1;
              
                    filler_act(1,1:num_feat)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(36).vec;%eggs
                                   if c == 3            %alle m�gl? vielleicht besser nur die realistischen
                                        constituent3(36)=1;
                                    elseif c == 4
                                        constituent4(36)=1;
                                   end
                                   
                                elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(37).vec;%toast                 
                                    if c == 3            %alle m�gl? vielleicht besser nur die realistischen
                                        constituent3(37)=1;
                                    elseif c == 4
                                        constituent4(37)=1;
                                    end
                                end
                                c = c+1;

                                       
                                        filler_loc(1,1:num_feat)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end

                                    
 
        
       elseif sit == 2
           filler_sit(1,1:num_feat)=sem(23).vec;%dinner
           if sit_c == 1
               constituent1(23) = 1;
               constituent1(72) = 1;%during
               c = c + 1;
           end

           if age < age1_uplim %irgendwo w�rfeln, entweder hier oder noch im gestalt_driver
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
           elseif (age > age4_lowlim)&&(age < age4_uplim) %irgendwo w�rfeln, entweder hier oder noch im gestalt_driver
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1;

              
                    filler_act(1,1:num_feat)=sem(7).vec;%eat 
                        if c == 2            %alle m�gl? vielleicht besser nur die realistischen
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(39).vec;%pizza
                                   if c == 3           
                                        constituent3(39)=1;
                                    elseif c == 4
                                        constituent4(39)=1;
                                   end
                                elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(38).vec;%soup                 
                                    if c == 3            %alle m�gl? vielleicht besser nur die realistischen
                                        constituent3(38)=1;
                                    elseif c == 4
                                        constituent4(38)=1;
                                    end
                                end
                                c = c+1; 

                                        filler_loc(1,1:num_feat)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end

                               
                                                                      
           end

       
                   
                  
                   
     if pas > 90 %sentence in passive voice
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           

           filler_act(1,1)=1;%passive unit

           if sit_c == 1 %situation presented 

               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1;

           elseif sit_c == 2 %situation not presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; 
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
       
       
elseif act == 3; %drink
       roles = [1 2 3 4 5];   %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                 
       pas = randi(100,1);
       c = 1; %initiate constituent counter
       sit = randi(2,1); 
       sit_c = randi(2,1);

       
       if sit == 1
           filler_sit(1,1:num_feat)=sem(88).vec;%morning
           if sit_c == 1
               constituent1(88) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < age1_uplim
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
           elseif (age > age4_lowlim)&&(age < age4_uplim)
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1;

              
                    filler_act(1,1:num_feat)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(45).vec;%tea
                                   if c == 3            
                                        constituent3(45)=1;
                                    elseif c == 4
                                        constituent4(45)=1;
                                   end
                                elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(44).vec;%cacao                 
                                    if c == 3            %alle m�gl? vielleicht besser nur die realistischen
                                        constituent3(44)=1;
                                    elseif c == 4
                                        constituent4(44)=1;
                                    end
                                end
                                c = c+1; 

                                        
                                        filler_loc(1,1:num_feat)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end


       elseif sit == 2
           filler_sit(1,1:num_feat)=sem(89).vec;%evening
           if sit_c == 1
               constituent1(89) = 1;
               constituent1(72) = 1;%during
               c = c + 1;
           end

           if age < age1_uplim %irgendwo w�rfeln, entweder hier oder noch im gestalt_driver
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
           elseif (age > age4_lowlim)&&(age < age4_uplim) %irgendwo w�rfeln, entweder hier oder noch im gestalt_driver
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1;

              
                    filler_act(1,1:num_feat)=sem(6).vec;%drink 
                        if c == 2            %alle m�gl? vielleicht besser nur die realistischen
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> pat2_lowlim 
                                   filler_pat(1,1:num_feat)=sem(42).vec;%juice
                                   if c == 3           
                                        constituent3(42)=1;
                                    elseif c == 4
                                        constituent4(42)=1;
                                   end
                                    c = c+1;
                                elseif pat < pat1_uplim 
                                    filler_pat(1,1:num_feat)=sem(41).vec;%iced_tea                 
                                    if c == 3            
                                        constituent3(41)=1;
                                    elseif c == 4
                                        constituent4(41)=1;
                                    end
                                end
                                c = c+1; 

                                        filler_loc(1,1:num_feat)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                                                                         
                                                            
           end                                 
                   
     if pas > 90 %sentence in passive voice
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           
           filler_act(1,1)=1; %activate passive voice unit in the output

           if sit_c == 1 %situation presented
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 
               
           elseif sit_c == 2 %no situation presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; 
               constituent3 = active_constituent1;
               constituent3(75)=1;
           end
     end
       
     
elseif act == 4 %"play"
    roles = [1 2 3 4]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                  
    c = 5; % fixed number of constituents
    
    constituent2(12) = 1;
    filler_act(1,1:num_feat)=sem(12).vec;%play

    if age < age1_uplim %choose agent        
        constituent1(2) = 1;
        filler_age(1,1:num_feat)=sem(2).vec;%he
    elseif (age > age2_lowlim) && (age < age2_uplim) 
        constituent1(1) = 1;
        filler_age(1,1:num_feat)=sem(1).vec;%she
    elseif (age > age3_lowlim) && (age < age3_uplim) 
        constituent1(3) = 1;
        filler_age(1,1:num_feat)=sem(3).vec;%girl
    elseif (age > age4_lowlim)&&(age < age4_uplim) %choose agent
        constituent1(4) = 1;
        filler_age(1,1:num_feat)=sem(4).vec;%boy
    end
              
            if pat < pat1_uplim
                constituent3(46) = 1;
                filler_pat(1,1:num_feat)=sem(46).vec;%chess
            elseif pat > pat2_lowlim
                constituent3(47) = 1;
                filler_pat(1,1:num_feat)=sem(47).vec;%monopoly
            end

                   filler_loc(1,1:num_feat)=sem(19).vec;%living room       
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
  

                    
                   
elseif act == 5 %"read"
    roles = [1 2 3 4];   %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    c = 5; % fixed number of constituents
    constituent2(14) = 1;
    filler_act(1,1:num_feat)=sem(14).vec;%read

    if age < age1_uplim %choose agent        
        constituent1(2) = 1;
        filler_age(1,1:num_feat)=sem(2).vec;%he
    elseif (age > age2_lowlim) && (age < age2_uplim) 
        constituent1(1) = 1;
        filler_age(1,1:num_feat)=sem(1).vec;%she
    elseif (age > age3_lowlim) && (age < age3_uplim) 
        constituent1(3) = 1;
        filler_age(1,1:num_feat)=sem(3).vec;%girl
     elseif (age > age4_lowlim)&&(age < age4_uplim) 
        constituent1(4) = 1;
        filler_age(1,1:num_feat)=sem(4).vec;%boy
    end
              
            if pat < pat1_uplim 
                constituent3(54) = 1;
                filler_pat(1,1:num_feat)=sem(54).vec;%novel 
            elseif pat > pat2_lowlim
                constituent3(58) = 1;
                filler_pat(1,1:num_feat)=sem(58).vec;%newspaper
            end
           
                   filler_loc(1,1:num_feat)=sem(83).vec;%bedroom          
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
 
            
                          
                 
elseif act == 6 %"write"
    roles = [1 2 3 4];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                   
    c = 5; % fixed number of constituents
    
    constituent2(15) = 1;
    filler_act(1,1:num_feat)=sem(15).vec;%write

    if age < age1_uplim %choose agent        
        constituent1(2) = 1;
        filler_age(1,1:num_feat)=sem(2).vec;%he
    elseif (age > age2_lowlim) && (age < age2_uplim) 
        constituent1(1) = 1;
        filler_age(1,1:num_feat)=sem(1).vec;%she
    elseif (age > age3_lowlim) && (age < age3_uplim) 
        constituent1(3) = 1;
        filler_age(1,1:num_feat)=sem(3).vec;%girl
    elseif (age > age4_lowlim) && (age < age4_uplim) 
        constituent1(4) = 1;
        filler_age(1,1:num_feat)=sem(4).vec;%boy
    end
              
            if pat < pat1_uplim 
                constituent3(55) = 1;
                filler_pat(1,1:num_feat)=sem(55).vec;%email
            elseif pat > pat2_lowlim
                constituent3(56) = 1;
                filler_pat(1,1:num_feat)=sem(56).vec;%sms 
            end
                        
                   
                   filler_loc(1,1:num_feat)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker
                       
    

                   
 
 elseif act == 7; %feed
       roles = [1 2 3 4 5];%1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                  
       pas = randi(100,1);
       c = 1; %initiate constituent counter
       sit_c = randi(2,1);
       
       

           filler_sit(1,1:num_feat)=sem(86).vec;%holiday
           if sit_c == 1
               constituent1(86) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < age1_uplim 
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
          elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
          elseif (age > age4_lowlim)&&(age < age4_uplim)
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1; 

              
                    filler_act(1,1:num_feat)=sem(8).vec;%feed 
                        if c == 2            
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                end
                                c = c+1;

                                    filler_loc(1,1:num_feat)=sem(78).vec;%park
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(78)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(78)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                                                     


       if pas > 90 %sentence in passive voice
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_act(1,1)=1; %activate passive voice unit in the output

           
           if sit_c == 1 %situation presented

               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 %no situation presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; 
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
                   
 elseif act == 8; %fish
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                    
       pas = randi(100,1);
       c = 1; %initiate constituent counter 
       sit_c = randi(2,1);

           filler_sit(1,1:num_feat)=sem(24).vec;%excursion
           if sit_c == 1
               constituent1(24) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < age1_uplim 
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
            elseif (age > age4_lowlim)&&(age < age4_uplim)
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1; 
              
                    filler_act(1,1:num_feat)=sem(9).vec;%fish 
                        if c == 2            
                            constituent2(9)=1;
                        elseif c == 3
                            constituent3(9)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(70).vec;%salmon
                                   if c == 3            
                                        constituent3(70)=1;
                                    elseif c == 4
                                        constituent4(70)=1;
                                   end
                                 elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(69).vec;%sunfish                 
                                    if c == 3            
                                        constituent3(69)=1;
                                    elseif c == 4
                                        constituent4(69)=1;
                                    end
                                end
                                c = c+1; 

                                        filler_loc(1,1:num_feat)=sem(21).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(21)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(21)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                                     
            

       if pas > 90 %sentence in passive voice
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;
           
           filler_act(1,1)=1; %activate passive voice unit in the output
           
           if sit_c == 1 %situation presented
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 %no situation presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; 
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
       
       
 elseif act == 9; %plant
       roles = [1 2 3 4 5];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                 
       pas = randi(100,1);
       c = 1; %initiate constituent counter
       sit_c = randi(2,1);

           filler_sit(1,1:num_feat)=sem(87).vec;%sunday
           if sit_c == 1
               constituent1(87) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < age1_uplim 
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
           elseif (age > age4_lowlim)&&(age < age4_uplim)
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1; 

              
                    filler_act(1,1:num_feat)=sem(10).vec;%plant 
                        if c == 2            
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(60).vec;%rose
                                   if c == 3            
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                 elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                end
                                c = c+1;

                                    filler_loc(1,1:num_feat)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end                       
                   
         if pas > 90 %sentence in passive voice
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;
           
           filler_act(1,1)=1; %activate passive voice unit in the output
           
           if sit_c == 1 %situation presented

               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 
               
           elseif sit_c == 2 %no situation presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; 
               constituent3 = active_constituent1;
               constituent3(75)=1;
           end
         end
       
         
  elseif act == 10; %water %%%%%%%%%
       roles = [1 2 3 4 5];%1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                     
       pas = randi(100,1);
       c = 1; %initiate constituent counter
       sit_c = randi(2,1);

           filler_sit(1,1:num_feat)=sem(25).vec;%afternoon
           if sit_c == 1
               constituent1(25) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < age1_uplim 
              filler_age(1,1:num_feat)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
           elseif (age > age2_lowlim)&&(age < age2_uplim)
              filler_age(1,1:num_feat)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
           elseif (age > age3_lowlim)&&(age < age3_uplim)
              filler_age(1,1:num_feat)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
           elseif (age > age4_lowlim)&&(age < age4_uplim)
              filler_age(1,1:num_feat)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
           end
           c = c+1; 

              
                    filler_act(1,1:num_feat)=sem(11).vec;%water 
                        if c == 2            
                            constituent2(11)=1;
                        elseif c == 3
                            constituent3(11)=1;
                        end
                        c = c+1;
                 
                                if pat< pat1_uplim 
                                   filler_pat(1,1:num_feat)=sem(63).vec;%pine
                                   if c == 3            
                                        constituent3(63)=1;
                                    elseif c == 4
                                        constituent4(63)=1;
                                   end
                                elseif pat > pat2_lowlim 
                                    filler_pat(1,1:num_feat)=sem(64).vec;%oak                 
                                    if c == 3            
                                        constituent3(64)=1;
                                    elseif c == 4
                                        constituent4(64)=1;
                                    end
                                end
                                c = c+1;
 
                                    filler_loc(1,1:num_feat)=sem(81).vec;%backyard
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(81)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(81)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       

                
       if pas > 90 %sentence in passive voice
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           
           filler_act(1,1)=1; %activate passive voice unit in the output
           
           if sit_c == 1 %situation presented
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 %no situation presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; 
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
       
       
elseif act == 11 %look at
            roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                   
            c = 4;
            pat = randi(36,1);
            
            constituent2(16) = 1;
            filler_act(1,1:num_feat)=sem(16).vec;%look at
            
            if age < age1_uplim
               constituent1(1)=1;
               filler_age(1,1:num_feat)=sem(1).vec;
            elseif (age > age2_lowlim)&&(age<age2_uplim)
              constituent1(2)=1;
              filler_age(1,1:num_feat)=sem(2).vec;
            elseif (age > age3_lowlim)&&(age<age3_uplim)
              constituent1(3)=1;
              filler_age(1,1:num_feat)=sem(3).vec;
            elseif (age > age4_lowlim)&&(age < age4_uplim)
             constituent1(4)=1;
             filler_age(1,1:num_feat)=sem(4).vec;
            end
            
                if pat == 1
                    constituent3(36)=1; %
                    filler_pat(1,1:num_feat)=sem(36).vec;
                elseif pat == 2
                    constituent3(37)=1; %
                    filler_pat(1,1:num_feat)=sem(37).vec;
                elseif pat == 3
                    constituent3(38)=1; %
                    filler_pat(1,1:num_feat)=sem(38).vec;
                elseif pat == 4
                    constituent3(39)=1; %
                    filler_pat(1,1:num_feat)=sem(39).vec;
                elseif pat == 5
                    constituent3(40)=1; %
                    filler_pat(1,1:num_feat)=sem(40).vec;
                elseif pat == 6
                    constituent3(41)=1; %
                    filler_pat(1,1:num_feat)=sem(41).vec;
                elseif pat == 7
                    constituent3(42)=1; %
                    filler_pat(1,1:num_feat)=sem(42).vec;
                elseif pat == 8
                    constituent3(43)=1; %
                    filler_pat(1,1:num_feat)=sem(43).vec;
                elseif pat == 9
                    constituent3(44)=1; %
                    filler_pat(1,1:num_feat)=sem(44).vec;
                elseif pat == 10
                    constituent3(45)=1; %
                    filler_pat(1,1:num_feat)=sem(45).vec;
                elseif pat == 11
                    constituent3(46)=1; %
                    filler_pat(1,1:num_feat)=sem(46).vec;
                elseif pat == 12
                    constituent3(47)=1; %
                    filler_pat(1,1:num_feat)=sem(47).vec;
                elseif pat == 13
                    constituent3(48)=1; %
                    filler_pat(1,1:num_feat)=sem(48).vec;
                elseif pat == 14
                    constituent3(49)=1; %
                    filler_pat(1,1:num_feat)=sem(49).vec;
                elseif pat == 15
                    constituent3(50)=1; %
                    filler_pat(1,1:num_feat)=sem(50).vec;
                elseif pat == 16
                    constituent3(51)=1; %
                    filler_pat(1,1:num_feat)=sem(51).vec;

                elseif pat == 17
                    constituent3(84)=1; %cereals (for catviol)
                    filler_pat(1,1:num_feat)=sem(84).vec;
                elseif pat == 18
                    constituent3(85)=1; %coffee (for catviol)
                    filler_pat(1,1:num_feat)=sem(85).vec;
                elseif pat == 19
                    constituent3(54)=1; %
                    filler_pat(1,1:num_feat)=sem(54).vec;
                elseif pat == 20
                    constituent3(55)=1; %
                    filler_pat(1,1:num_feat)=sem(55).vec;
                elseif pat == 21
                    constituent3(56)=1; %
                    filler_pat(1,1:num_feat)=sem(56).vec;
                elseif pat == 22
                    constituent3(57)=1; %
                    filler_pat(1,1:num_feat)=sem(57).vec;
                elseif pat == 23
                    constituent3(58)=1; %
                    filler_pat(1,1:num_feat)=sem(58).vec;
                elseif pat == 24
                    constituent3(59)=1; %
                    filler_pat(1,1:num_feat)=sem(59).vec;
                elseif pat == 25
                    constituent3(60)=1; %
                    filler_pat(1,1:num_feat)=sem(60).vec;
                elseif pat == 26
                    constituent3(61)=1; %
                    filler_pat(1,1:num_feat)=sem(61).vec;
                elseif pat == 27
                    constituent3(62)=1; %
                    filler_pat(1,1:num_feat)=sem(62).vec;
                elseif pat == 28
                    constituent3(63)=1; %
                    filler_pat(1,1:num_feat)=sem(63).vec;
                elseif pat == 29
                    constituent3(64)=1; %
                    filler_pat(1,1:num_feat)=sem(64).vec;
                elseif pat == 30
                    constituent3(65)=1; %
                    filler_pat(1,1:num_feat)=sem(65).vec;
                elseif pat == 31
                    constituent3(66)=1; %
                    filler_pat(1,1:num_feat)=sem(66).vec;
                elseif pat == 32
                    constituent3(67)=1; %
                    filler_pat(1,1:num_feat)=sem(67).vec;
                elseif pat == 33
                    constituent3(68)=1; %
                    filler_pat(1,1:num_feat)=sem(68).vec;
                elseif pat == 34
                    constituent3(69)=1; %
                    filler_pat(1,1:num_feat)=sem(69).vec;
                elseif pat == 35
                    constituent3(70)=1; %
                    filler_pat(1,1:num_feat)=sem(70).vec;
                elseif pat == 36
                    constituent3(71)=1; %
                    filler_pat(1,1:num_feat)=sem(71).vec;

                end
        
                          
                    
elseif act == 12 %like
            roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop                   
            c = 4;
            pat = randi(36,1);
            constituent2(17) = 1;
            filler_act(1,1:num_feat)=sem(17).vec;%like
            
            if age < age1_uplim
               constituent1(1)=1;
               filler_age(1,1:num_feat)=sem(1).vec;
            elseif (age > age2_lowlim)&&(age<age2_uplim)
              constituent1(2)=1;
              filler_age(1,1:num_feat)=sem(2).vec;
            elseif (age > age3_lowlim)&&(age<age3_uplim)
              constituent1(3)=1;
              filler_age(1,1:num_feat)=sem(3).vec;
            elseif (age > age4_lowlim)&&(age < age4_uplim)
             constituent1(4)=1;
             filler_age(1,1:num_feat)=sem(4).vec;
            end
            
           
                if pat == 1
                    constituent3(36)=1; %
                    filler_pat(1,1:num_feat)=sem(36).vec;
                elseif pat == 2
                    constituent3(37)=1; %
                    filler_pat(1,1:num_feat)=sem(37).vec;
                elseif pat == 3
                    constituent3(38)=1; %
                    filler_pat(1,1:num_feat)=sem(38).vec;
                elseif pat == 4
                    constituent3(39)=1; %
                    filler_pat(1,1:num_feat)=sem(39).vec;
                elseif pat == 5
                    constituent3(40)=1; %
                    filler_pat(1,1:num_feat)=sem(40).vec;
                elseif pat == 6
                    constituent3(41)=1; %
                    filler_pat(1,1:num_feat)=sem(41).vec;
                elseif pat == 7
                    constituent3(42)=1; %
                    filler_pat(1,1:num_feat)=sem(42).vec;
                elseif pat == 8
                    constituent3(43)=1; %
                    filler_pat(1,1:num_feat)=sem(43).vec;
                elseif pat == 9
                    constituent3(44)=1; %
                    filler_pat(1,1:num_feat)=sem(44).vec;
                elseif pat == 10
                    constituent3(45)=1; %
                    filler_pat(1,1:num_feat)=sem(45).vec;
                elseif pat == 11
                    constituent3(46)=1; %
                    filler_pat(1,1:num_feat)=sem(46).vec;
                elseif pat == 12
                    constituent3(47)=1; %
                    filler_pat(1,1:num_feat)=sem(47).vec;
                elseif pat == 13
                    constituent3(48)=1; %
                    filler_pat(1,1:num_feat)=sem(48).vec;
                elseif pat == 14
                    constituent3(49)=1; %
                    filler_pat(1,1:num_feat)=sem(49).vec;
                elseif pat == 15
                    constituent3(50)=1; %
                    filler_pat(1,1:num_feat)=sem(50).vec;
                elseif pat == 16
                    constituent3(51)=1; %
                    filler_pat(1,1:num_feat)=sem(51).vec;

                elseif pat == 17
                    constituent3(84)=1; %cereals (for catviol)
                    filler_pat(1,1:num_feat)=sem(84).vec;
                elseif pat == 18
                    constituent3(85)=1; %coffee (for catviol)
                    filler_pat(1,1:num_feat)=sem(85).vec;
                elseif pat == 19
                    constituent3(54)=1; %
                    filler_pat(1,1:num_feat)=sem(54).vec;
                elseif pat == 20
                    constituent3(55)=1; %
                    filler_pat(1,1:num_feat)=sem(55).vec;
                elseif pat == 21
                    constituent3(56)=1; %
                    filler_pat(1,1:num_feat)=sem(56).vec;
                elseif pat == 22
                    constituent3(57)=1; %
                    filler_pat(1,1:num_feat)=sem(57).vec;
                elseif pat == 23
                    constituent3(58)=1; %
                    filler_pat(1,1:num_feat)=sem(58).vec;
                elseif pat == 24
                    constituent3(59)=1; %
                    filler_pat(1,1:num_feat)=sem(59).vec;
                elseif pat == 25
                    constituent3(60)=1; %
                    filler_pat(1,1:num_feat)=sem(60).vec;
                elseif pat == 26
                    constituent3(61)=1; %
                    filler_pat(1,1:num_feat)=sem(61).vec;
                elseif pat == 27
                    constituent3(62)=1; %
                    filler_pat(1,1:num_feat)=sem(62).vec;
                elseif pat == 28
                    constituent3(63)=1; %
                    filler_pat(1,1:num_feat)=sem(63).vec;
                elseif pat == 29
                    constituent3(64)=1; %
                    filler_pat(1,1:num_feat)=sem(64).vec;
                elseif pat == 30
                    constituent3(65)=1; %
                    filler_pat(1,1:num_feat)=sem(65).vec;
                elseif pat == 31
                    constituent3(66)=1; %
                    filler_pat(1,1:num_feat)=sem(66).vec;
                elseif pat == 32
                    constituent3(67)=1; %
                    filler_pat(1,1:num_feat)=sem(67).vec;
                elseif pat == 33
                    constituent3(68)=1; %
                    filler_pat(1,1:num_feat)=sem(68).vec;
                elseif pat == 34
                    constituent3(69)=1; %
                    filler_pat(1,1:num_feat)=sem(69).vec;
                elseif pat == 35
                    constituent3(70)=1; %
                    filler_pat(1,1:num_feat)=sem(70).vec;
                elseif pat == 36
                    constituent3(71)=1; %
                    filler_pat(1,1:num_feat)=sem(71).vec;

                end

            
end
    

role_filler_act= horzcat(filler_act(1,1:num_feat),role_act(1,num_feat_plus1:num_output));
role_filler_age= horzcat(filler_age(1,1:num_feat),role_age(1,num_feat_plus1:num_output));
role_filler_pat= horzcat(filler_pat(1,1:num_feat),role_pat(1,num_feat_plus1:num_output));
role_filler_loc= horzcat(filler_loc(1,1:num_feat),role_loc(1,num_feat_plus1:num_output));
role_filler_sit= horzcat(filler_sit(1,1:num_feat),role_sit(1,num_feat_plus1:num_output));


        
c = c - 1; 

%print sequence of constituents
ID = fopen ('sentence_lsFt.pat','w'); 
fprintf(ID,'sen1');
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituentBlank);

fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent1);
whole_sequence = cat(1,constituentBlank,constituent1);
if c > 1
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent2);
whole_sequence = cat(1,whole_sequence,constituent2);
end

if c > 2
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent3);
whole_sequence = cat(1,whole_sequence,constituent3);
end

if c > 3
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent4);
whole_sequence = cat(1,whole_sequence,constituent4);
end

if c > 4
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent5);
whole_sequence = cat(1,whole_sequence,constituent5);
end

if c > 5
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent6);
whole_sequence = cat(1,whole_sequence,constituent6);
end
csvwrite([num2str(act) '_' num2str(age) '_' num2str(pat) '_' 'WORD' '.csv'], whole_sequence)
fprintf(ID,'\nend\n');
fclose(ID);

%print role filler probes and output
ID2 = fopen('role_filler_lsFt.pat','w');

%fillers
fprintf(ID2,'\t');
fprintf(ID2,' %d',filler_act);
all_fillers = filler_act;
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_act);
all_fillers = cat(1,all_fillers,role_filler_act);
if find(roles == 2) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_age);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_age); 
all_fillers = cat(1,all_fillers,role_filler_age);
end

if find(roles == 3) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_pat);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_pat);
all_fillers = cat(1,all_fillers,role_filler_pat);
end

if find(roles == 4) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_loc);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_loc);
all_fillers = cat(1,all_fillers,role_filler_loc);
end

if find(roles == 5) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_sit);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_sit);
all_fillers = cat(1,all_fillers,role_filler_sit);
end

if find(roles == 6) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_ins);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_ins);
all_fillers = cat(1,all_fillers,role_filler_ins);
end

if find(roles == 7) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_cop);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_cop);
all_fillers = cat(1,all_fillers,role_filler_cop);
end

csvwrite([num2str(act) '_' num2str(age) '_' num2str(pat) '_' 'FILLER' '.csv'], all_fillers)
%roles

fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_act);
all_roles = role_act;
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_act);
all_roles = cat(1,all_roles,role_filler_act);
if find(roles == 2) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_age);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_age);
all_roles = cat(1,all_roles,role_filler_age);
end

if find(roles == 3) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_pat);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_pat);
all_roles = cat(1,all_roles,role_filler_pat);
end

if find(roles == 4) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_loc);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_loc);
all_roles = cat(1,all_roles,role_filler_loc);
end

if find(roles == 5) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_sit);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_sit);
all_roles = cat(1,all_roles,role_filler_sit);
end

if find(roles == 6) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_ins);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_ins);
all_roles = cat(1,all_roles,role_filler_ins);
end

if find(roles == 7) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_cop);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_cop);
all_roles = cat(1,all_roles,role_filler_cop);
end

csvwrite([num2str(act) '_' num2str(age) '_' num2str(pat) '_' 'ROLE' '.csv'], all_roles)
fprintf(ID2,'\n');
fclose(ID2);
