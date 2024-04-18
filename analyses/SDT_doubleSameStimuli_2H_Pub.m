function SDT_doubleSameStimuli_2H_Pub(monkey,path_SaveFig, SET )
% SDT_doubleSameStimuli_2H_Pub - Perform statistic to compare Ctr vs.
% Ina sessions and create Figure 5 for the manuscript

% USAGE:
% path_SaveFig = ['Y:\Projects\Pulv_Inac_ECG_respiration\Analyze\distr_task_behavior\SDT\SDT_Public\Output'];
% SDT_doubleSameStimuli_2H_Pub('Curius',path_SaveFig, SET );

% INPUTS:
% path_SaveFig (Where to save PWerte)
% monkey   (Subject name)
% SET (Settings)

% REQUIRES: Igtools

% OUTPUTS:
% Statistic and Graphs
%
% Author(s):  K.Kaduk, DAG, DPZ
% URL:		http://www.dpz.eu/dag


close all;

%% Settings:  Specific seetings for only these graphs
SET.Plot.xlim_SDT_easy = [1 5];
SET.Plot.xlim_SDT_diff = [-1 4];


%% load the data
Files = dir(['Data',filesep, monkey , '_SDTvar_DoubleSameStim.mat' ]);
load(['Data',filesep, Files(end).name ])
disp( ['dataset to analyze: ' Files(end).name ])


%% Statistic

TablePwerte = [];

if  SET.NonParametri == 0
    %statistic - parametric: independent sessions
    for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
        [h,p,ci,stats]  = ttest2(Data.d_prime.easy.(SET.positionExp{indPos}).pre, Data.d_prime.easy.(SET.positionExp{indPos}).post);
        Data.d_prime.easy.(SET.positionExp{indPos}).pvalue = p;
        Data.d_prime.easy.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'d_prime'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.d_prime.easy.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2(Data.criterion.easy.(SET.positionExp{indPos}).pre, Data.criterion.easy.(SET.positionExp{indPos}).post);
        Data.criterion.easy.(SET.positionExp{indPos}).pvalue = p;
        Data.criterion.easy.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'criterion'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.criterion.easy.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2(Data.d_prime.difficult.(SET.positionExp{indPos}).pre, Data.d_prime.difficult.(SET.positionExp{indPos}).post);
        Data.d_prime.difficult.(SET.positionExp{indPos}).pvalue = p;
        Data.d_prime.difficult.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'d_prime'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.d_prime.difficult.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2(Data.criterion.difficult.(SET.positionExp{indPos}).pre, Data.criterion.difficult.(SET.positionExp{indPos}).post);
        Data.criterion.difficult.(SET.positionExp{indPos}).pvalue = p;
        Data.criterion.difficult.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'criterion'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.criterion.difficult.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [h,p,ci,stat] = ttest2(Data.pFA.easy.(SET.positionExp{indPos}).pre, Data.pFA.easy.(SET.positionExp{indPos}).post);
        Data.pFA.easy.(SET.positionExp{indPos}).pvalue = p;
        Data.pFA.easy.(SET.positionExp{indPos}).tstat = stat.tstat;
        median_Pre  = median(Data.pFA.easy.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Data.pFA.easy.(SET.positionExp{indPos}).post) ;
        Data.pFA.easy.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Data.pFA.easy.(SET.positionExp{indPos}).post) + length(Data.pFA.easy.(SET.positionExp{indPos}).pre));
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.pFA.easy.(SET.positionExp{indPos}).tstat,3), {'indepTtest2'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        
        [h,p,ci,stat] = ttest2(Data.pFA.difficult.(SET.positionExp{indPos}).pre, Data.pFA.difficult.(SET.positionExp{indPos}).post);
        Data.pFA.difficult.(SET.positionExp{indPos}).pvalue = p;
        Data.pFA.difficult.(SET.positionExp{indPos}).tstat = stat.tstat;
        Data.pFA.difficult.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Data.pFA.difficult.(SET.positionExp{indPos}).post) + length(Data.pFA.difficult.(SET.positionExp{indPos}).pre));
        median_Pre  = median(Data.pFA.difficult.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Data.pFA.difficult.(SET.positionExp{indPos}).post) ;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.pFA.difficult.(SET.positionExp{indPos}).tstat,3), {'indepTtest2'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        
        [h,p,ci,stat] = ttest2(Data.pHit.(SET.positionExp{indPos}).pre, Data.pHit.(SET.positionExp{indPos}).post);
        Data.pHit.(SET.positionExp{indPos}).pvalue = p;
        Data.pHit.(SET.positionExp{indPos}).tstat = stat.tstat;
        Data.pHit.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Data.pHit.(SET.positionExp{indPos}).post) + length(Data.pHit.(SET.positionExp{indPos}).pre));
        median_Pre  = median(Data.pHit.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Data.pHit.(SET.positionExp{indPos}).post) ;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pHi'},{ 'nan'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Data.pHit.(SET.positionExp{indPos}).tstat,3), {'indepTtest2'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        
        
    end
    
    
