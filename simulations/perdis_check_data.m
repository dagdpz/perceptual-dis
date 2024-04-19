function perdis_check_data(datapath, stimulus_type)

load(datapath);

switch stimulus_type
    
    case 'SS'
        
    case 'DSS'
        
    case 'DDS'

        N_trials_pre_contra = Data.Hit.difficult.contra.pre + Data.Miss.difficult.contra.pre + Data.FA.difficult.ipsi.pre;
        N_trials_post_contra = Data.Hit.difficult.contra.post + Data.Miss.difficult.contra.post + Data.FA.difficult.ipsi.post;

        N_trials_pre_ipsi = Data.Hit.difficult.ipsi.pre + Data.Miss.difficult.ipsi.pre + Data.FA.difficult.contra.pre;
        N_trials_post_ipsi = Data.Hit.difficult.ipsi.post + Data.Miss.difficult.ipsi.post + Data.FA.difficult.contra.post;

        H(1) = mean(Data.Hit.difficult.contra.pre./N_trials_pre_contra);
        M(1) = mean(Data.Miss.difficult.contra.pre./N_trials_pre_contra);
        FA(1) = mean(Data.FA.difficult.contra.pre./N_trials_pre_contra);

        H(2) = mean(Data.Hit.difficult.ipsi.pre./N_trials_pre_ipsi);
        M(2) = mean(Data.Miss.difficult.ipsi.pre./N_trials_pre_ipsi);
        FA(2) = mean(Data.FA.difficult.ipsi.pre./N_trials_pre_ipsi);

        H(3) = mean(Data.Hit.difficult.contra.post./N_trials_post_contra);
        M(3) = mean(Data.Miss.difficult.contra.post./N_trials_post_contra);
        FA(3) = mean(Data.FA.difficult.contra.post./N_trials_post_contra);

        H(4) = mean(Data.Hit.difficult.ipsi.post./N_trials_post_ipsi);
        M(4) = mean(Data.Miss.difficult.ipsi.post./N_trials_post_ipsi);
        FA(4) = mean(Data.FA.difficult.ipsi.post./N_trials_post_ipsi);

        CR(1) = FA(2);
        CR(2) = FA(1);
        CR(3) = FA(4);
        CR(4) = FA(3);
        
end

H
M
FA
CR