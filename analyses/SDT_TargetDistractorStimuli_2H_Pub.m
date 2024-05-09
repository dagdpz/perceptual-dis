function SDT_TargetDistractorStimuli_2H_Pub(monkey, SET )
% SDT_TargetDistractorStimuli_2H_Pub - Perform statistic to compare Ctr vs.
% Ina sessions and create Figure 6 for the manuscript

% USAGE:
% SDT_TargetDistractorStimuli_2H_Pub('Curius',path_SaveFig, SET );

% INPUTS:
% monkey   (Subject name)
% SET (Settings)

% REQUIRES: Igtools

% OUTPUTS:
% Statistic and Graphs
% Author(s):  K.Kaduk, DAG, DPZ
% URL:		http://www.dpz.eu/dag



close all;


%% load the Da.SDT.DDS
Files = dir(['Data',filesep, monkey , '_SDT_RT_Acc.mat' ]);
load(['Data',filesep, Files(end).name ])
disp( ['dataset to analyze: ' Files(end).name ])


%% Statistic - Contrast: Pre vs Post
TablePwerte = [];

if  SET.NonParametri == 0
    disp(['independent t-test (ttest2) is displayed for the' , monkey, 'Target_Distractor trials'] )
    for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
        [h,p,ci,stats]  = ttest2( Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).post, Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'dprime'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2( Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).post, Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).tstat = stats.tstat;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'criterion'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2( Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).post, Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'dprime'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stats]  = ttest2( Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).post, Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).tstat = stats.tstat;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'criterion'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).tstat,2), {'indepTtest '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [h,p,ci,stat] = ttest2( Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).post, Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).tstat = stat.tstat;
        Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).post) + length(Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).pre));
        
        
        [h,p,ci,stat] = ttest2( Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).post, Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).tstat = stat.tstat;
        Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).post) + length( Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).pre));
        
        
        [h,p,ci,stat] = ttest2( Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).post, Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).tstat = stat.tstat;
        Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).post) + length(Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).pre));
        
        [h,p,ci,stat] = ttest2( Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).post, Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).pre);
        Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).pvalue = p;
        Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).tstat = stat.tstat;
        Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).r = norminv(p)/sqrt(length(Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).post) + length(Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pre));
        
    end
else
    for indPos = 1:length(SET.positionExp) %contra vs ipsi selection
        disp(['non-parametric test (ranksum, independent) is displayed for the',  'experiment'] )
        
        [p,h,stat] = ranksum(Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).pre, Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).pvalue = p;
        
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleDiffStim'}, {'dprime'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , round(stat.ranksum,2), {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [p,h,stat] = ranksum(Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).pre, Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleDiffStim'}, {'criterion'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , round(stat.ranksum,2), {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [p,h,stat] = ranksum(Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleDiffStim'}, {'dprime'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , round(stat.ranksum,2), {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [p,h,stat] = ranksum(Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey }, {'DoubleDiffStim'}, {'criterion'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'U'} , round(stat.ranksum,2), {'ranksum '} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [p,h,stat] = ranksum(Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).pre_direct, Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).post_direct);
        Da.SDT.DDS.d_prime.easy.(SET.positionExp{indPos}).pvalue_direct = p;
        TabPwerte = [ ];
        
        
        [p,h,stat] = ranksum(Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).pre_direct, Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).post_direct);
        Da.SDT.DDS.criterion.easy.(SET.positionExp{indPos}).pvalue_direct = p;
        
        
        [p,h,stat] = ranksum(Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).pre_direct, Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).post_direct);
        Da.SDT.DDS.d_prime.difficult.(SET.positionExp{indPos}).pvalue_direct = p;
        
        [p,h,stat] = ranksum(Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pre_direct, Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).post_direct);
        Da.SDT.DDS.criterion.difficult.(SET.positionExp{indPos}).pvalue_direct = p;
        
        
        
        [H, p,CI,STATS] = ttest(Da.SDT.DDS.Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).pre, Da.SDT.DDS.Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.Da.SDT.DDS.pFA.easy.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'pFA'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [H, p,CI,STATS] = ttest(Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).pre, Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.pHit.easy.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'pHit'},{ 'easy'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
        [H, p,CI,STATS]= ttest(Da.SDT.DDS.Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DDS.Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.Da.SDT.DDS.pFA.difficult.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'pFA'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        [H, p,CI,STATS] = ttest(Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).pre, Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).post);
        Da.SDT.DDS.pHit.difficult.(SET.positionExp{indPos}).pvalue = p;
        TabPwerte = [ ];
        TabPwerte = table({monkey}, {'DoubleDiffStim'}, {'pHit'},{ 'difficult'} , (SET.positionExp(indPos)) ,round(p,SET.roundValue),{'t'} , round(STATS.tstat,3), {'depTtest'} );
        TablePwerte = [ TablePwerte; TabPwerte ];
        
        
    end
