function SDT_doubleSameStimuli_2H_Pub(monkey, SET )
% SDT_doubleSameStimuli_2H_Pub - Perform statistic to compare Ctr vs.
% Ina sessions and create Figure 5 for the manuscript

% USAGE:
% SDT_doubleSameStimuli_2H_Pub('Curius', SET );

% INPUTS:
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


%% load the Da.SDT.DSS
Files = dir(['Data',filesep, monkey , '_SDT_RT_Acc.mat' ]);
load(['Data',filesep, Files(end).name ])
disp( ['dataset to analyze: ' Files(end).name ])


%% Statistic

TablePwerte = [];

if  SET.NonParametri == 0
    %statistic - parametric: independent sessions
    for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
        [h,p,ci,stats]  = ttest2(Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).pre, Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'d_prime'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2(Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).pre, Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'criterion'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2(Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'d_prime'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2(Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'criterion'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [h,p,ci,stat] = ttest2(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pre, Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).tstat = stat.tstat;
        median_Pre  = median(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).post) ;
        Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).post) + length(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pre));
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).tstat,3), {'indepTtest2'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        
        [h,p,ci,stat] = ttest2(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).tstat = stat.tstat;
        Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).post) + length(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pre));
        median_Pre  = median(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).post) ;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).tstat,3), {'indepTtest2'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        
        [h,p,ci,stat] = ttest2(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pre, Da.SDT.DSS.pHit.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DSS.pHit.(SET.positionExp{indPos}).tstat = stat.tstat;
        Da.SDT.DSS.pHit.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).post) + length(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pre));
        median_Pre  = median(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).post) ;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pHi'},{ 'nan'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).tstat,3), {'indepTtest2'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        
        
    end
    
    
else
    %statistic - parametric: dependent sessions
    for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
        [p,h,stat] = ranksum(Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).pre, Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.d_prime.easy.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'d_prime'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        disp(p)
        p = [ ];
        
        [p,h,stat] = ranksum( Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).post, Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).pre);
        Da.SDT.DSS.criterion.easy.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'criterion'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} ,stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        disp(p); p = [ ];
        [p,h,stat] = ranksum(Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.d_prime.difficult.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'d_prime'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} ,stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        disp(p); p = [ ];
        [p,h,stat] = ranksum( Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).post, Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).pre);
        Da.SDT.DSS.criterion.difficult.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleSameStim'}, {'criterion'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , stat.ranksum, {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [H,P,CI,STATS] = ttest(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pre, Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pvalue = P;
        median_Pre  = median(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).post) ;
        Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).post) + length(Da.SDT.DSS.pFA.easy.(SET.positionExp{indPos}).pre));
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'easy'} , (SET.positionExp(indPos)) ,round(P,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [H,P,CI,STATS] = ttest(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pvalue = P;
        median_Pre  = median(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).post) ;
        Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).post) + length(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).pre));
        
        disp([median_Pre ,' ',  median_Post, 'Da.SDT.DSS.pFA ', 'difficult ' , (SET.positionExp{indPos}) '_',num2str(round(P,SET.roundValue)),'_r=', num2str(round(Da.SDT.DSS.pFA.difficult.(SET.positionExp{indPos}).r,3))] )
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleSameStim'}, {'pFA'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(P,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [H,P,CI,STATS] = ttest(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pre, Da.SDT.DSS.pHit.(SET.positionExp{indPos}).post);
        Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pvalue = P;
        median_Pre  = median(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pre) ;
        median_Post = median(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).post) ;
        Da.SDT.DSS.pHit.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).post) + length(Da.SDT.DSS.pHit.(SET.positionExp{indPos}).pre));
        
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


%% GRAPH
%% graph - Easy_Graph1HR_FAR_Graph2Sensitivity_Criterion
figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
set(gcf,'Name',[monkey, '_Easy' ]);
set(gcf,'Color',[1 1 1]);

ha(2) = subplot(1,2,1);
%ipsi Post