else
    %statistic - parametric: dependent sessions
    for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
        [p,h,stat] = ranksum(Data.d_prime.easy.(SET.positionExp{indPos}).pre, Data.d_prime.easy.(SET.positionExp{indPos}).post);
        Data.d_prime.easy.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'d_prime'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        disp(p)
        p = [ ];
        
        [p,h,stat] = ranksum( Data.criterion.easy.(SET.positionExp{indPos}).post, Data.criterion.easy.(SET.positionExp{indPos}).pre);
        Data.criterion.easy.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'criterion'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} ,stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        disp(p); p = [ ];
        [p,h,stat] = ranksum(Data.d_prime.difficult.(SET.positionExp{indPos}).pre, Data.d_prime.difficult.(SET.positionExp{indPos}).post);
        Data.d_prime.difficult.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'d_prime'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} ,stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        disp(p); p = [ ];
        [p,h,stat] = ranksum( Data.criterion.difficult.(SET.positionExp{indPos}).post, Data.criterion.difficult.(SET.positionExp{indPos}).pre);
        Data.criterion.difficult.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'criterion'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [H,P,CI,STATS] = ttest(Data.pFA.easy.(SET.positionExp{indPos}).pre, Data.pFA.easy.(SET.positionExp{indPos}).post);
        Data.pFA.easy.(SET.positionExp{indPos}).pvalue = P;
        median_Pre  = median(Data.pFA.easy.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Data.pFA.easy.(SET.positionExp{indPos}).post) ;
        Data.pFA.easy.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Data.pFA.easy.(SET.positionExp{indPos}).post) + length(Data.pFA.easy.(SET.positionExp{indPos}).pre));
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'easy'} , (SET.positionExp(indPos)) ,round(P,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [H,P,CI,STATS] = ttest(Data.pFA.difficult.(SET.positionExp{indPos}).pre, Data.pFA.difficult.(SET.positionExp{indPos}).post);
        Data.pFA.difficult.(SET.positionExp{indPos}).pvalue = P;
        median_Pre  = median(Data.pFA.difficult.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Data.pFA.difficult.(SET.positionExp{indPos}).post) ;
        Data.pFA.difficult.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Data.pFA.difficult.(SET.positionExp{indPos}).post) + length(Data.pFA.difficult.(SET.positionExp{indPos}).pre));
        
        disp([median_Pre ,' ',  median_Post, 'Data.pFA ', 'difficult ' , (SET.positionExp{indPos}) '_',num2str(round(P,SET.roundValue)),'_r=', num2str(round(Data.pFA.difficult.(SET.positionExp{indPos}).r,3))] )
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(P,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [H,P,CI,STATS] = ttest(Data.pHit.(SET.positionExp{indPos}).pre, Data.pHit.(SET.positionExp{indPos}).post);
        Data.pHit.(SET.positionExp{indPos}).pvalue = P;
        median_Pre  = median(Data.pHit.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Data.pHit.(SET.positionExp{indPos}).post) ;
        Data.pHit.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Data.pHit.(SET.positionExp{indPos}).post) + length(Data.pHit.(SET.positionExp{indPos}).pre));
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pHi'},{ 'no'} , (SET.positionExp(indPos)) ,round(P,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [H,P,CI,STATS] = ttest(pMiss.pre, pMiss.post);
        pMiss.pvalue = P;
        [H,P,CI,STATS] = ttest2(pCR.easy.pre,pCR.easy.post);
        pCR.easy.pvalue = P;
        
        [H,P,CI,STATS] = ttest(pCR.difficult.pre,pCR.difficult.post);
        pCR.difficult.pvalue =P;
        
        
    end
