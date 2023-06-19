function [ H, M, FA, CR , Sensitvity_Change, StimulusType] = perdis_SetScenario_ForDPulvInacManuscript( NameScenario )
%% Which secenario you want to run? - Overview of all included Scenarios %%
%%%%%%% Single STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NameScenario = 'Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis';  
% NameScenario = 'Fig4A_SingleStimuli_DifficultDistr_ContraPerceptualDeficitHypothesis';
% NameScenario = 'Fig4B_SingleStimuli_EasyDistr_SelectionBiasHypothesis' 
% NameScenario = 'Fig4B_SingleStimuli_EasyDistr_ContraPerceptualDeficitHypothesis' 

%%%%%%% 2 Hemifields: DOUBLE SAME STIMULI  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NameScenario = 'Fig5A_DoubleSameStimuli_DiffDistr_SelectionBiasHypothesis';
% NameScenario = 'Fig5A_DoubleSameStimuli_DiffDistr_ContraPerceptualDeficitHypothesis_V1';
% NameScenario = 'Fig5B_DoubleSameStimuli_EasyDistr_SelectionBiasHypothesis'; 
% NameScenario = 'Fig5B_DoubleSameStimuli_EasyDistr_ContraPerceptualDeficitHypothesis';

%%%%%%% 2 Hemifields: DOUBLE DIFFERENT STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NameScenario = 'Fig6A_2HF_DoubleDifferentStimuli_DiffDistr_PerceptualDeficitHypothesis';
% NameScenario = 'Fig6A_2HF_DoubleDifferentStimuli_DiffDistr_SelectionBiasHypothesis'; 
% NameScenario = 'Fig6B_2HF_DoubleDifferentStimuli_EasyDistr_SelectionBiasHypothesis'; 
% NameScenario = 'Fig6B_2HF_DoubleDifferentStimuli_EasyDistr_PerceptualDeficitHypothesis';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Legend
%       contra | ispi
% pre     1       2
% post    3       4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch NameScenario
   
 
    case 'Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis';
        disp('Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change =0; 

        H(1)   = 0.7; 
        M(1)   = 0.3; 
        FA(1)  = 0.4;
        CR(1)  = 0.6;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        
        sb = 0.2;
        H(3)   = H(1)-sb;
        M(3)   = M(1)+sb;
        FA(3)  = FA(1)-sb;
        CR(3)  = CR(1)+sb;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
     case 'Fig4B_SingleStimuli_EasyDistr_SelectionBiasHypothesis';
        disp('Fig4B_SingleStimuli_EasyDistr_SelectionBiasHypothesis')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change =0; 

        
        H(1)   = 0.95; 
        M(1)   = 0.05; 
        FA(1)  = 0.05;
        CR(1)  = 0.95;
        
        H(2)   = 0.9;
        M(2)   = 0.1;
        FA(2)  = 0.1;
        CR(2)  = 0.9;
        
        sb = 0.2;
        H(3)   = H(1)-sb;
        M(3)   = M(1)+sb;
        FA(3)  = FA(1);
        CR(3)  = CR(1);
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2); 
        
    case 'Fig4B_SingleStimuli_EasyDistr_ContraPerceptualDeficitHypothesis';
        disp('Fig4B_SingleStimuli_EasyDistr_ContraPerceptualDeficitHypothesis')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change =1; 

        
        H(1)   = 0.95; 
        M(1)   = 0.05; 
        FA(1)  = 0.05;
        CR(1)  = 0.95;
        
        H(2)   = 0.9;
        M(2)   = 0.1;
        FA(2)  = 0.1;
        CR(2)  = 0.9;
        
        sb = 0.2;
        H(3)   = H(1)-sb;
        M(3)   = M(1)+sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)-sb;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);         
        
    case 'Fig4A_SingleStimuli_DifficultDistr_ContraPerceptualDeficitHypothesis';
        disp('Fig4A_SingleStimuli_DifficultDistr_ContraPerceptualDeficitHypothesis')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change = 1; 

        H(1)   = 0.7; 
        M(1)   = 0.3;
        FA(1)  = 0.3;
        CR(1)  = 0.7;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        
        sb = 0.2;
        H(3)   = H(1)-sb;
        M(3)   = M(1)+sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)-sb;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
        
   
        
            
    case 'DoubleSameStimuli_EasyDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
        disp('DoubleSameStimuli - EasyDiscr- Post: ipsi spatial Bias (Vers1,saccade), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 0; 
        
        % contra pre
        H(1)   = 0.45; %0.45;
        M(1)   = 0.01;
        FA(1)  = 0.01;
        CR(1)  = 0.94;
        
        % ipsi pre
        H(2)   = 0.54;
        M(2)   = M(1);
        FA(2)  = 0.05;
        CR(2)  = CR(1);
        
        sb = 0.27;
        % contra post
        H(3)   = H(1)- sb ; 
        M(3)   = M(1);
        FA(3)  = FA(1);
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)+ sb ;
        M(4)   = M(3);
        FA(4)  = FA(2);
        CR(4)  = CR(3);
           
    case 'Fig5A_DoubleSameStimuli_DiffDistr_SelectionBiasHypothesis';
        disp('Fig5A_DoubleSameStimuli_DiffDistr_SelectionBiasHypothesis')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 0; 
        % contra pre
        H(1)   = 0.49; 
        M(1)   = 0.01;
        FA(1)  = 0.3;
        CR(1)  = 0.5;
        
        % ipsi pre
        H(2)   = 0.50;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.19;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1) ;
        FA(3)  = FA(1)- sb; 
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb ;  
        M(4)   = M(3)- (sb/5) ;%move the ipsi-point that its not overlapping
        FA(4)  = FA(2)+ sb ;
        CR(4)  = CR(3)- (sb/5) ;

     case 'Fig5A_DoubleSameStimuli_DiffDistr_ContraPerceptualDeficitHypothesis_V1';
        disp('Fig5A_DoubleSameStimuli_DiffDistr_ContraPerceptualDeficitHypothesis_V1')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 1; 
        % perceptual deficit: increasing errors
        %
        % contra pre
        H(1)   = 0.49;
        M(1)   = 0.01;
        FA(1)  = 0.35;
        CR(1)  = 0.4;
        
        % ipsi pre
        H(2)   = 0.50;
        M(2)   = M(1);
        FA(2)  = 0.25;
        CR(2)  = CR(1);
        
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1)+ sb; %contra fixation
        FA(3)  = FA(1)+ sb;%contra Saccade
        CR(3)  = CR(1)- sb; %- sb;
        
        % ispi post
        H(4)   = H(2); %- (sb/5) ; %visual display changes
        M(4)   = M(3); %+ (sb/5); %visual display changes
        FA(4)  = FA(2);  %- (sb/5); %visual display changes
        CR(4)  = CR(3); %+ (sb/5); %visual display changes
        
    case 'Fig5A_DoubleSameStimuli_DiffDistr_ContraPerceptualDeficitHypothesis';
        disp('Fig5A_DoubleSameStimuli_DiffDistr_ContraPerceptualDeficitHypothesis')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 1; 

        % contra pre
        H(1)   = 0.49;
        M(1)   = 0.01;
        FA(1)  = 0.35;
        CR(1)  = 0.4;
        
        % ipsi pre
        H(2)   = 0.50;
        M(2)   = M(1);
        FA(2)  = 0.25;
        CR(2)  = CR(1);
        
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1)+ sb; 
        FA(3)  = FA(1)+ sb;
        CR(3)  = CR(1)- sb; 
        
        % ispi post
        H(4)   = H(2)- (sb/5) ; %move the ipsi-point that its not overlapping
        M(4)   = M(3)+ (sb/5); 
        FA(4)  = FA(2)- (sb/5); 
        CR(4)  = CR(3)+ (sb/5);
        
        
    case 'Fig5B_DoubleSameStimuli_EasyDistr_ContraPerceptualDeficitHypothesis';
        disp('Fig5B_DoubleSameStimuli_EasyDistr_ContraPerceptualDeficitHypothesis')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 1; 
        % contra pre
        H(1)   = 0.45; %0.45;
        M(1)   = 0.01;
        FA(1)  = 0.01;
        CR(1)  = 0.92;
        
        % ipsi pre
        H(2)   = 0.54;
        M(2)   = M(1);
        FA(2)  = 0.07;
        CR(2)  = CR(1);
  
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1)+ sb; 
        FA(3)  = FA(1)+ sb ;
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2)- (sb/5) ; %move the ipsi-point that its not overlapping
        M(4)   = M(3)+ (sb/5); 
        FA(4)  = FA(2)+ (sb/5); 
        CR(4)  = CR(3)- (sb/5);
        
        
         case 'Fig5B_DoubleSameStimuli_EasyDistr_SelectionBiasHypothesis';
        disp('Fig5B_DoubleSameStimuli_EasyDistr_SelectionBiasHypothesis')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 0; 

        % contra pre
        H(1)   = 0.45; %0.45;
        M(1)   = 0.01;
        FA(1)  = 0.01;
        CR(1)  = 0.94;
        
        % ipsi pre
        H(2)   = 0.54;
        M(2)   = M(1);
        FA(2)  = 0.05;
        CR(2)  = CR(1);
        
        sb = 0.27;
        % contra post
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1);
        FA(3)  = FA(1); %less saccades to contra
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2);
        CR(4)  = CR(3);
 
        
        
        
    case 'Fig6A_2HF_DoubleDifferentStimuli_DiffDistr_PerceptualDeficitHypothesis';
        disp('Fig6A_2HF_DoubleDifferentStimuli_DiffDistr_PerceptualDeficitHypothesis')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change =1; 

        
        % contra pre
        H(1)   = 0.8;
        M(1)   = 0.1;
        FA(1)  = 0.2; 
        CR(1)  = 0.1; 
        
        % ipsi pre
        H(2)   = 0.7;
        M(2)   = CR(1);
        FA(2)  = 0.1;
        CR(2)  = M(1);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; 
        M(3)   = M(1);
        FA(3)  = FA(1)+ sb; 
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)- sb ; 
        M(4)   = CR(3);
        FA(4)  = FA(2)+ sb ;
        CR(4)  = M(3);
    
     case 'Fig6B_2HF_DoubleDifferentStimuli_EasyDistr_PerceptualDeficitHypothesis';
        disp('Fig6B_2HF_DoubleDifferentStimuli_EasyDistr_PerceptualDeficitHypothesis')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change =1; 
        H(1)   = 0.9;
        M(1)   = 0.05;
        FA(1)  = 0.05; %0.1;
        CR(1)  = 0; %0.6;
        
        % ipsi pre
        H(2)   = 0.95;
        M(2)   = CR(1);
        FA(2)  = 0.05;
        CR(2)  = M(1);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; 
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1)+ sb;
        CR(3)  = CR(1)- sb ;
        
        % ispi post
        H(4)   = H(2); % 
        M(4)   = CR(3);
        FA(4)  = FA(2) ;
        CR(4)  = M(3);
        
        
       
 
    case 'Fig6A_2HF_DoubleDifferentStimuli_DiffDistr_SelectionBiasHypothesis';
        disp('Fig6A_2HF_DoubleDifferentStimuli_DiffDistr_SelectionBiasHypothesis')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change = 0; 

        % contra pre
        H(1)   = 0.6;
        M(1)   = 0.05;
        FA(1)  = 0.35; %0.1;
        CR(1)  = 0.05; %0.6;
        
        % ipsi pre
        H(2)   = 0.6;
        M(2)   = CR(1);
        FA(2)  = 0.35;
        CR(2)  = M(1);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; 
        M(3)   = M(1) ;
        FA(3)  = FA(1)- sb; 
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb;
        M(4)   = CR(3);
        FA(4)  = FA(2)+ sb ;
        CR(4)  = M(3);
        
    case 'Fig6B_2HF_DoubleDifferentStimuli_EasyDistr_SelectionBiasHypothesis';
        disp('Fig6B_2HF_DoubleDifferentStimuli_EasyDistr_SelectionBiasHypothesis')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change =0; 

        % contra pre
        H(1)   = 0.9;
        M(1)   = 0.05;
        FA(1)  = 0.05; %0.1;
        CR(1)  = 0; %0.6;
        
        % ipsi pre
        H(2)   = 0.95;
        M(2)   = CR(1);
        FA(2)  = 0.05;
        CR(2)  = M(1);
        
        sb = 0.2;
        sb_ipsi = 0.02;
        % contra post
        H(3)   = H(1)- sb ; 
        M(3)   = M(1)+ sb ;
        FA(3)  = FA(1); %
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)-sb_ipsi; % visual display
        M(4)   = CR(3)+sb_ipsi;% visual display
        FA(4)  = FA(2)+sb_ipsi ;% visual display
        CR(4)  = M(3);
        
%           case 'Double D-T Stimuli 1HF - Post: perceptual deficit';
%         disp('Double D-T Stimuli 1HF - Post: perceptual deficit')
%         StimulusType = 'Double D-T Stimuli';
% 
%         % contra pre
%         H(1)   = 0.6;
%         M(1)   = 0.1;
%         FA(1)  = 0.2;
%         CR(1)  = M(1); %0.6;
%         
%         % ipsi pre
%         H(2)   = 0.6;
%         M(2)   = CR(1);
%         FA(2)  = 0.3;
%         CR(2)  = M(2);
%         
%         sb = 0.1;
%         % contra post
%         H(3)   = H(1)- sb ;
%         M(3)   = M(1);
%         FA(3)  = FA(1)+ sb;
%         CR(3)  = CR(1);
%         
%         % ispi post
%         H(4)   = 0.6; 
%         M(4)   = 0.1;
%         FA(4)  = 0.3;
%         CR(4)  = M(4);
        
        
end % of scenario selection

end

