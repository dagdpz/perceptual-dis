function [ H, M, FA, CR , Sensitvity_Change, StimulusType] = SetScenario( NameScenario )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%% Different Scenarios %%
%%%%%%% Single STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scenario = 'SingleStimuli_DifficultDistr_Post_NoGoBias';  %(Presentation)
% scenario = 'SingleStimuli_DifficultDistr_Post_ContraPerceptualDeficit';%(Presentation)
% scenario = 'SingleStimuli_EasyDistr_Post_NoGoBias' 
% scenario = 'SingleStimuli_EasyDistr_Post_ContraPerceptualDeficit' 

%  scenario = 'SingleStimuli_Post_ContraSpatialBias_NoPerceptualDeficit';
% scenario = 'SingleStimuli_Post_ContraPerceptualDeficit_NoGoBias_Ver2_decreaseContraHR';
% scenario = 'SingleStimuli_Post_NoSpatialBias_NoPerceptualDeficit';
%scenario = 'SingleStimuli_PreSpatialBias_Contra';


% scenario = 'Single Stimuli: add contra spatial bias to contra and ipsi';
%%%%%%% DOUBLE SAME STIMULI  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scenario = 'DoubleSameStimuli_EasyDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit'; %presentation
%scenario = 'DoubleSameStimuli_DiffDiscr_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit'; %presentation
% scenario = 'DoubleSameStimuli_DiffDiscr_Post_ContraPerceptualDeficit';%presentation
% scenario = 'DoubleSameStimuli_EasyDiscr_Post_ContraPerceptualDeficit';%presentation

% scenario = 'DoubleSameStimuli_Post_IpsiSpatialBias_Vers2_NoPerceptualDeficit';
% scenario = 'DoubleSameStimuli_Post_NoGOBias_NoPerceptualDeficit';

% CHOICE BIAS - Cornelius  decrease in HR and FAR for contralateral side
% scenario = 'DoubleSameStimuli_Pre_ContraSpatialBias_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
%scenario = 'DoubleSameStimuli_Pre_IpsiSelectionBias_Cornelius_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
% CHOICE BIAS - Curius  decrease in HR and FAR for contralateral side
% scenario = 'DoubleSameStimuli_Pre_IpsiSelectionBias_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
% scenario = 'Double Stimuli - Curius inactivation session 7 20190913';

%%%%%%% 2HF: DOUBLE D-T STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scenario = '2HF_DoubleD-Tstimuli_DifficultDistr_Post_BilateralPerceptualDeficit';%(Presentation. GENERAL PERCEPTUAL )
 scenario = '2HF_DoubleD-Tstimuli_EasyDistr_Post_BilateralPerceptualDeficit';%(Presentation. GENERAL PERCEPTUAL )
% scenario = '2HF_DoubleD-Tstimuli_EasyDistr_Post_ipsiSpatialBias_Vers2_LessFixation'; %(Presentation)
% scenario = '2HF_DoubleD-Tstimuli_DiffDistr_Post_ipsiSpatialBias_Vers1_LessSaccadesContra'; %(Presentation)
 
 
% scenario = '2HF_DoubleD-Tstimuli_DifficultDistr_Post_ContraPerceptualDeficit';%(only talk - Presentation)
% scenario = '2HF_DoubleD-Tstimuli_EasyDistr_Post_DecreasedContraHitrate'; %

% scenario = 'DoubleD-Tstimuli_Post_contraPerceptualDeficit_NoGoBias_Ver4_decreaseContraHR';

% scenario = 'DoubleD-Tstimuli_Post_ipsiSpatialBias_Vers2_LessFixation';
% scenario = 'DoubleD-Tstimuli_Post_NoGoBias';

%%%%%%% 1HF: DOUBLE D-T STIMULI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scenario = '1HF_TarDistStimuli_Post_contraNoGoBias';
% scenario = '1HF_TarDistStimuli_Post_contraHitrateDecreased';
% scenario = '1HF_TarDistStimuli_Post_contraPerceptualDeficit';

 %scenario = '1HF_DoubleSameStimuli_Post_contraPerceptualDeficit';
 %scenario = '1HF_DoubleSameStimuli_Post_NoGoBias';


% scenario = 'Double D-T Stimuli - Post: perceptual deficit';
% scenario = 'Double D-T Stimuli - For Curius.. Post: perceptual deficit';

%%%%%% DOUBLE D-T SIMTULI in one hemifield #################%%%%%%%%%%%
% scenario = 'DoubleD-Tstimuli_Post_contraPerceptualDeficit_Vers1';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




