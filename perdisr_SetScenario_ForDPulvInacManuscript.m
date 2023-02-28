function [ H, M, FA, CR , Sensitvity_Change, StimulusType] = perdisr_SetScenario_ForDPulvInacManuscript( NameScenario )
% Which secenario you want to run? 

%% Overview of all included Scenarios %%
%%%%%%% Single STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scenario = 'SingleStimuli_DifficultDistr_Post_NoGoBias';  
% scenario = 'SingleStimuli_DifficultDistr_Post_ContraPerceptualDeficit';
% scenario = 'SingleStimuli_EasyDistr_Post_NoGoBias' 
% scenario = 'SingleStimuli_EasyDistr_Post_ContraPerceptualDeficit' 

%%%%%%% DOUBLE SAME STIMULI  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scenario = 'DoubleSameStimuli_EasyDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit'; %presentation
%scenario = 'DoubleSameStimuli_DiffDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit'; %presentation
% scenario = 'DoubleSameStimuli_DiffDiscr_Post_ContraPerceptualDeficit';%presentation
% scenario = 'DoubleSameStimuli_EasyDiscr_Post_ContraPerceptualDeficit';%presentation


%%%%%%% 2HF: DOUBLE D-T STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scenario = '2HF_DoubleD-Tstimuli_DifficultDistr_Post_BilateralPerceptualDeficit';%(Presentation. GENERAL PERCEPTUAL )
% scenario = '2HF_DoubleD-Tstimuli_EasyDistr_Post_BilateralPerceptualDeficit';%(Presentation. GENERAL PERCEPTUAL )
% scenario = '2HF_DoubleD-Tstimuli_EasyDistr_Post_ipsiSpatialBias_Vers2_LessFixation'; %(Presentation)
% scenario = '2HF_DoubleD-Tstimuli_DiffDistr_Post_ipsiSpatialBias_Vers1_LessSaccadesContra'; %(Presentation)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Legend
%       contra | ispi
% pre     1       2
% post    3       4