end

%
TablePwerte.Properties.VariableNames = {'Monkey', 'Stimulus_type', 'Measure', 'Difficulty', 'Hemifield', 'p_value','teststatistic', 't_value', 'Statistic'};

if SET.SaveTable
    filename =[path_SaveFig,filesep, 'Table' filesep, monkey,filesep, monkey '_SDTvarPwerte_DoubleSameStim.xlsx' ] ;
    writetable(TablePwerte,filename,'Sheet',1,  'Range' ,'A1' )
    
    disp(['SAVED  ' filename ])
    
end

%% Determine the if the Data.d_prime differs against the H0?
for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
    for indTime = 1:length(SET.TimeLine) %pre vs post
        [p,h,stat] = signrank(Data.d_prime.easy.(SET.positionExp{indPos}).pre);
        Data.d_prime.easy.(SET.positionExp{indPos}).P_Bias_pre = p;
        [p,h,stat] = signrank(Data.d_prime.easy.(SET.positionExp{indPos}).post);
        Data.d_prime.easy.(SET.positionExp{indPos}).P_Bias_post = p;
        [p,h,stat] = signrank(Data.d_prime.difficult.(SET.positionExp{indPos}).pre);
        Data.d_prime.difficult.(SET.positionExp{indPos}).P_Bias_pre = p;
        [p,h,stat] = signrank( Data.d_prime.difficult.(SET.positionExp{indPos}).post);
        Data.d_prime.difficult.(SET.positionExp{indPos}).P_Bias_post = p;
    end
end
%% Determine the response Bias by testing the Data.criterion again the H0?
for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
    for indTime = 1:length(SET.TimeLine) %pre vs post
        [p,h,stat] = signrank(Data.criterion.easy.(SET.positionExp{indPos}).pre);
        Data.criterion.easy.(SET.positionExp{indPos}).P_Bias_pre = p;
        [p,h,stat] = signrank(Data.criterion.easy.(SET.positionExp{indPos}).post);
        Data.criterion.easy.(SET.positionExp{indPos}).P_Bias_post = p;
        [p,h,stat] = signrank(Data.criterion.difficult.(SET.positionExp{indPos}).pre);
        Data.criterion.difficult.(SET.positionExp{indPos}).P_Bias_pre = p;
        [p,h,stat] = signrank( Data.criterion.difficult.(SET.positionExp{indPos}).post);
        Data.criterion.difficult.(SET.positionExp{indPos}).P_Bias_post = p;
    end
end
%% Data.criterion - WHICH RESPONSE BIAS?


