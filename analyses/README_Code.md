# README for the code 

The following functions have a similar structure to perform statistical analysis and 
generate the pHit vs pFa and criterion vs. dprime figures (Fig.4-6).
The functions processes the datasets in /Data, applies statistical tests, 
and produces tables showing the statistic and graphs.

Three Main functions: 
- SDT_singleStimuli_Pub
- SDT_doubleSameStimuli_2H_Pub
- SDT_TargetDistractorStimuli_2H_Pub

Input Parameters

    monkey: A string identifier for the monkey whose data is being analyzed.
    path_SaveFig: Path where figures and tables will be saved.
    SET: A structure containing various settings and parameters for the analysis, including:
        positionExp: Positions of experimental interest (e.g., 'ipsi', 'contra').
        TimeLineExp: Time points of experimental interest (e.g., 'pre', 'post').
        Difficulty: Difficulty levels of the tasks (e.g., 'difficult', 'easy').
        Other graphical and computational settings.

Outputs for the manuscript
    Table: A comprehensive table (TablePwerte) including:
        Statistical test results (t-test or rank sum test) for d-prime and criterion values.
        P-values and test statistics for comparisons between conditions (e.g., pre vs. post, ipsi vs. contra).
        This table is saved as an Excel file if SET.SaveTable is set to 1.
    Graphs:
        Graph 1: Plots comparing the hit rate versus false alarm rate for difficult/easy conditions, highlighting 
        changes from Control to Inactivation and differences between 'ipsi' and 'contra' conditions.
        Statistical significance is indicated on the plots.
        Graph 2: Plots of d-prime versus criterion for both difficult / easy settings, 
        showing trajectory from Control to Inactivation experiments. Again, statistical significances are indicated.

USAGE example:
path_SaveFig = ['Y:\Projects\Pulv_Inac_ECG_respiration\Analyze\distr_task_behavior\SDT\SDT_Public\Output']; 
SDT_doubleSameStimuli_2H_Pub('Curius',path_SaveFig, SET ); 

REQUIRES: Igtools