for i = 1: length(Da.SDT.DSS.pFA.easy.ipsi.pre)
    plot(Da.SDT.DSS.pFA.easy.ipsi.post(i), Da.SDT.DSS.pHit.ipsi.post(i), 'o' ,'color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession, 'MarkerFaceColor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
    plot(Da.SDT.DSS.pFA.easy.contra.post(i), Da.SDT.DSS.pHit.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
    
    line([Da.SDT.DSS.pFA.easy.ipsi.pre(i),Da.SDT.DSS.pFA.easy.ipsi.post(i)], [Da.SDT.DSS.pHit.ipsi.pre(i),Da.SDT.DSS.pHit.ipsi.post(i)],'Color',[SET.Plot.Color.Ipsi, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    line([Da.SDT.DSS.pFA.easy.contra.pre(i),Da.SDT.DSS.pFA.easy.contra.post(i)], [Da.SDT.DSS.pHit.contra.pre(i),Da.SDT.DSS.pHit.contra.post(i)],'Color',[SET.Plot.Color.Contra, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    
    %Fill the circle which is post
end
plot([nanmean(Da.SDT.DSS.pFA.easy.ipsi.pre),nanmean(Da.SDT.DSS.pFA.easy.ipsi.post)], [nanmean(Da.SDT.DSS.pHit.ipsi.pre),nanmean(Da.SDT.DSS.pHit.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Da.SDT.DSS.pFA.easy.contra.pre),nanmean(Da.SDT.DSS.pFA.easy.contra.post)], [nanmean(Da.SDT.DSS.pHit.contra.pre),nanmean(Da.SDT.DSS.pHit.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DSS.pFA.easy.ipsi.post), nanmean(Da.SDT.DSS.pHit.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Ipsi,'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DSS.pFA.easy.contra.post), nanmean(Da.SDT.DSS.pHit.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', SET.Plot.LineWidthSize); hold on;
legend('ipsi', 'contra', 'Location', 'South')

%title('easy')

line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',SET.Plot.fs)
xlabel( 'FA rate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
axis square


if Da.SDT.DSS.pFA.easy.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pFA.easy.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DSS.pFA.easy.ipsi.post);
    ymax = min(nanmean(Da.SDT.DSS.pHit.ipsi.pre) ,nanmean(Da.SDT.DSS.pHit.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pFA.easy.ipsi.pvalue,[],ymax -0.3,'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DSS.pHit.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pHit.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DSS.pHit.ipsi.post);
    ymax = max(nanmean(Da.SDT.DSS.pFA.easy.ipsi.pre) ,nanmean(Da.SDT.DSS.pFA.easy.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pHit.ipsi.pvalue,[],ymax +0.2,'y',SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DSS.pFA.easy.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pFA.easy.contra.pre) ;
    y2 = nanmean(Da.SDT.DSS.pFA.easy.contra.post);
    ymax = min(nanmean(Da.SDT.DSS.pHit.contra.pre) ,nanmean(Da.SDT.DSS.pHit.contra.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pFA.easy.contra.pvalue,[],ymax -0.2,'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DSS.pHit.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pHit.contra.pre) ;
    y2 = nanmean(Da.SDT.DSS.pHit.contra.post);
    ymax = max(nanmean(Da.SDT.DSS.pFA.easy.contra.pre) ,nanmean(Da.SDT.DSS.pFA.easy.contra.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pHit.contra.pvalue,[],ymax +0.2,'y', SET.Plot.Color.Contra); hold on;
end


ha(indPos) = subplot(1,2,2);
for i = 1: length(Da.SDT.DSS.d_prime.easy.contra.pre)
    plot([Da.SDT.DSS.d_prime.easy.contra.pre(i),Da.SDT.DSS.d_prime.easy.contra.post(i)],[Da.SDT.DSS.criterion.easy.contra.pre(i),Da.SDT.DSS.criterion.easy.contra.post(i)], 'o','color',[SET.Plot.Color.Contra, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;
    plot([Da.SDT.DSS.d_prime.easy.ipsi.pre(i),Da.SDT.DSS.d_prime.easy.ipsi.post(i)], [-Da.SDT.DSS.criterion.easy.ipsi.pre(i),-Da.SDT.DSS.criterion.easy.ipsi.post(i)], 'o','color',[SET.Plot.Color.Ipsi, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi
    plot(Da.SDT.DSS.d_prime.easy.contra.post(i),Da.SDT.DSS.criterion.easy.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra); hold on;
    plot(Da.SDT.DSS.d_prime.easy.ipsi.post(i),-Da.SDT.DSS.criterion.easy.ipsi.post(i), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi
end
plot([nanmean(Da.SDT.DSS.d_prime.easy.contra.pre),nanmean(Da.SDT.DSS.d_prime.easy.contra.post)],[nanmean(Da.SDT.DSS.criterion.easy.contra.pre) ,nanmean(Da.SDT.DSS.criterion.easy.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1 ], 'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Da.SDT.DSS.d_prime.easy.ipsi.pre),nanmean(Da.SDT.DSS.d_prime.easy.ipsi.post)],[ -nanmean(Da.SDT.DSS.criterion.easy.ipsi.pre) ,-nanmean(Da.SDT.DSS.criterion.easy.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ], 'LineWidth', SET.Plot.LineWidthSize); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi

plot(nanmean(Da.SDT.DSS.d_prime.easy.contra.post),nanmean(Da.SDT.DSS.criterion.easy.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Contra); hold on;
plot(nanmean(Da.SDT.DSS.d_prime.easy.ipsi.post),-nanmean(Da.SDT.DSS.criterion.easy.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi

if Da.SDT.DSS.d_prime.easy.ipsi.pvalue < 0.05
    ymax = max(nanmean(Da.SDT.DSS.criterion.easy.ipsi.pre) ,nanmean([Da.SDT.DSS.criterion.easy.ipsi.post]));
    ext_sigline([nanmean([Da.SDT.DSS.d_prime.easy.ipsi.pre]),nanmean([Da.SDT.DSS.d_prime.easy.ipsi.post])],Da.SDT.DSS.d_prime.easy.ipsi.pvalue,[ ],(ymax -1 ),'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DSS.criterion.easy.ipsi.pvalue < 0.05
    y1 = -1*nanmean(Da.SDT.DSS.criterion.easy.ipsi.pre) ;
    y2 = -1*nanmean([Da.SDT.DSS.criterion.easy.ipsi.post]);
    ymax = max(nanmean(Da.SDT.DSS.d_prime.easy.ipsi.pre) ,nanmean([Da.SDT.DSS.d_prime.easy.ipsi.post])) ;
    ext_sigline([y1,y2],Da.SDT.DSS.criterion.easy.ipsi.pvalue,[],ymax+ 0.2,'y', SET.Plot.Color.Ipsi); hold on;
end


if Da.SDT.DSS.d_prime.easy.contra.pvalue < 0.05
    ymax = max(nanmean(Da.SDT.DSS.criterion.easy.contra.pre) ,nanmean([Da.SDT.DSS.criterion.easy.contra.post]));
    ext_sigline([nanmean([Da.SDT.DSS.d_prime.easy.contra.pre]),nanmean([Da.SDT.DSS.d_prime.easy.contra.post])],Da.SDT.DSS.d_prime.easy.contra.pvalue,[ ],(ymax+ 0.8 ),'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DSS.criterion.easy.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.criterion.easy.contra.pre) ;
    y2 = nanmean([Da.SDT.DSS.criterion.easy.contra.post]);
    ymax = max(nanmean(Da.SDT.DSS.d_prime.easy.contra.pre) ,nanmean([Da.SDT.DSS.d_prime.easy.contra.post])) ;
    ext_sigline([y1,y2],Da.SDT.DSS.criterion.easy.contra.pvalue,[],ymax+ 0.1,'y',SET.Plot.Color.Contra); hold on;
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
for i = 1: length(Da.SDT.DSS.pFA.easy.ipsi.pre)
    plot(Da.SDT.DSS.pFA.difficult.ipsi.post(i), Da.SDT.DSS.pHit.ipsi.post(i), 'o' ,'color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_CritDpr_small, 'MarkerFaceColor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
    plot(Da.SDT.DSS.pFA.difficult.contra.post(i), Da.SDT.DSS.pHit.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
    line([Da.SDT.DSS.pFA.difficult.ipsi.pre(i),Da.SDT.DSS.pFA.difficult.ipsi.post(i)], [Da.SDT.DSS.pHit.ipsi.pre(i),Da.SDT.DSS.pHit.ipsi.post(i)],'Color',[SET.Plot.Color.Ipsi, 0.3] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    line([Da.SDT.DSS.pFA.difficult.contra.pre(i),Da.SDT.DSS.pFA.difficult.contra.post(i)], [Da.SDT.DSS.pHit.contra.pre(i),Da.SDT.DSS.pHit.contra.post(i)],'Color',[SET.Plot.Color.Contra 0.3] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    
    %Fill the circle which is post
end
plot([nanmean(Da.SDT.DSS.pFA.difficult.ipsi.pre),nanmean(Da.SDT.DSS.pFA.difficult.ipsi.post)], [nanmean(Da.SDT.DSS.pHit.ipsi.pre),nanmean(Da.SDT.DSS.pHit.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Da.SDT.DSS.pFA.difficult.contra.pre),nanmean(Da.SDT.DSS.pFA.difficult.contra.post)], [nanmean(Da.SDT.DSS.pHit.contra.pre),nanmean(Da.SDT.DSS.pHit.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DSS.pFA.difficult.ipsi.post), nanmean(Da.SDT.DSS.pHit.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
plot(nanmean(Da.SDT.DSS.pFA.difficult.contra.post), nanmean(Da.SDT.DSS.pHit.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
legend('ipsi', 'contra', 'Location', 'NorthWest')

%title('difficult')

line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',SET.Plot.fs)
xlabel( 'FA rate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
axis square


if Da.SDT.DSS.pFA.difficult.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pFA.difficult.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DSS.pFA.difficult.ipsi.post);
    if strcmp(monkey,'Cornelius' )
        ymax = min(nanmean(Da.SDT.DSS.pHit.ipsi.pre) ,nanmean(Da.SDT.DSS.pHit.ipsi.post))-0.3;
    else
        ymax = max(nanmean(Da.SDT.DSS.pHit.ipsi.pre) ,nanmean(Da.SDT.DSS.pHit.ipsi.post));
        
    end
    ext_sigline([y1,y2],Da.SDT.DSS.pFA.difficult.ipsi.pvalue,[],ymax ,'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DSS.pHit.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pHit.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DSS.pHit.ipsi.post);
    ymax = max(nanmean(Da.SDT.DSS.pFA.difficult.ipsi.pre) ,nanmean(Da.SDT.DSS.pFA.difficult.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pHit.ipsi.pvalue,[],ymax +0.1,'y',SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DSS.pFA.difficult.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pFA.difficult.contra.pre) ;
    y2 = nanmean(Da.SDT.DSS.pFA.difficult.contra.post);
    ymax = min(nanmean(Da.SDT.DSS.pHit.contra.pre) ,nanmean(Da.SDT.DSS.pHit.contra.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pFA.difficult.contra.pvalue,[],ymax-0.1,'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DSS.pHit.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.pHit.contra.pre) ;
    y2 = nanmean(Da.SDT.DSS.pHit.contra.post);
    ymax = max(nanmean(Da.SDT.DSS.pFA.difficult.contra.pre) ,nanmean(Da.SDT.DSS.pFA.difficult.contra.post));
    ext_sigline([y1,y2],Da.SDT.DSS.pHit.contra.pvalue,[],ymax +0.1,'y',SET.Plot.Color.Contra); hold on;
end


ha(indPos) = subplot(1,2,2);
for i = 1: length(Da.SDT.DSS.d_prime.difficult.contra.pre)
    plot([Da.SDT.DSS.d_prime.difficult.contra.pre(i),Da.SDT.DSS.d_prime.difficult.contra.post(i)],[Da.SDT.DSS.criterion.difficult.contra.pre(i),Da.SDT.DSS.criterion.difficult.contra.post(i)], 'o','color',[SET.Plot.Color.Contra 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;
    plot([Da.SDT.DSS.d_prime.difficult.ipsi.pre(i),Da.SDT.DSS.d_prime.difficult.ipsi.post(i)], [-Da.SDT.DSS.criterion.difficult.ipsi.pre(i),-Da.SDT.DSS.criterion.difficult.ipsi.post(i)], 'o','color',[SET.Plot.Color.Ipsi 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi
    plot(Da.SDT.DSS.d_prime.difficult.contra.post(i),Da.SDT.DSS.criterion.difficult.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra); hold on;
    plot(Da.SDT.DSS.d_prime.difficult.ipsi.post(i),-Da.SDT.DSS.criterion.difficult.ipsi.post(i), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi
end
plot([nanmean(Da.SDT.DSS.d_prime.difficult.contra.pre),nanmean(Da.SDT.DSS.d_prime.difficult.contra.post)],[nanmean(Da.SDT.DSS.criterion.difficult.contra.pre) ,nanmean(Da.SDT.DSS.criterion.difficult.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ], 'LineWidth',SET.Plot.LineWidthSize); hold on;
plot([nanmean(Da.SDT.DSS.d_prime.difficult.ipsi.pre),nanmean(Da.SDT.DSS.d_prime.difficult.ipsi.post)],[ -nanmean(Da.SDT.DSS.criterion.difficult.ipsi.pre) ,-nanmean(Da.SDT.DSS.criterion.difficult.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ], 'LineWidth',SET.Plot.LineWidthSize); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi

plot(nanmean(Da.SDT.DSS.d_prime.difficult.contra.post),nanmean(Da.SDT.DSS.criterion.difficult.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Contra); hold on;
plot(nanmean(Da.SDT.DSS.d_prime.difficult.ipsi.post),-nanmean(Da.SDT.DSS.criterion.difficult.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DSS.criterion for ipsi

if Da.SDT.DSS.d_prime.difficult.ipsi.pvalue < 0.05
    ymax = max(nanmean(Da.SDT.DSS.criterion.difficult.ipsi.pre) ,nanmean([Da.SDT.DSS.criterion.difficult.ipsi.post]));
    ext_sigline([nanmean([Da.SDT.DSS.d_prime.difficult.ipsi.pre]),nanmean([Da.SDT.DSS.d_prime.difficult.ipsi.post])],Da.SDT.DSS.d_prime.difficult.ipsi.pvalue,[ ],(ymax -1 ),'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DSS.criterion.difficult.ipsi.pvalue < 0.05
    y1 = -1*nanmean(Da.SDT.DSS.criterion.difficult.ipsi.pre) ;
    y2 = -1*nanmean([Da.SDT.DSS.criterion.difficult.ipsi.post]);
    ymax = max(nanmean(Da.SDT.DSS.d_prime.difficult.ipsi.pre) ,nanmean([Da.SDT.DSS.d_prime.difficult.ipsi.post])) ;
    ext_sigline([y1,y2],Da.SDT.DSS.criterion.difficult.ipsi.pvalue,[],ymax+ 1,'y', SET.Plot.Color.Ipsi); hold on;
end


if Da.SDT.DSS.d_prime.difficult.contra.pvalue < 0.05
    ymax = max(nanmean(Da.SDT.DSS.criterion.difficult.contra.pre) ,nanmean([Da.SDT.DSS.criterion.difficult.contra.post]));
    ext_sigline([nanmean([Da.SDT.DSS.d_prime.difficult.contra.pre]),nanmean([Da.SDT.DSS.d_prime.difficult.contra.post])],Da.SDT.DSS.d_prime.difficult.contra.pvalue,[ ],(ymax+ 0.8 ),'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DSS.criterion.difficult.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DSS.criterion.difficult.contra.pre) ;
    y2 = nanmean([Da.SDT.DSS.criterion.difficult.contra.post]);
    ymax = max(nanmean(Da.SDT.DSS.d_prime.difficult.contra.pre) ,nanmean([Da.SDT.DSS.d_prime.difficult.contra.post])) ;
    ext_sigline([y1,y2],Da.SDT.DSS.criterion.difficult.contra.pvalue,[],ymax+ 0.7,'y', SET.Plot.Color.Contra); hold on;
end
axis square
xlabel('sensitivity','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
ylabel('criterion','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
set(gca,'ylim',[-3 3],'xlim',SET.Plot.xlim_SDT_diff ,'fontsize',SET.Plot.fs)

text(SET.Plot.xlim_SDT_diff(1) +0.1,-2.8, 'more Contra (ipsi:NoGo, contra:Go)', 'Color', 'k','fontsize',14)
text(SET.Plot.xlim_SDT_diff(1) +0.1,2.8, 'less Contra (ipsi:Go, contra:NoGo)', 'Color', 'k','fontsize',14)