for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
    if SET.Plot.ResponseBias_DisplayColor == 1
        Color_MoreContra    = [1 0 1]; %cyan
        Color_LessContra    = [0 0 1]; %magenta
        Color_Neutral       = [0.5 0.5 0.5];
    elseif SET.Plot.ResponseBias_DisplayColor == 0
        Color_MoreContra    = [0 0 0];
        Color_LessContra    = [0 0 0];
        Color_Neutral       = [0 0 0];
    end
    for indDiff = 1: length(SET.Difficulty)
        if  Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).P_Bias_pre < 0.05
            if strcmp(SET.positionExp{indPos}, 'contra')
                %
                if nanmean(Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).pre) < 0 %negative Data.criterion
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_pre = 'moreContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre = 'Go' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre_Color = Color_MoreContra ;
                    
                elseif nanmean(Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).pre) > 0
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_pre = 'lessContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre = 'NoGo' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre_Color = Color_LessContra ;
                    
                end
                
            elseif  strcmp(SET.positionExp{indPos}, 'ipsi')
                % the ipsilateral Data.criterion is reversed .. positive
                % Data.criterion means after reversion
                if nanmean(-Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).pre) < 0 %negative Data.criterion
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_pre = 'moreContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre = 'NoGo' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre_Color = Color_MoreContra ;
                    
                elseif nanmean(-Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).pre) > 0
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_pre = 'lessContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre = 'Go' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre_Color = Color_LessContra ;
                    
                end
                
            end
        else
            Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_pre = 'neutral' ;
            Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre = 'neutral' ;
            Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_pre_Color = Color_Neutral ;
            
        end
    end
end
%%% POST
for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
    if SET.Plot.ResponseBias_DisplayColor == 1
        Color_MoreContra    = [1 0 1]; %cyan
        Color_LessContra    = [0 0 1]; %magenta
        Color_Neutral       = [0.5 0.5 0.5];
    elseif SET.Plot.ResponseBias_DisplayColor == 0
        Color_MoreContra    = SET.Plot.Color.Ipsi;
        Color_LessContra    = SET.Plot.Color.Ipsi;
        Color_Neutral       = SET.Plot.Color.Ipsi;
    end
    for indDiff = 1: length(SET.Difficulty)
        if  Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).P_Bias_post < 0.05
            if strcmp(SET.positionExp{indPos}, 'contra')
                if nanmean(Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).post) < 0 %negative Data.criterion
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_post = 'moreContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post = 'Go' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post_Color = Color_MoreContra ;
                    
                elseif nanmean(Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).post) > 0
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_post = 'lessContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post = 'NoGo' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post_Color = Color_LessContra ;
                    
                end
            elseif  strcmp(SET.positionExp{indPos}, 'ipsi')
                if nanmean(-Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).post) < 0 %negative Data.criterion
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_post = 'moreContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post = 'NoGo' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post_Color = Color_MoreContra ;
                    
                elseif nanmean(-Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).post) > 0
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_post = 'lessContra' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post = 'Go' ;
                    Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post_Color = Color_LessContra ;
                    
                end
                
            end
        else
            Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).BiasDirection_post = 'neutral' ;
            Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post = 'neutral' ;
            Data.criterion.(SET.Difficulty{indDiff}).(SET.positionExp{indPos}).Bias_post_Color = Color_Neutral  ;
        end
    end
end

%% GRAPH


%% graph - Easy_Graph1HR_FAR_Graph2Sensitivity_Criterion
figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
set(gcf,'Name',[monkey, '_Easy' ]);
set(gcf,'Color',[1 1 1]);

ha(2) = subplot(1,2,1);
%ipsi Post