end

TablePwerte.Properties.VariableNames = {'Monkey', 'Stimulus_type', 'Measure', 'Difficulty', 'Hemifield', 'p_value','teststatistic', 't_value', 'Statistic'};

if SET.SaveTable == 1;
    filename =[path_SaveFig,filesep,'Table', filesep,monkey, filesep monkey, '_SDTvarPwerte_DoubleDiffStim.xlsx' ] ;
    writetable(TablePwerte,filename,'Sheet',1,  'Range' ,'A1' )
    disp(['SAVED   ', filename])
end


%% Graph
%% Graph Difficult:  Hitrate vs False alarm rate & Dprime vs. Da.SDT.DDS.criterion
figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
set(gcf,'Name',[monkey, '_Difficult' ]);
set(gcf,'Color',[1 1 1]);


ha(2) = subplot(1,2,1);
%ipsi Post

for i = 1: length(Da.SDT.DDS.pFA.easy.ipsi.pre)
    plot(Da.SDT.DDS.pFA.difficult.ipsi.post(i), Da.SDT.DDS.pHit.difficult.ipsi.post(i), 'o' ,'color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession, 'MarkerFaceColor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
    plot(Da.SDT.DDS.pFA.difficult.contra.post(i), Da.SDT.DDS.pHit.difficult.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
    
    line([Da.SDT.DDS.pFA.difficult.ipsi.pre(i),Da.SDT.DDS.pFA.difficult.ipsi.post(i)], [Da.SDT.DDS.pHit.difficult.ipsi.pre(i),Da.SDT.DDS.pHit.difficult.ipsi.post(i)],'Color',[SET.Plot.Color.Ipsi, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    line([Da.SDT.DDS.pFA.difficult.contra.pre(i),Da.SDT.DDS.pFA.difficult.contra.post(i)], [Da.SDT.DDS.pHit.difficult.contra.pre(i),Da.SDT.DDS.pHit.difficult.contra.post(i)],'Color',[SET.Plot.Color.Contra, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    
    %Fill the circle which is post
end
plot([nanmean(Da.SDT.DDS.pFA.difficult.ipsi.pre),nanmean(Da.SDT.DDS.pFA.difficult.ipsi.post)], [nanmean(Da.SDT.DDS.pHit.difficult.ipsi.pre),nanmean(Da.SDT.DDS.pHit.difficult.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Da.SDT.DDS.pFA.difficult.contra.pre),nanmean(Da.SDT.DDS.pFA.difficult.contra.post)], [nanmean(Da.SDT.DDS.pHit.difficult.contra.pre),nanmean(Da.SDT.DDS.pHit.difficult.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DDS.pFA.difficult.ipsi.post), nanmean(Da.SDT.DDS.pHit.difficult.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Ipsi,'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DDS.pFA.difficult.contra.post), nanmean(Da.SDT.DDS.pHit.difficult.contra.post), 'o','color',SET.Plot.Color.Contra, 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', SET.Plot.LineWidthSize); hold on;
legend('ipsi', 'contra', 'Location', 'South')

%S('difficult')

line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',SET.Plot.fs)
xlabel( 'FA rate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
axis square


if Da.SDT.DDS.pFA.difficult.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pFA.difficult.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DDS.pFA.difficult.ipsi.post);
    ymax = min(nanmean(Da.SDT.DDS.pHit.difficult.ipsi.pre) ,nanmean(Da.SDT.DDS.pHit.difficult.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pFA.difficult.ipsi.pvalue,[],ymax -0.3,'x',SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DDS.pHit.difficult.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pHit.difficult.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DDS.pHit.difficult.ipsi.post);
    ymax = max(nanmean(Da.SDT.DDS.pFA.difficult.ipsi.pre) ,nanmean(Da.SDT.DDS.pFA.difficult.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pHit.difficult.ipsi.pvalue,[],ymax +0.2,'y',SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DDS.pFA.difficult.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pFA.difficult.contra.pre) ;
    y2 = nanmean(Da.SDT.DDS.pFA.difficult.contra.post);
    ymax = min(nanmean(Da.SDT.DDS.pHit.difficult.contra.pre) ,nanmean(Da.SDT.DDS.pHit.difficult.contra.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pFA.difficult.contra.pvalue,[],ymax -0.2,'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DDS.pHit.difficult.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pHit.difficult.contra.pre) ;
    y2 = nanmean(Da.SDT.DDS.pHit.difficult.contra.post);
    ymax = max(nanmean(Da.SDT.DDS.pFA.difficult.contra.pre) ,nanmean(Da.SDT.DDS.pFA.difficult.contra.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pHit.difficult.contra.pvalue,[],ymax +0.2,'y',SET.Plot.Color.Contra); hold on;
end


ha(indPos) = subplot(1,2,2);

for i = 1: length(Da.SDT.DDS.d_prime.difficult.contra.pre)
    plot([Da.SDT.DDS.d_prime.difficult.contra.pre(i),Da.SDT.DDS.d_prime.difficult.contra.post(i)],[Da.SDT.DDS.criterion.difficult.contra.pre(i),Da.SDT.DDS.criterion.difficult.contra.post(i)], 'o','color',[SET.Plot.Color.Contra 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;
    plot([Da.SDT.DDS.d_prime.difficult.ipsi.pre(i),Da.SDT.DDS.d_prime.difficult.ipsi.post(i)], [-Da.SDT.DDS.criterion.difficult.ipsi.pre(i),-Da.SDT.DDS.criterion.difficult.ipsi.post(i)], 'o','color',[SET.Plot.Color.Ipsi, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi
    plot(Da.SDT.DDS.d_prime.difficult.contra.post(i),Da.SDT.DDS.criterion.difficult.contra.post(i), 'o','color',SET.Plot.Color.Contra, 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra); hold on;
    plot(Da.SDT.DDS.d_prime.difficult.ipsi.post(i),-Da.SDT.DDS.criterion.difficult.ipsi.post(i), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi
end
plot([nanmean(Da.SDT.DDS.d_prime.difficult.contra.pre),nanmean(Da.SDT.DDS.d_prime.difficult.contra.post)],[nanmean(Da.SDT.DDS.criterion.difficult.contra.pre) ,nanmean(Da.SDT.DDS.criterion.difficult.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ],'LineWidth',SET.Plot.LineWidthSize ); hold on;
plot([nanmean(Da.SDT.DDS.d_prime.difficult.ipsi.pre),nanmean(Da.SDT.DDS.d_prime.difficult.ipsi.post)],[ -nanmean(Da.SDT.DDS.criterion.difficult.ipsi.pre) ,-nanmean(Da.SDT.DDS.criterion.difficult.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ],'LineWidth',SET.Plot.LineWidthSize ); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi

plot(nanmean(Da.SDT.DDS.d_prime.difficult.contra.post),nanmean(Da.SDT.DDS.criterion.difficult.contra.post), 'o','color',SET.Plot.Color.Contra, 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Contra); hold on;
plot(nanmean(Da.SDT.DDS.d_prime.difficult.ipsi.post),-nanmean(Da.SDT.DDS.criterion.difficult.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi

if Da.SDT.DDS.d_prime.difficult.ipsi.pvalue < 0.05
    ymax = max(-1*nanmean(Da.SDT.DDS.criterion.difficult.ipsi.pre) ,nanmean(-1*[Da.SDT.DDS.criterion.difficult.ipsi.post]));
    ext_sigline([nanmean([Da.SDT.DDS.d_prime.difficult.ipsi.pre]),nanmean([Da.SDT.DDS.d_prime.difficult.ipsi.post])],Da.SDT.DDS.d_prime.difficult.ipsi.pvalue,[ ],(ymax -1 ),'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DDS.criterion.difficult.ipsi.pvalue < 0.05
    y1 = -1*nanmean(Da.SDT.DDS.criterion.difficult.ipsi.pre) ;
    y2 = -1*nanmean([Da.SDT.DDS.criterion.difficult.ipsi.post]);
    ymax = max(nanmean(Da.SDT.DDS.d_prime.difficult.ipsi.pre) ,nanmean([Da.SDT.DDS.d_prime.difficult.ipsi.post])) ;
    ext_sigline([y1,y2],Da.SDT.DDS.criterion.difficult.ipsi.pvalue,[],ymax+ 0.5,'y', SET.Plot.Color.Ipsi); hold on;
end


if Da.SDT.DDS.d_prime.difficult.contra.pvalue < 0.05
    ymax = max(nanmean(Da.SDT.DDS.criterion.difficult.contra.pre) ,nanmean([Da.SDT.DDS.criterion.difficult.contra.post]));
    ext_sigline([nanmean([Da.SDT.DDS.d_prime.difficult.contra.pre]),nanmean([Da.SDT.DDS.d_prime.difficult.contra.post])],Da.SDT.DDS.d_prime.difficult.contra.pvalue,[ ],(ymax+ 0.8 ),'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DDS.criterion.difficult.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.criterion.difficult.contra.pre) ;
    y2 = nanmean([Da.SDT.DDS.criterion.difficult.contra.post]);
    ymax = max(nanmean(Da.SDT.DDS.d_prime.difficult.contra.pre) ,nanmean([Da.SDT.DDS.d_prime.difficult.contra.post])) ;
    ext_sigline([y1,y2],Da.SDT.DDS.criterion.difficult.contra.pvalue,[],ymax+ 0.3,'y', SET.Plot.Color.Contra); hold on;
end
axis square
xlabel('sensitivity','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
ylabel('Da.SDT.DDS.criterion','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
set(gca,'ylim',[-3 3],'xlim',SET.Plot.xlim_SDT_diff,'fontsize',SET.Plot.fs)

text(SET.Plot.xlim_SDT_diff(1)+0.1,-2.8, 'more Contra (ipsi:NoGo, contra:Go)', 'Color', 'k','fontsize',18)
text(SET.Plot.xlim_SDT_diff(1)+0.1,2.8, 'less Contra (ipsi:Go, contra:NoGo)', 'Color', 'k','fontsize',18)




%% EASY - GRAPHS
figure('Position',[200 200 1200 900],'PaperPositionMode','auto'); % ,'PaperOrientation','landscape'
set(gcf,'Name',[monkey, '_Easy' ]);
set(gcf,'Color',[1 1 1]);



ha(2) = subplot(1,2,1);
%ipsi Post

for i = 1: length(Da.SDT.DDS.pFA.easy.ipsi.pre)
    plot(Da.SDT.DDS.pFA.easy.ipsi.post(i), Da.SDT.DDS.pHit.easy.ipsi.post(i), 'o' ,'color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession, 'MarkerFaceColor',SET.Plot.Color.Ipsi,'LineWidth', 2); hold on;
    plot(Da.SDT.DDS.pFA.easy.contra.post(i), Da.SDT.DDS.pHit.easy.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', 2); hold on;
    
    line([Da.SDT.DDS.pFA.easy.ipsi.pre(i),Da.SDT.DDS.pFA.easy.ipsi.post(i)], [Da.SDT.DDS.pHit.easy.ipsi.pre(i),Da.SDT.DDS.pHit.easy.ipsi.post(i)],'Color',[SET.Plot.Color.Ipsi, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    line([Da.SDT.DDS.pFA.easy.contra.pre(i),Da.SDT.DDS.pFA.easy.contra.post(i)], [Da.SDT.DDS.pHit.easy.contra.pre(i),Da.SDT.DDS.pHit.easy.contra.post(i)],'Color',[SET.Plot.Color.Contra, 0.3] , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR_PerSession,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
    
    %Fill the circle which is post
end
plot([nanmean(Da.SDT.DDS.pFA.easy.ipsi.pre),nanmean(Da.SDT.DDS.pFA.easy.ipsi.post)], [nanmean(Da.SDT.DDS.pHit.easy.ipsi.pre),nanmean(Da.SDT.DDS.pHit.easy.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot([nanmean(Da.SDT.DDS.pFA.easy.contra.pre),nanmean(Da.SDT.DDS.pFA.easy.contra.post)], [nanmean(Da.SDT.DDS.pHit.easy.contra.pre),nanmean(Da.SDT.DDS.pHit.easy.contra.post)], 'o-','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR,'markerfacecolor',[1 1 1],'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DDS.pFA.easy.ipsi.post), nanmean(Da.SDT.DDS.pHit.easy.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Ipsi,'LineWidth', SET.Plot.LineWidthSize); hold on;
plot(nanmean(Da.SDT.DDS.pFA.easy.contra.post), nanmean(Da.SDT.DDS.pHit.easy.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_GraphFAR_HR-1,'markerfacecolor',SET.Plot.Color.Contra,'LineWidth', SET.Plot.LineWidthSize); hold on;
legend('ipsi', 'contra', 'Location', 'South')

%title('easy')

line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',SET.Plot.fs)
xlabel( 'FA rate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none' );
axis square


if Da.SDT.DDS.pFA.easy.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pFA.easy.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DDS.pFA.easy.ipsi.post);
    ymax = min(nanmean(Da.SDT.DDS.pHit.easy.ipsi.pre) ,nanmean(Da.SDT.DDS.pHit.easy.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pFA.easy.ipsi.pvalue,[],ymax -0.3,'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DDS.pHit.easy.ipsi.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pHit.easy.ipsi.pre) ;
    y2 = nanmean(Da.SDT.DDS.pHit.easy.ipsi.post);
    ymax = max(nanmean(Da.SDT.DDS.pFA.easy.ipsi.pre) ,nanmean(Da.SDT.DDS.pFA.easy.ipsi.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pHit.easy.ipsi.pvalue,[],ymax +0.2,'y',SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DDS.pFA.easy.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pFA.easy.contra.pre) ;
    y2 = nanmean(Da.SDT.DDS.pFA.easy.contra.post);
    ymax = min(nanmean(Da.SDT.DDS.pHit.easy.contra.pre) ,nanmean(Da.SDT.DDS.pHit.easy.contra.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pFA.easy.contra.pvalue,[],ymax -0.2,'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DDS.pHit.easy.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.pHit.easy.contra.pre) ;
    y2 = nanmean(Da.SDT.DDS.pHit.easy.contra.post);
    ymax = max(nanmean(Da.SDT.DDS.pFA.easy.contra.pre) ,nanmean(Da.SDT.DDS.pFA.easy.contra.post));
    ext_sigline([y1,y2],Da.SDT.DDS.pHit.easy.contra.pvalue,[],ymax +0.2,'y',SET.Plot.Color.Contra); hold on;
end


ha(indPos) = subplot(1,2,2);
for i = 1: length(Da.SDT.DDS.d_prime.easy.contra.pre)
    plot([Da.SDT.DDS.d_prime.easy.contra.pre(i),Da.SDT.DDS.d_prime.easy.contra.post(i)],[Da.SDT.DDS.criterion.easy.contra.pre(i),Da.SDT.DDS.criterion.easy.contra.post(i)], 'o','color',[SET.Plot.Color.Contra, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;
    plot([Da.SDT.DDS.d_prime.easy.ipsi.pre(i),Da.SDT.DDS.d_prime.easy.ipsi.post(i)], [-Da.SDT.DDS.criterion.easy.ipsi.pre(i),-Da.SDT.DDS.criterion.easy.ipsi.post(i)], 'o','color',[SET.Plot.Color.Ipsi, 0.4] , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',[1 1 1 ]); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi
    plot(Da.SDT.DDS.d_prime.easy.contra.post(i),Da.SDT.DDS.criterion.easy.contra.post(i), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Contra); hold on;
    plot(Da.SDT.DDS.d_prime.easy.ipsi.post(i),-Da.SDT.DDS.criterion.easy.ipsi.post(i), 'o','color',SET.Plot.Color.Ipsi, 'MarkerSize',SET.Plot.MarkSize_CritDpr_small,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi
end
plot([nanmean(Da.SDT.DDS.d_prime.easy.ipsi.pre),nanmean(Da.SDT.DDS.d_prime.easy.ipsi.post)],[ -nanmean(Da.SDT.DDS.criterion.easy.ipsi.pre) ,-nanmean(Da.SDT.DDS.criterion.easy.ipsi.post)], 'o-','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ],'LineWidth',SET.Plot.LineWidthSize ); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi
plot(nanmean(Da.SDT.DDS.d_prime.easy.ipsi.post),-nanmean(Da.SDT.DDS.criterion.easy.ipsi.post), 'o','color',SET.Plot.Color.Ipsi , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Ipsi); hold on;% reverse direction of Da.SDT.DDS.criterion for ipsi
plot([nanmean(Da.SDT.DDS.d_prime.easy.contra.pre),nanmean(Da.SDT.DDS.d_prime.easy.contra.post)],[nanmean(Da.SDT.DDS.criterion.easy.contra.pre) ,nanmean(Da.SDT.DDS.criterion.easy.contra.post)], 'o-','color',SET.Plot.Color.Contra, 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',[1 1 1 ],'LineWidth',SET.Plot.LineWidthSize ); hold on;
plot(nanmean(Da.SDT.DDS.d_prime.easy.contra.post),nanmean(Da.SDT.DDS.criterion.easy.contra.post), 'o','color',SET.Plot.Color.Contra , 'MarkerSize',SET.Plot.MarkSize_CritDpr,'markerfacecolor',SET.Plot.Color.Contra); hold on;

if Da.SDT.DDS.d_prime.easy.ipsi.pvalue < 0.05
    ymax = max(-1*nanmean(Da.SDT.DDS.criterion.easy.ipsi.pre) ,-1*nanmean([Da.SDT.DDS.criterion.easy.ipsi.post]));
    ext_sigline([nanmean([Da.SDT.DDS.d_prime.easy.ipsi.pre]),nanmean([Da.SDT.DDS.d_prime.easy.ipsi.post])],Da.SDT.DDS.d_prime.easy.ipsi.pvalue,[ ],(ymax + 0.5 ),'x', SET.Plot.Color.Ipsi); hold on;
end
if Da.SDT.DDS.criterion.easy.ipsi.pvalue < 0.05
    y1 = -1*nanmean(Da.SDT.DDS.criterion.easy.ipsi.pre) ;
    y2 = -1*nanmean([Da.SDT.DDS.criterion.easy.ipsi.post]);
    ymax = max(nanmean(Da.SDT.DDS.d_prime.easy.ipsi.pre) ,nanmean([Da.SDT.DDS.d_prime.easy.ipsi.post])) ;
    ext_sigline([y1,y2],Da.SDT.DDS.criterion.easy.ipsi.pvalue,[],ymax+ 0.2,'y', SET.Plot.Color.Ipsi); hold on;
end


if Da.SDT.DDS.d_prime.easy.contra.pvalue < 0.05
    ymax = max(nanmean(Da.SDT.DDS.criterion.easy.contra.pre) ,nanmean([Da.SDT.DDS.criterion.easy.contra.post]));
    ext_sigline([nanmean([Da.SDT.DDS.d_prime.easy.contra.pre]),nanmean([Da.SDT.DDS.d_prime.easy.contra.post])],Da.SDT.DDS.d_prime.easy.contra.pvalue,[ ],(ymax- 0.8 ),'x', SET.Plot.Color.Contra); hold on;
end
if Da.SDT.DDS.criterion.easy.contra.pvalue < 0.05
    y1 = nanmean(Da.SDT.DDS.criterion.easy.contra.pre) ;
    y2 = nanmean([Da.SDT.DDS.criterion.easy.contra.post]);
    ymax = max(nanmean(Da.SDT.DDS.d_prime.easy.contra.pre) ,nanmean([Da.SDT.DDS.d_prime.easy.contra.post])) ;
    ext_sigline([y1,y2],Da.SDT.DDS.criterion.easy.contra.pvalue,[],ymax+ 0.1,'y', SET.Plot.Color.Contra); hold on;
end
axis square
xlabel('sensitivity','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
ylabel('criterion','fontsize',SET.Plot.fs,'fontweight','b', 'Interpreter', 'none')
set(gca,'ylim',[-3 3],'xlim',SET.Plot.xlim_SDT_easy,'fontsize',SET.Plot.fs)

text(SET.Plot.xlim_SDT_easy(1) + 0.1,-2.8, 'more Contra (ipsi:NoGo, contra:Go)', 'Color', 'k','fontsize',18)
text(SET.Plot.xlim_SDT_easy(1) + 0.1,2.8, 'less Contra (ipsi:Go, contra:NoGo)', 'Color', 'k','fontsize',18)

end