switch NameScenario
   
 
    case 'SingleStimuli_DifficultDistr_Post_NoGoBias';
        disp('Single Stimuli Post: Contra Spatial Bias')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change =0; 

        H(1)   = 0.7; %0.7
        M(1)   = 0.3; %0.3
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
     case 'SingleStimuli_EasyDistr_Post_NoGoBias';
        disp('Single Stimuli - EasyDistr - Post: Contra Spatial Bias')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change =0; 

        
        H(1)   = 0.95; %0.7
        M(1)   = 0.05; %0.3
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
       % if  FA(3) < 0 ;  FA(3) = 0 ;  end
        
    case 'SingleStimuli_EasyDistr_Post_ContraPerceptualDeficit';
        disp('Single Stimuli - EasyDistr - Post: No Spatial Bias & Contra PerceptualDeficit')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change =1; 

        
        H(1)   = 0.95; %0.7
        M(1)   = 0.05; %0.3
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
        
    case 'SingleStimuli_DifficultDistr_Post_ContraPerceptualDeficit';
        disp('Single Stimuli - DifficultDistr - Post: No Spatial Bias & Contra PerceptualDeficit')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        Sensitvity_Change = 0; 

        H(1)   = 0.7; %0.7
        M(1)   = 0.3; %0.3
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
        
   
        
        
    case 'SingleStimuli_Post_NoGoBias_NoPerceptualDeficit';
        disp('Single Stimuli Post: NoGo-Bias & No PerceptualDeficit')
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        
        H(1)   = 0.7; %0.7
        M(1)   = 0.3; %0.3
        FA(1)  = 0.3;
        CR(1)  = 0.7;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        
        sb = 0.19;
        H(3)   = H(1)-sb;
        M(3)   = M(1)+sb;
        FA(3)  = FA(1)-sb;
        CR(3)  = CR(1)+sb;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
      
    case 'DoubleSameStimuli_EasyDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
        disp('DoubleSameStimuli - EasyDiscr- Post: ipsi spatial Bias (Vers1,saccade), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 0; 

        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
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
           
    case 'DoubleSameStimuli_DiffDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
        disp('DoubleSameStimuli - DiffDiscr - Post: ipsi spatial Bias (Vers1,saccade), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        Sensitvity_Change = 0; 

        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 0.49; %0.45;
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
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1) ;
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb ;  %more saccades to ipsi
        M(4)   = M(3)- (sb/5) ;
        FA(4)  = FA(2)+ sb ;
        CR(4)  = CR(3)- (sb/5) ;

    case 'DoubleSameStimuli_DiffDiscr_Post_ContraPerceptualDeficit';
        disp('Double Stimuli - Post: contra perceptual deficit')
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
        
        
    case 'DoubleSameStimuli_EasyDiscr_Post_ContraPerceptualDeficit';
        disp('Double Stimuli - EasyDiscr-  Post: contra perceptual deficit ')
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
        M(3)   = M(1)+ sb; %contra fixation
        FA(3)  = FA(1)+ sb ;%contra Saccade
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2)- (sb/5) ; %visual display changes
        M(4)   = M(3)+ (sb/5); %visual display changes
        FA(4)  = FA(2)+ (sb/5); %visual display changes
        CR(4)  = CR(3)- (sb/5); %visual display changes
        
    case 'Double Stimuli - Pre: No spatial choice bias & Post: perceptual deficit';
        disp('Double Stimuli - Pre: No spatial choice bias & Post: perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        
        % contra pre
        H(1)   = 0.5;
        M(1)   = 0.2;
        FA(1)  = 0.1; %0.1;
        CR(1)  = 0.5; %0.6;
        
        % ipsi pre
        H(2)   = 0.3;
        M(2)   = M(1);
        FA(2)  = 0.4;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2) ;
        M(4)   = M(3);
        FA(4)  = FA(2);
        CR(4)  = CR(3);
        
    case 'Double D-T Stimuli - Post: ipsi choice Bias & no perceptual deficit';
        StimulusType = 'Double D-T Stimuli';
        % Cornelius data looks like that
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)/CR(2)+ FA(2) == 1  &FA(1)+ CR(1)/M(2)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % good perceptual discrimination on ipsilateral side - no change for ipsilateral distractor trials
        
        % contra pre
        % contra pre
        H(1)   = 0.5;
        M(1)   = 0.1;
        FA(1)  = 0.4;
        CR(1)  = 0.1;
        
        % ipsi pre
        H(2)   = 0.5;
        M(2)   = CR(1);
        FA(2)  = 0.4;
        CR(2)  = M(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1) - sb;
        M(3)   = M(1);
        FA(3)  = FA(1)- sb;
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb ;
        M(4)   = CR(3);
        FA(4)  = FA(2)+ sb;
        CR(4)  = M(3);
        
        
    case '2HF_DoubleD-Tstimuli_DifficultDistr_Post_BilateralPerceptualDeficit';
        disp('Double D-T Stimuli -  Post: bilateral perceptual deficit (less ipsi & contra Target, more ipsi & contra distractor)')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change =1; 

        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  & FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
        
        % contra pre
        % contra pre
        H(1)   = 0.8;
        M(1)   = 0.1;
        FA(1)  = 0.2; %0.1;
        CR(1)  = 0.1; %0.6;
        
        % ipsi pre
        H(2)   = 0.7;
        M(2)   = CR(1);
        FA(2)  = 0.1;
        CR(2)  = M(1);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; % less saccades to contra T
        M(3)   = M(1);
        FA(3)  = FA(1)+ sb; %% more saccades to contra D
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)- sb ; % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2)+ sb ;
        CR(4)  = M(3);
    
     case '2HF_DoubleD-Tstimuli_EasyDistr_Post_BilateralPerceptualDeficit';
        disp('Double D-T Stimuli - EasyDistr - Post: contra perceptual deficit (decreased contra Hitrate)')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
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
        H(3)   = H(1)- sb ; % less saccades to contra T
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1)+ sb; %% more saccades to contra D
        CR(3)  = CR(1)- sb ;
        
        % ispi post
        H(4)   = H(2); % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2) ;
        CR(4)  = M(3);
        
        
       
 
    case '2HF_DoubleD-Tstimuli_DiffDistr_Post_ipsiSpatialBias_Vers1_LessSaccadesContra';
        disp('2HF_DoubleD-Tstimuli - DiffDistr - Post: IpsiSpatialBias Vers1 (more saccades to ipsi, less saccades to contra))')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change =0; 

        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        
        
        % contra pre
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
        H(3)   = H(1)- sb ; % less saccades to contra T
        M(3)   = M(1) ;
        FA(3)  = FA(1)- sb; %% more saccades to contra D
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)+ sb; % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2)+ sb ;
        CR(4)  = M(3);
        
    case '2HF_DoubleD-Tstimuli_EasyDistr_Post_ipsiSpatialBias_Vers2_LessFixation';
        disp('2HF_DoubleD-Tstimuli - DiffDistr - Post: IpsiSpatialBias Vers2 (more saccades to ipsi, less fixation))')
        StimulusType = 'Double D-T Stimuli';
        Sensitvity_Change =0; 

        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        
        
        % contra pre
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
        H(3)   = H(1)- sb ; % less saccades to contra T
        M(3)   = M(1)+ sb ;
        FA(3)  = FA(1); %% more saccades to contra D
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)-sb_ipsi; % visual display
        M(4)   = CR(3)+sb_ipsi;% visual display
        FA(4)  = FA(2)+sb_ipsi ;% visual display
        CR(4)  = M(3);
        
          case 'Double D-T Stimuli 1HF - Post: perceptual deficit';
        disp('Double D-T Stimuli 1HF - Post: perceptual deficit')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
        
        % contra pre
        % contra pre
        H(1)   = 0.6;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = M(1); %0.6;
        
        % ipsi pre
        H(2)   = 0.6;
        M(2)   = CR(1);
        FA(2)  = 0.3;
        CR(2)  = M(2);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ;
        M(3)   = M(1);
        FA(3)  = FA(1)+ sb;
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = 0.6; 
        M(4)   = 0.1;
        FA(4)  = 0.3;
        CR(4)  = M(4);
        
        
end % of scenario selection












end