for i = 1: length(Data.pFA.easy.ipsi.pre)
    plot(Data.pFA.easy.ipsi.post(i), Data.pHit.ipsi.post(i), 'o' ,'color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession, 'MarkerFaceColor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
    plot(Data.pFA.easy.contra.post(i), Data.pHit.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
    
    line([Data.pFA.easy.ipsi.pre(i),Data.pFA.easy.ipsi.post(i)], [Data.pHit.ipsi.pre(i),Data.pHit.ipsi.post(i)],'Color',[SET.Plot.Color.Ipsi, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    line([Data.pFA.easy.contra.pre(i),Data.pFA.easy.contra.post(i)], [Data.pHit.contra.pre(i),Data.pHit.contra.post(i)],'Color',[SET.Plot.Color.Contra, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    
    %Fill the circle which is post
end
plot([nanmean(Data.pFA.easy.ipsi.pre),nanmean(Data.pFA.easy.ipsi.post)], [nanmean(Data.pHit.ipsi.pre),nanmean(Data.pHit.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Data.pFA.easy.contra.pre),nanmean(Data.pFA.easy.contra.post)], [nanmean(Data.pHit.contra.pre),nanmean(Data.pHit.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Data.pFA.easy.ipsi.post), nanmean(Data.pHit.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Ipsi,'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Data.pFA.easy.contra.post), nanmean(Data.pHit.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', SET.Plot.LineWidthSize); hold on;
legend('ipsi', 'contra', 'Location', 'South')

%title('easy')

line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',SET.Plot.fs)
xlabel( 'FA rate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
axis square


if Data.pFA.easy.ipsi.pvalue < 0.05
    y1 = nanmean(Data.pFA.easy.ipsi.pre) ;
    y2 = nanmean(Data.pFA.easy.ipsi.post);
    ymax = min(nanmean(Data.pHit.ipsi.pre) ,nanmean(Data.pHit.ipsi.post));
    ext_sigline([y1,y2],Data.pFA.easy.ipsi.pvalue,[],ymax -0.3,'x', SET.Plot.Color.Ipsi); hold on;
end
if Data.pHit.ipsi.pvalue < 0.05
    y1 = nanmean(Data.pHit.ipsi.pre) ;
    y2 = nanmean(Data.pHit.ipsi.post);
    ymax = max(nanmean(Data.pFA.easy.ipsi.pre) ,nanmean(Data.pFA.easy.ipsi.post));
    ext_sigline([y1,y2],Data.pHit.ipsi.pvalue,[],ymax +0.2,'y',SET.Plot.Color.Ipsi); hold on;
end
if Data.pFA.easy.contra.pvalue < 0.05
    y1 = nanmean(Data.pFA.easy.contra.pre) ;
    y2 = nanmean(Data.pFA.easy.contra.post);
    ymax = min(nanmean(Data.pHit.contra.pre) ,nanmean(Data.pHit.contra.post));
    ext_sigline([y1,y2],Data.pFA.easy.contra.pvalue,[],ymax -0.2,'x', SET.Plot.Color.Contra); hold on;
end
if Data.pHit.contra.pvalue < 0.05
    y1 = nanmean(Data.pHit.contra.pre) ;
    y2 = nanmean(Data.pHit.contra.post);
    ymax = max(nanmean(Data.pFA.easy.contra.pre) ,nanmean(Data.pFA.easy.contra.post));
    ext_sigline([y1,y2],Data.pHit.contra.pvalue,[],ymax +0.2,'y', SET.Plot.Color.Contra); hold on;
end


ha(indPos) = subplot(1,2,2);
for i = 1: length(Data.d_prime.easy.contra.pre)
    plot([Data.d_prime.easy.contra.pre(i),Data.d_prime.easy.contra.post(i)],[Data.criterion.easy.contra.pre(i),Data.criterion.easy.contra.post(i)], 'o','color',[SET.Plot.Color.Contra, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;
    plot([Data.d_prime.easy.ipsi.pre(i),Data.d_prime.easy.ipsi.post(i)], [-Data.criterion.easy.ipsi.pre(i),-Data.criterion.easy.ipsi.post(i)], 'o','color',[SET.Plot.Color.Ipsi, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of Data.criterion for ipsi
    plot(Data.d_prime.easy.contra.post(i),Data.criterion.easy.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra); hold on;
    plot(Data.d_prime.easy.ipsi.post(i),-Data.criterion.easy.ipsi.post(i), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Data.criterion for ipsi
end
plot([nanmean(Data.d_prime.easy.contra.pre),nanmean(Data.d_prime.easy.contra.post)],[nanmean(Data.criterion.easy.contra.pre) ,nanmean(Data.criterion.easy.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1 ], 'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Data.d_prime.easy.ipsi.pre),nanmean(Data.d_prime.easy.ipsi.post)],[ -nanmean(Data.criterion.easy.ipsi.pre) ,-nanmean(Data.criterion.easy.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ], 'LineWidth', SET.Plot.LineWidthSize); hold on;% reverse direction of Data.criterion for ipsi

plot(nanmean(Data.d_prime.easy.contra.post),nanmean(Data.criterion.easy.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Contra); hold on;
plot(nanmean(Data.d_prime.easy.ipsi.post),-nanmean(Data.criterion.easy.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Data.criterion for ipsi

if Data.d_prime.easy.ipsi.pvalue < 0.05
    ymax = max(nanmean(Data.criterion.easy.ipsi.pre) ,nanmean([Data.criterion.easy.ipsi.post]));
    ext_sigline([nanmean([Data.d_prime.easy.ipsi.pre]),nanmean([Data.d_prime.easy.ipsi.post])],Data.d_prime.easy.ipsi.pvalue,[ ],(ymax -1 ),'x', SET.Plot.Color.Ipsi); hold on;
end
if Data.criterion.easy.ipsi.pvalue < 0.05
    y1 = -1*nanmean(Data.criterion.easy.ipsi.pre) ;
    y2 = -1*nanmean([Data.criterion.easy.ipsi.post]);
    ymax = max(nanmean(Data.d_prime.easy.ipsi.pre) ,nanmean([Data.d_prime.easy.ipsi.post])) ;
    ext_sigline([y1,y2],Data.criterion.easy.ipsi.pvalue,[],ymax+ 0.2,'y', SET.Plot.Color.Ipsi); hold on;
end


if Data.d_prime.easy.contra.pvalue < 0.05
    ymax = max(nanmean(Data.criterion.easy.contra.pre) ,nanmean([Data.criterion.easy.contra.post]));
    ext_sigline([nanmean([Data.d_prime.easy.contra.pre]),nanmean([Data.d_prime.easy.contra.post])],Data.d_prime.easy.contra.pvalue,[ ],(ymax+ 0.8 ),'x', SET.Plot.Color.Contra); hold on;
end
if Data.criterion.easy.contra.pvalue < 0.05
    y1 = nanmean(Data.criterion.easy.contra.pre) ;
    y2 = nanmean([Data.criterion.easy.contra.post]);
    ymax = max(nanmean(Data.d_prime.easy.contra.pre) ,nanmean([Data.d_prime.easy.contra.post])) ;
    ext_sigline([y1,y2],Data.criterion.easy.contra.pvalue,[],ymax+ 0.1,'y',SET.Plot.Color.Contra); hold on;
end
axis square
xlabel('sensitivity','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
ylabel('criterion','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
set(gca,'ylim',[-3 3],'xlim',SET.Plot.xlim_SDT_easy,'fontsize',SET.Plot.fs)

text(SET.Plot.xlim_SDT_easy(1),-2.8, 'more Contra (ipsi:NoGo, contra:Go)', 'Color', 'k','fontsize',14)
text(SET.Plot.xlim_SDT_easy(1),2.8, 'less Contra (ipsi:Go, contra:NoGo)', 'Color', 'k','fontsize',14)


%% GRAPH
figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
set(gcf,'Name',[monkey, '_Difficult' ]);
set(gcf,'Color',[1 1 1]);

ha(2) = subplot(1,2,1);
for i = 1: length(Data.pFA.easy.ipsi.pre)
    plot(Data.pFA.difficult.ipsi.post(i), Data.pHit.ipsi.post(i), 'o' ,'color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_CritDpr_small, 'MarkerFaceColor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
    plot(Data.pFA.difficult.contra.post(i), Data.pHit.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
    line([Data.pFA.difficult.ipsi.pre(i),Data.pFA.difficult.ipsi.post(i)], [Data.pHit.ipsi.pre(i),Data.pHit.ipsi.post(i)],'Color',[SET.Plot.Color.Ipsi, 0.3] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    line([Data.pFA.difficult.contra.pre(i),Data.pFA.difficult.contra.post(i)], [Data.pHit.contra.pre(i),Data.pHit.contra.post(i)],'Color',[SET.Plot.Color.Contra 0.3] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    
    %Fill the circle which is post
end
plot([nanmean(Data.pFA.difficult.ipsi.pre),nanmean(Data.pFA.difficult.ipsi.post)], [nanmean(Data.pHit.ipsi.pre),nanmean(Data.pHit.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Data.pFA.difficult.contra.pre),nanmean(Data.pFA.difficult.contra.post)], [nanmean(Data.pHit.contra.pre),nanmean(Data.pHit.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Data.pFA.difficult.ipsi.post), nanmean(Data.pHit.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
plot(nanmean(Data.pFA.difficult.contra.post), nanmean(Data.pHit.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
legend('ipsi', 'contra', 'Location', 'NorthWest')

%title('difficult')

line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',SET.Plot.fs)
xlabel( 'FA rate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
axis square


if Data.pFA.difficult.ipsi.pvalue < 0.05
    y1 = nanmean(Data.pFA.difficult.ipsi.pre) ;
    y2 = nanmean(Data.pFA.difficult.ipsi.post);
    if strcmp(monkey,'Cornelius' )
        ymax = min(nanmean(Data.pHit.ipsi.pre) ,nanmean(Data.pHit.ipsi.post))-0.3;
    else
        ymax = max(nanmean(Data.pHit.ipsi.pre) ,nanmean(Data.pHit.ipsi.post));
        
    end
    ext_sigline([y1,y2],Data.pFA.difficult.ipsi.pvalue,[],ymax ,'x', SET.Plot.Color.Ipsi); hold on;
end
if Data.pHit.ipsi.pvalue < 0.05
    y1 = nanmean(Data.pHit.ipsi.pre) ;
    y2 = nanmean(Data.pHit.ipsi.post);
    ymax = max(nanmean(Data.pFA.difficult.ipsi.pre) ,nanmean(Data.pFA.difficult.ipsi.post));
    ext_sigline([y1,y2],Data.pHit.ipsi.pvalue,[],ymax +0.1,'y',SET.Plot.Color.Ipsi); hold on;
end
if Data.pFA.difficult.contra.pvalue < 0.05
    y1 = nanmean(Data.pFA.difficult.contra.pre) ;
    y2 = nanmean(Data.pFA.difficult.contra.post);
    ymax = min(nanmean(Data.pHit.contra.pre) ,nanmean(Data.pHit.contra.post));
    ext_sigline([y1,y2],Data.pFA.difficult.contra.pvalue,[],ymax-0.1,'x', SET.Plot.Color.Contra); hold on;
end
if Data.pHit.contra.pvalue < 0.05
    y1 = nanmean(Data.pHit.contra.pre) ;
    y2 = nanmean(Data.pHit.contra.post);
    ymax = max(nanmean(Data.pFA.difficult.contra.pre) ,nanmean(Data.pFA.difficult.contra.post));
    ext_sigline([y1,y2],Data.pHit.contra.pvalue,[],ymax +0.1,'y',SET.Plot.Color.Contra); hold on;
end


ha(indPos) = subplot(1,2,2);
for i = 1: length(Data.d_prime.difficult.contra.pre)
    plot([Data.d_prime.difficult.contra.pre(i),Data.d_prime.difficult.contra.post(i)],[Data.criterion.difficult.contra.pre(i),Data.criterion.difficult.contra.post(i)], 'o','color',[SET.Plot.Color.Contra 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;
    plot([Data.d_prime.difficult.ipsi.pre(i),Data.d_prime.difficult.ipsi.post(i)], [-Data.criterion.difficult.ipsi.pre(i),-Data.criterion.difficult.ipsi.post(i)], 'o','color',[SET.Plot.Color.Ipsi 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of Data.criterion for ipsi
    plot(Data.d_prime.difficult.contra.post(i),Data.criterion.difficult.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra); hold on;
    plot(Data.d_prime.difficult.ipsi.post(i),-Data.criterion.difficult.ipsi.post(i), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Data.criterion for ipsi
end
plot([nanmean(Data.d_prime.difficult.contra.pre),nanmean(Data.d_prime.difficult.contra.post)],[nanmean(Data.criterion.difficult.contra.pre) ,nanmean(Data.criterion.difficult.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ], 'LineWidth',SET.Plot.LineWidthSize); hold on;
plot([nanmean(Data.d_prime.difficult.ipsi.pre),nanmean(Data.d_prime.difficult.ipsi.post)],[ -nanmean(Data.criterion.difficult.ipsi.pre) ,-nanmean(Data.criterion.difficult.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ], 'LineWidth',SET.Plot.LineWidthSize); hold on;% reverse direction of Data.criterion for ipsi

plot(nanmean(Data.d_prime.difficult.contra.post),nanmean(Data.criterion.difficult.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Contra); hold on;
plot(nanmean(Data.d_prime.difficult.ipsi.post),-nanmean(Data.criterion.difficult.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Data.criterion for ipsi

if Data.d_prime.difficult.ipsi.pvalue < 0.05
    ymax = max(nanmean(Data.criterion.difficult.ipsi.pre) ,nanmean([Data.criterion.difficult.ipsi.post]));
    ext_sigline([nanmean([Data.d_prime.difficult.ipsi.pre]),nanmean([Data.d_prime.difficult.ipsi.post])],Data.d_prime.difficult.ipsi.pvalue,[ ],(ymax -1 ),'x', SET.Plot.Color.Ipsi); hold on;
end
if Data.criterion.difficult.ipsi.pvalue < 0.05
    y1 = -1*nanmean(Data.criterion.difficult.ipsi.pre) ;
    y2 = -1*nanmean([Data.criterion.difficult.ipsi.post]);
    ymax = max(nanmean(Data.d_prime.difficult.ipsi.pre) ,nanmean([Data.d_prime.difficult.ipsi.post])) ;
    ext_sigline([y1,y2],Data.criterion.difficult.ipsi.pvalue,[],ymax+ 1,'y', SET.Plot.Color.Ipsi); hold on;
end


if Data.d_prime.difficult.contra.pvalue < 0.05
    ymax = max(nanmean(Data.criterion.difficult.contra.pre) ,nanmean([Data.criterion.difficult.contra.post]));
    ext_sigline([nanmean([Data.d_prime.difficult.contra.pre]),nanmean([Data.d_prime.difficult.contra.post])],Data.d_prime.difficult.contra.pvalue,[ ],(ymax+ 0.8 ),'x', SET.Plot.Color.Contra); hold on;
end
if Data.criterion.difficult.contra.pvalue < 0.05
    y1 = nanmean(Data.criterion.difficult.contra.pre) ;
    y2 = nanmean([Data.criterion.difficult.contra.post]);
    ymax = max(nanmean(Data.d_prime.difficult.contra.pre) ,nanmean([Data.d_prime.difficult.contra.post])) ;
    ext_sigline([y1,y2],Data.criterion.difficult.contra.pvalue,[],ymax+ 0.7,'y', SET.Plot.Color.Contra); hold on;
end
axis square
xlabel('sensitivity','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
ylabel('criterion','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
set(gca,'ylim',[-3 3],'xlim',SET.Plot.xlim_SDT_diff ,'fontsize',SET.Plot.fs)

text(SET.Plot.xlim_SDT_diff(1) +0.1,-2.8, 'more Contra (ipsi:NoGo, contra:Go)', 'Color', 'k','fontsize',14)
text(SET.Plot.xlim_SDT_diff(1) +0.1,2.8, 'less Contra (ipsi:Go, contra:NoGo)', 'Color', 'k','fontsize',14)



