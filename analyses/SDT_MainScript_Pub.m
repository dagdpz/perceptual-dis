% SDT_MainScript_Pub - call all function for the SDT analysis
% Details in README_Code
% Author(s):  K.Kaduk, DAG, DPZ
% URL:		http://www.dpz.eu/dag


%% Settings
SET.SaveGraph           = 1; 
SET.SaveTable           = 1;
SET.roundValue          = 3; 
SET.NonParametri        = 0; 
%% Colors For Plotting
SET.Plot.Color.Ipsi         = [0 0 1 ]; 
SET.Plot.Color.Contra       = [1 0 1 ]; 
SET.Plot.Color.Black        = [0 0 0 ];


SET.Plot.fs = 28; % font size
SET.Plot.MarkSize               = 20;
SET.Plot.xlim_SDT_easy          = [1 5];
SET.Plot.xlim_SDT_diff          = [0 4];
SET.Plot.xLegend                = {'Ctr pst' 'Ina pst'};

SET.Plot.MarkSize_GraphFAR_HR_PerSession    = 7;
SET.Plot.MarkSize_GraphFAR_HR               = 17;
SET.Plot.MarkSize_CritDpr_small             = 8;
SET.Plot.MarkSize_CritDpr                   = 20;
SET.Plot.LineWidthSize                      = 3;
SET.Plot.ResponseBias_DisplayColor          = 1; 

SET.positionExp         = {'ipsi', 'contra'};
SET.TimeLineExp         = {'pre', 'post'};
SET.Difficulty          = {'easy', 'difficult'};
SET.TimeLine        = {'stim_off', 'go_signal'};
SET.Stimuli         = {'targ_targ', 'distr_distr'};
%%


monkey = 'Curius'; %Cornelius
path = pwd; 
cd(path);
path_SaveFig = [path, filesep, 'Output']; 
%run([path,filesep, 'Settings.m'])

% Check if the folder exists
if ~exist([path_SaveFig, filesep, monkey], 'dir')
    % Folder does not exist so create it
    mkdir([path_SaveFig, filesep, monkey]);
    disp(['Folder created: ', path_SaveFig, filesep, monkey]);
else
    disp(['Folder already exists: ', path_SaveFig]);
end


SDT_singleStimuli_Pub(monkey,path_SaveFig, SET )
SDT_TargetDistractorStimuli_2H_Pub(monkey,path_SaveFig, SET )
SDT_doubleSameStimuli_2H_Pub(monkey,path_SaveFig, SET )