switch NameScenario
     case '1HF_DoubleSameStimuli_Post_NoGoBias';  
      disp('1HF_DoubleSameStimuli_Post_NoGoBias')
        StimulusType = '1HF_DoubleSameStimuli';
        Sensitvity_Change =0; 
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(1) == 1  &FA(1)+ CR(1)+ H(1) == 1
        
       % assumption H(1) stands for hits up and hits down
     
        D.H(1)   = 0.7; %0.7
        D.M(1)   = 0.3; %0.3
        D.FA(1)  = 0.3;
        D.CR(1)  = 0.7;
        
        D.H(2)   = 0.6;
        D.M(2)   = 0.4;
        D.FA(2)  = 0.4;
        D.CR(2)  = 0.6;
        
        sb = 0.2;
        D.H(3)   = D.H(1)-sb;
        D.M(3)   = D.M(1)+sb;
        D.FA(3)  = D.FA(1)-sb;
        D.CR(3)  = D.CR(1)+sb;
        
        D.H(4)   = D.H(2);
        D.M(4)   = D.M(2);
        D.FA(4)  = D.FA(2);
        D.CR(4)  = D.CR(2);
    
        
    case '1HF_DoubleSameStimuli_Post_contraPerceptualDeficit';  
      disp('1HF_DoubleSameStimuli_Post_contraPerceptualDeficit')
        StimulusType = '1HF_DoubleSameStimuli';
        Sensitvity_Change =1; 
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(1) == 1  &FA(1)+ CR(1)+ H(1) == 1
        
       % assumption H(1) stands for hits up and hits down
       % contra pre
        H(1)   = 0.7; %0.7
        M(1)   = 0.3; %0.3
        FA(1)  = 0.3;
        CR(1)  = 0.7;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
  
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)-sb;
        M(3)   = M(1)+sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)-sb;
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
    
    
    case '1HF_TarDistStimuli_Post_contraHitrateDecreased';  
      disp('1HF_TarDistStimuli_Post_contraHitrateDecreased (less contra saccades))')
        StimulusType = '1HF_TarDistStimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra

        
        % contra pre
        H(1)   = 0.7;
        M(1)   = 0.2;
        FA(1)  = 0.1; %0.1;
        CR(1)  = M(1); %0.6;
        
        % ipsi pre
        H(2)   = 0.8;
        M(2)   = 0.1;
        FA(2)  = 0.1;
        CR(2)  = M(2);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1) - (sb) ; % less saccades to contra T
        M(3)   = M(1) + sb  ;
        FA(3)  = FA(1); %% more saccades to contra D
        CR(3)  = M(3);
        
        % ispi post
        H(4)   = H(2) - (sb); % less saccades to ipsi T
        M(4)   = CR(2) + sb;
        FA(4)  = FA(2) ;
        CR(4)  = M(2); 
        
   case '1HF_TarDistStimuli_Post_contraNoGoBias';  
      disp('1HF_TarDistStimuli_Post_contraNoGoBias (less contra saccades))')
        StimulusType = '1HF_TarDistStimuli';
        Sensitvity_Change =0; 
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(1) == 1  &FA(1)+ CR(1)+ H(1) == 1
       %H(4)+ M(4)+ FA(4) == 100 
       % H(2)+ M(2)+ FA(2) == 100
       %H(3)+ M(3)+ FA(3) == 100
        % contra pre
  
        H(1)   = 0.7;
        M(1)   = 0.1; %0.1;
        FA(1)  = 0.2; %0.1;
        CR(1)  = M(1); %0.6;
        % ipsi pre
         H(2)   = 0.8;
        M(2)   = 0.1;
        FA(2)  = 0.1;
        CR(2)  = M(2);
         
        sb = 0.15;
        % contra post
        H(3)   = H(1) - (sb); % less saccades to contra T
        M(3)   = M(1) + sb + sb; %&+  (sb/2);
        FA(3)  = FA(1) - (sb); %% more saccades to contra D
        CR(3)  = M(3);
        
        % ispi post
        H(4)   = H(2); % less saccades to ipsi T
        M(4)   = CR(2);
        FA(4)  = FA(2) ;
        CR(4)  = M(2); 
    
         case '1HF_TarDistStimuli_Post_contraPerceptualDeficit';  
      disp('1HF_TarDistStimuli_Post_contraPerceptualDeficit')
        StimulusType = '1HF_TarDistStimuli';
        Sensitvity_Change =1; 
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(1) == 1  &FA(1)+ CR(1)+ H(1) == 1
        
        % contra pre
        H(1)   = 0.7;
        M(1)   = 0.1; %0.1;
        FA(1)  = 0.2; %0.1;
        CR(1)  = M(1); %0.6;
        
        % ipsi pre
        H(2)   = 0.8;
        M(2)   = 0.1;
        FA(2)  = 0.1;
        CR(2)  = M(2);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1) - (sb) ; % less saccades to contra T
        M(3)   = M(1) ;
        FA(3)  = FA(1)+ (sb); %% more saccades to contra D
        CR(3)  = M(3);
        
        % ispi post
        H(4)   = H(2); % less saccades to ipsi T
        M(4)   = CR(2);
        FA(4)  = FA(2) ;
        CR(4)  = M(2); 
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
        
    case 'SingleStimuli_Post_ContraPerceptualDeficit_NoGoBias_Ver2_decreaseContraHR';
        disp('Single Stimuli Post: NoGo Bias & Contra PerceptualDeficit')
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
        FA(3)  = FA(1);
        CR(3)  = CR(1);
        
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
        
        
    case 'SingleStimuli_Post_NoSpatialBias_NoPerceptualDeficit';
        disp('Single Stimuli Post: No Spatial Bias & No PerceptualDeficit')
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
        H(3)   = H(1);
        M(3)   = M(1);
        FA(3)  = FA(1);
        CR(3)  = CR(1);
        
        H(4)   = H(2);
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
    case 'Single Stimuli: add contra spatial bias to contra and ipsi';
        StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        
        H(1)   = 0.7;
        M(1)   = 0.3;
        FA(1)  = 0.25;
        CR(1)  = 0.75;
        
        H(2)   = 0.6;
        M(2)   = 0.4;
        FA(2)  = 0.4;
        CR(2)  = 0.6;
        
        sb = 0.2;
        H(3)   = H(1)+sb;
        M(3)   = M(1)-sb;
        FA(3)  = FA(1)+sb;
        CR(3)  = CR(1)-sb;
        
        H(4)   = H(2)-sb;
        M(4)   = M(2)+sb;
        FA(4)  = FA(2)-sb;
        CR(4)  = CR(2)+sb;
        
        
    case 'SingleStimuli_PreSpatialBias_Contra'
          StimulusType = 'Sgl_Stimuli';
        IndependentCalculation = 1;
        
        % contra pre
        H(1)   = 0.9; %0.55;
        M(1)   = 0.1; % 0.45
        FA(1)  = 0.8; %0.35
        CR(1)  = 0.2; %0.65
        
        % ipsi pre
        H(2)   = 0.9;
        M(2)   = 0.1;
        FA(2)  = 0.8;
        CR(2)  = 0.2;
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1)+ sb ;
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1)+ sb  ;
        
        % ispi post
        H(4)   = H(2) ; %more saccades to ipsi
        M(4)   = M(2);
        FA(4)  = FA(2);
        CR(4)  = CR(2);
        
        
    case 'DoubleSameStimuli_Pre_IpsiSelectionBias_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
        disp('DoubleStimuli - Pre: Ipsi selection bias, Post: ipsi selection Bias (less contra saccade), No perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        
        % contra pre
        H(1)   = 0.35;%decreased ipsi T selection
        M(1)   = 0.1;
        FA(1)  = 0.4;%decreased ipsi D selection
        CR(1)  = 0.4;%decreased ipsi D selection
        
        % ipsi pre
        H(2)   = 0.55; %increased ipsi T selection
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1);
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)+ sb;
        CR(4)  = CR(3);
    case 'DoubleSameStimuli_Pre_IpsiSelectionBias_Cornelius_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
        disp('DoubleSameStimuli - Pre: IpsiSelectionBias (Cornelius) Post: ipsi spatial Bias (Vers1,saccade), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        
        % contra pre
        H(1)   = 0.50;
        M(1)   = 0.1;
        FA(1)  = 0.3;
        CR(1)  = 0.5;
        
        % ipsi pre
        H(2)   = 0.4;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1);
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)+ sb;
        CR(4)  = CR(3);
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
        M(3)   = M(1);
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)+ sb;
        CR(4)  = CR(3);
        
    case 'DoubleSameStimuli_Pre_ContraSpatialBias_Post_IpsiSpatialBias_Vers1_NoPerceptualDeficit';
        disp('DoubleSameStimuli - Pre_ContraSpatialBias Post: ipsi spatial Bias (Vers1,saccade), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        
        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 0.55; %0.45;
        M(1)   = 0.1;
        FA(1)  = 0.3;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.35;
        M(2)   = M(1);
        FA(2)  = 0.1;
        CR(2)  = CR(1);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; %less saccades to contra
        M(3)   = M(1);
        FA(3)  = FA(1)- sb; %less saccades to contra
        CR(3)  = CR(1) ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)+ sb;
        CR(4)  = CR(3);
        
        
    case 'DoubleSameStimuli_Post_IpsiSpatialBias_Vers2_NoPerceptualDeficit';
        disp('DoubleSameStimuli - Post: ipsi spatial Bias (Vers2, fixation), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        
        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 0.45;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.45;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.08;
        % contra post
        H(3)   = H(1) ; %less saccades to contra
        M(3)   = M(1)- sb;
        FA(3)  = FA(1); %less saccades to contra
        CR(3)  = CR(1)- sb ;
        
        % ispi post
        H(4)   = H(2)+ sb ; %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)+ sb;
        CR(4)  = CR(3);
        
        
    case 'DoubleSameStimuli_Post_NoGOBias_NoPerceptualDeficit';
        disp('DoubleSameStimuli - Post: NoGo Bias (less contra & ipsi saccades), NO perceptual deficit')
        StimulusType = 'DoubleSameStimuli';
        
        % A condition for double stimuli: Fixation is the same for contra vs ipsi M(1) = M(2)
        % spatial-saccade choice bias  (ipsi) without same discrimination performance
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations do not change for both hemifields
        % Post: ipsi targets are highly selected
        % H(1) + M(1) + H(2) should add to 1
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 0.45;
        M(1)   = 0.1;
        FA(1)  = 0.2;
        CR(1)  = 0.6;
        
        % ipsi pre
        H(2)   = 0.45;
        M(2)   = M(1);
        FA(2)  = 0.2;
        CR(2)  = CR(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- (sb/2) ; %less saccades to contra
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1)-(sb/2) ; %less saccades to contra
        CR(3)  = CR(1)+ sb ;
        
        % ispi post
        H(4)   = H(2)- (sb/2); %more saccades to ipsi
        M(4)   = M(3);
        FA(4)  = FA(2)-(sb/2);
        CR(4)  = CR(3);
        
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
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2)- (sb/5) ; %visual display changes
        M(4)   = M(3)+ (sb/5); %visual display changes
        FA(4)  = FA(2)- (sb/5); %visual display changes
        CR(4)  = CR(3)+ (sb/5); %visual display changes
        
        
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
        
        
        
        
        
        
    case 'Double Stimuli - Curius inactivation session 7 20190913';
        StimulusType = 'DoubleSameStimuli';
        
        % spatial choice bias  (ipsi) with good discrimination performance
        % for distractors
        % Fixation is the same for contra vs ipsi M(1) = M(2)
        
        % Pre: no choice bias -> Post: ipsi choice bias -> fixations doesn't change for both hemifields
        % target are highly selected
        % H(1) + M(1) + H(2) should add to 1
        %pre 26/67 + 1/67  + 40/67
        %pst 11/61 + 0/61 +50/61
        % FA(1) + CR(1) + FA(2) should add to 1
        
        % contra pre
        H(1)   = 26/67;
        M(1)   = 1/67;
        FA(1)  = 21/65;
        CR(1)  = 23/65;
        
        % ipsi pre
        H(2)   = 40/67;
        M(2)   = M(1);
        FA(2)  = 21/65;
        CR(2)  = CR(1);
        
        % contra post
        H(3)   = 11/61 ;
        M(3)   = 0/61;
        FA(3)  = 19/62;
        CR(3)  = 19/62;
        
        % ispi post
        H(4)   = 50/61 ;
        M(4)   = M(3);
        FA(4)  = 24/62;
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
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)- sb ; % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2) ;
        CR(4)  = M(3);
        
        
        
    case '2HF_DoubleD-Tstimuli_DifficultDistr_Post_ContraPerceptualDeficit';
        disp('Double D-T Stimuli - DifficultDistr- Post: contra perceptual deficit (more contra Miss, less contra CR)')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
         Sensitvity_Change =1; 
        % contra pre
        % contra pre
        H(1)   = 0.7;
        M(1)   = 0.1;
        FA(1)  = 0.25; %0.1;
        CR(1)  = 0.1; %0.6;
        
        % ipsi pre
        H(2)   = 0.65;
        M(2)   = CR(1);
        FA(2)  = 0.2;
        CR(2)  = M(1);
        
        sb = 0.2;
        % contra post
        H(3)   = H(1)- sb ; % less saccades to contra T
        M(3)   = M(1) + sb;
        FA(3)  = FA(1)+ sb; %% more saccades to contra D
        CR(3)  = CR(1)- sb ;
        
        % ispi post
        H(4)   = H(2); % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2) ;
        CR(4)  = M(3);
        
    case '2HF_DoubleD-Tstimuli_EasyDistr_Post_DecreasedContraHitrate';
        disp('Double D-T Stimuli - EasyDistr - Post: contra perceptual deficit (decreased contra Hitrate)')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
        Sensitvity_Change =1; 
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

        sb_ipsi = 0.03;        
        sb_contra = 0.2;
        % contra post
        H(3)   = H(1)- sb_contra ; % less saccades to contra T
        M(3)   = M(1)+ sb_contra ;%more contra fixation
        FA(3)  = FA(1);
        CR(3)  = CR(1); 
        
        % ispi post
        H(4)   = H(2)+sb_ipsi ; % visual display
        M(4)   = CR(3)-sb_ipsi ; % visual display
        FA(4)  = FA(2)+sb_ipsi ;
        CR(4)  = M(3);
        
    case 'DoubleD-Tstimuli_Post_contraPerceptualDeficit_NoGoBias_Ver4_decreaseContraHR';
        disp('Double D-T Stimuli - Post: contra perceptual deficit (less ipsiTarget, more ipsi distractor)')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
        
        % contra pre
        % contra pre
        H(1)   = 0.6;
        M(1)   = 0.1;
        FA(1)  = 0.3; %0.1;
        CR(1)  = 0.1; %0.6;
        
        % ipsi pre
        H(2)   = 0.6;
        M(2)   = CR(1);
        FA(2)  = 0.3;
        CR(2)  = M(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb ; % less saccades to contra T
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1);
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2) ;
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
        
    case 'DoubleD-Tstimuli_Post_ipsiSpatialBias_Vers2_LessFixation';
        disp('DoubleD-Tstimuli Post: IpsiSpatialBias Vers2 (more saccades to ipsi, less fixation))')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        
        
        % contra pre
        % contra pre
        H(1)   = 0.5;
        M(1)   = 0.1;
        FA(1)  = 0.4; %0.1;
        CR(1)  = 0.1; %0.6;
        
        % ipsi pre
        H(2)   = 0.5;
        M(2)   = CR(1);
        FA(2)  = 0.4;
        CR(2)  = M(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1) ; % less saccades to contra T
        M(3)   = M(1)- sb ;
        FA(3)  = FA(1); %% more saccades to contra D
        CR(3)  = CR(1)- sb;
        
        % ispi post
        H(4)   = H(2)+ sb; % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2)+ sb ;
        CR(4)  = M(3);
        
    case 'DoubleD-Tstimuli_Post_NoGoBias';
        disp('DoubleD-Tstimuli_Post_NoGoBias (less contra saccades))')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        
        
        % contra pre
        % contra pre
        H(1)   = 0.5;
        M(1)   = 0.1;
        FA(1)  = 0.4; %0.1;
        CR(1)  = 0.1; %0.6;
        
        % ipsi pre
        H(2)   = 0.5;
        M(2)   = CR(1);
        FA(2)  = 0.4;
        CR(2)  = M(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- (sb/2) ; % less saccades to contra T
        M(3)   = M(1)+sb ;
        FA(3)  = FA(1)- (sb/2); %% more saccades to contra D
        CR(3)  = CR(1)+ sb;
        
        % ispi post
        H(4)   = H(2)- (sb/2); % less saccades to ipsi T
        M(4)   = CR(3);
        FA(4)  = FA(2)- (sb/2) ;
        CR(4)  = M(3);
        
    case 'Double D-T Stimuli - For Curius.. Post: perceptual deficit';
        disp('Double D-T Stimuli - For Curius.. Post: perceptual deficit')
        StimulusType = 'Double D-T Stimuli';
        %1.Target contra:  Miss contra == CR ipsi && 2.Target ipsi:  Miss ipsi == CR contra
        % H(1)+ M(1)+ FA(2) == 1  &FA(1)+ CR(1)+ H(2) == 1
        % ipsi selection bias - increase ipsilateral target selection, FA (contra) decreased
        % ipsi perceptual deficit - increased selection of FA (ipsi)
        
        % contra pre
        % contra pre
        H(1)   = 0.5;
        M(1)   = 0.1;
        FA(1)  = 0.4; %0.1;
        CR(1)  = 0.1; %0.6;
        
        % ipsi pre
        H(2)   = 0.5;
        M(2)   = CR(1);
        FA(2)  = 0.4;
        CR(2)  = M(1);
        
        sb = 0.1;
        % contra post
        H(3)   = H(1)- sb -sb;
        M(3)   = M(1)+ sb;
        FA(3)  = FA(1);
        CR(3)  = CR(1);
        
        % ispi post
        H(4)   = H(2)- sb  ;
        M(4)   = CR(3)+ sb;
        FA(4)  = FA(2)+ sb ;
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

