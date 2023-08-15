function perdis_Simulate_SpatialSelectionHypo_PercepDeficitHypo(NameScenario)
% Read the README for Installation, Usage, Results

% perdis_Simulate_SpatialSelectionHypo_PercepDeficitHypo - simulates data
% according to the assumptions of the Spatial selection bias hypothesis or
% perceptual discrimination hypiothesis

%USAGE:
% perdis_Simulate_SpatialSelectionHypo_PercepDeficitHypo('Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis')

%INPUTS:
% Name of the simulated Scenario (all predefined scenarios can be found in perdis_SetScenario_ForDPulvInacManuscript

%REQUIRES:
% Igtools

%OUTPUTS:
% Dprime, False alarm rate, Hit rate, response criterion, accuracy, spatial selections

%Author(s):  K.Kaduk & I.Kagan, DAG, DPZ
%URL:		http://www.dpz.eu/dag


close all;
warning off;

% Proportion for Hits, Misses, FA, CR according to the scenario
[ H, M, FA, CR , Dprime_Change, StimulusType] = perdis_SetScenario_ForDPulvInacManuscript( NameScenario );

n_trials = 100;

H   = single(H*n_trials);
M   = single(M*n_trials);
FA  = single(FA*n_trials);
CR  = single(CR*n_trials);

%% Check if the proportion adding up to 100 & Calculate the Selection of target vs distractor (To compare with Lydia's findings)
switch StimulusType
    case 'Sgl_Stimuli'
        
        Accuracy(1)         = (H(2)+H(1)+ CR(1)+ CR(2))/(H(1) + H(2) + M(1)+ M(2)+CR(2) +  FA(1)+ CR(1)+ FA(2));
        Accuracy(2)         = (H(4)+H(3)+ CR(3)+ CR(4))/   (H(3) + H(4) + M(3)+ M(4)+ CR(4) +  FA(3)+ CR(3)+ FA(4));
        Accuracy_ipsi(1)    = (H(2)+ CR(2))/(H(2) + M(2)+CR(2) + FA(2));
        Accuracy_ipsi(2)    = (H(4)+ CR(4))/(H(4) + M(4)+ CR(4) + FA(4));
        Accuracy_contra(1)  = (H(1)+ CR(1))/(H(1) + M(1)+CR(1) + FA(1));
        Accuracy_contra(2)  = (H(3)+ CR(3))/(H(3) + M(3)+ CR(3) + FA(3));
        %TargetSelection
        Tar_IpsiSelection(1)    = H(2) ./ (H(2) + M(2));
        Tar_IpsiFixation(1)     = M(2) ./ (H(2) + M(2));
        Tar_ContraSelection(1)  = H(1) ./ (H(1) + M(1));
        Tar_ContraFixation(1)   = M(1) ./ (H(1) + M(1));
        Tar_IpsiSelection(2)    = H(4) ./ (H(4) + M(4));
        Tar_IpsiFixation(2)     = M(4) ./ (H(4) + M(4));
        Tar_ContraSelection(2)  = H(3) ./ (H(3) + M(3));
        Tar_ContraFixation(2)   = M(3) ./ (H(3) + M(3));
        %DistractorSelection
        Dis_IpsiSelection(1)    = FA(2)./ (FA(2) + CR(2));
        Dis_IpsiFixation(1)     = CR(2)./ (FA(2) + CR(2));
        Dis_ContraSelection(1)  = FA(1)./ (FA(1) + CR(1));
        Dis_ContraFixation(1)   = CR(1)./ (FA(1) + CR(1));
        Dis_IpsiSelection(2)    = FA(4)./ (FA(4) + CR(4));
        Dis_IpsiFixation(2)     = CR(4)./ (FA(4) + CR(4));
        Dis_ContraSelection(2)  = FA(3)./ (FA(3) + CR(3));
        Dis_ContraFixation(2)   = CR(3)./ (FA(3) + CR(3));
        
    case 'DoubleSameStimuli'
        if H(1)+ M(1)+ H(2) == 100 || H(1)+ M(2)+ H(2) == 100
            disp('Pre: target-trials: add up to 100')
        else
            disp('Pre: target-trials: DO NOT add up to 100')
            
        end
        if FA(1)+ CR(1)+ FA(2) == 100 || FA(1)+ CR(2)+ FA(2) == 100
            disp('Pre: distractor-trials: add up to 100')
        else
            disp('Pre: distractor-trials: DO NOT add up to 100')
            
        end
        if H(3)+ M(3)+ H(4) == 100 || H(3)+ M(4)+ H(4) == 100
            disp('Post: target-trials: add up to 100')
        else
            disp('Post: target-trials: DO NOT add up to 100')
            
        end
        if FA(3)+ CR(3)+ FA(4) == 100 || FA(3)+ CR(4)+ FA(4) == 100
            disp('Post: distractor-trials: add up to 100')
        else
            disp('Post: distractor-trials: DO NOT add up to 100')
            
        end
        
        Accuracy(1) = (H(2)+H(1)+ CR(1))/(H(1) + H(2) + M(1) + FA(1)+ CR(1)+ FA(2));
        Accuracy(2) = (H(4)+H(3)+ CR(3))/(H(3) + H(4) + M(3) + FA(3)+ CR(3)+ FA(4));
        
        Accuracy_ipsi(1) = (H(2)+ CR(2))/(H(1) + H(2) + M(1) + FA(1)+ CR(1)+ FA(2));
        Accuracy_ipsi(2) = (H(4)+ CR(4))/(H(3) + H(4) + M(3) + FA(3)+ CR(3)+ FA(4));
        
        Accuracy_contra(1) = (H(1)+ CR(1))/(H(1) + H(2) + M(1) + FA(1)+ CR(1)+ FA(2));
        Accuracy_contra(2) = (H(3)+ CR(3))/(H(3) + H(4) + M(3) + FA(3)+ CR(3)+ FA(4));
        
        Accuracy_ipsi_V2(1) = (H(2)+ CR(2) + FA(1))/(H(1) + H(2) + M(1) + CR(1)+ FA(2)+ FA(1));
        Accuracy_ipsi_V2(2) = (H(4)+ CR(4) + FA(3))/(H(3) + H(4) + M(3) + CR(3)+ FA(4)+ FA(3));
        
        Accuracy_contra_V2(1) = (H(1)+ CR(1) + FA(2))/(H(1) + H(2) + M(1) + FA(1)+ CR(1)+ FA(2));
        Accuracy_contra_V2(2) = (H(3)+ CR(3)+ FA(4))/(H(3) + H(4) + M(3) + FA(3)+ CR(3)+ FA(4));
        %TargetSelection
        Tar_IpsiSelection(1)    = H(2) ./ (H(1) + H(2) + M(1)); %ipsi
        Tar_ContraSelection(1)  = H(1) ./ (H(1) + H(2) + M(1));
        Tar_IpsiFixation(1)     = M(1) ./ (H(1) + H(2) + M(1));
        Tar_ContraFixation(1)   = Tar_IpsiFixation(1);
        Tar_IpsiSelection(2)    = H(4) ./ (H(3) + H(4) + M(3));
        Tar_ContraSelection(2)  = H(3) ./ (H(3) + H(4) + M(3));
        Tar_IpsiFixation(2)     = M(3) ./ (H(3) + H(4) + M(3));
        Tar_ContraFixation(2)     = Tar_IpsiFixation(2);
        
        %DistractorSelection
        Dis_IpsiSelection(1)    = FA(2) ./ (FA(1) + FA(2) + CR(1)); %ipsi
        Dis_ContraSelection(1)  = FA(1) ./ (FA(1) + FA(2) + CR(1));
        Dis_IpsiFixation(1)     = CR(1) ./ (FA(1) + FA(2) + CR(1));
        Dis_ContraFixation(1)   = Dis_IpsiFixation(1);
        Dis_IpsiSelection(2)    = FA(4) ./ (FA(3) + FA(4) + CR(3));
        Dis_ContraSelection(2)  = FA(3) ./ (FA(3) + FA(4) + CR(3));
        Dis_IpsiFixation(2)     = CR(3) ./ (FA(3) + FA(4) + CR(3));
        Dis_ContraFixation(2)   = Dis_IpsiFixation(2);
        
        
        
    case 'Double D-T Stimuli'
        
        if H(1)+ M(1)+ FA(2) == 100 && H(2)+ M(2)+ FA(1) == 100
            disp('Pre: target-trials: add up to 100')
        else
            disp('Pre: target-trials: DO NOT add up to 100')
        end
        if FA(1)+ CR(1)+ H(2) == 100 && FA(2)+ CR(2)+ H(1) == 100
            disp('Pre: distractor-trials: add up to 100')
        else
            disp('Pre: distractor-trials: DO NOT add up to 100')
        end
        if H(3)+ M(3)+ FA(4) == 100 && H(4)+ M(4)+ FA(3) == 100
            disp('Post: target-trials: add up to 100')
        else
            disp('Post: target-trials: DO NOT add up to 100')
        end
        if FA(3)+ CR(3)+ H(4) == 100 && FA(4)+ CR(4)+ H(3) == 100
            disp('Post: distractor-trials: add up to 100')
        else
            disp('Post: distractor-trials: DO NOT add up to 100')
        end
        Accuracy(1) = (H(2)+H(1))/(H(1) + FA(2) + M(1) + FA(1) + CR(1) + H(2) );
        Accuracy(2) = (H(4)+H(3))/(H(3) + FA(4) + M(3) + FA(3) + CR(3) + H(4));
        
        Accuracy_ipsi(1) = (H(2))/(H(1) + H(2) + M(1) +  FA(1)+ CR(1)+ FA(2));
        Accuracy_ipsi(2) = (H(4))/(H(3) + H(4) + M(3) +  FA(3)+ CR(3)+ FA(4));
        
        Accuracy_contra(1) = (H(1))/(H(1) + H(2) + M(1) +  FA(1)+ CR(1)+ FA(2));
        Accuracy_contra(2) = (H(3))/(H(3) + H(4) + M(3) +  FA(3)+ CR(3)+ FA(4));
        %TargetSelection
        Tar_IpsiSelection(1)    = H(2) ./ (FA(1) + H(2) + M(1)); %ipsi
        Tar_ContraSelection(1)  = H(1) ./ (H(1) + FA(2) + M(1));
        Tar_IpsiFixation(1)     = M(2) ./ (FA(1) + H(2) + M(2));
        Tar_ContraFixation(1)   = M(1) ./ (FA(2) + H(1) + M(1));
        Tar_IpsiSelection(2)    = H(4) ./ (FA(3) + H(4) + M(3));
        Tar_ContraSelection(2)  = H(3) ./ (H(3) + FA(4) + M(3));
        Tar_IpsiFixation(2)     = M(4) ./ (FA(3) + H(4) + M(4));
        Tar_ContraFixation(2)   = M(3) ./ (FA(4) + H(3) + M(3));
        %DistractorSelection
        Dis_IpsiSelection(1)    = FA(2) ./ (H(1) + FA(2) + CR(1)); %ipsi
        Dis_ContraSelection(1)  = FA(1) ./ (FA(1) + H(2) + CR(1));
        Dis_IpsiFixation(1)     = CR(2) ./ (H(1) + FA(2) + CR(2));
        Dis_ContraFixation(1)   = CR(1) ./ (H(2) + FA(1) + CR(1));
        %post
        Dis_IpsiSelection(2)    = FA(4) ./ (H(3) + FA(4) + CR(3));
        Dis_ContraSelection(2)  = FA(3) ./ (FA(3) + H(4) + CR(3));
        Dis_IpsiFixation(2)     = CR(4) ./ (H(3) + FA(4) + CR(4));
        Dis_ContraFixation(2)   = CR(3) ./ (H(4) + FA(3) + CR(3));
        

end


% avoid 0 or Inf probabilities
if any(H==0) || any(M==0) || any(FA==0) || any(CR==0),
    % add 0.5 to both the number of hits and the number of false alarms,
    % add 1 to both the number of signal trials and the number of noise trials; dubbed the loglinear approach (Hautus, 1995)
    disp('correcting...');
    n_trials = n_trials + 1;
    
    H = H + 0.5;
    M = M + 0.5;
    FA = FA + 0.5;
    CR = CR + 0.5;
    
end


%different proprotions of trials for hitrate & falsealarm dependent on type of Stimuli
if strcmp(StimulusType , 'Sgl_Stimuli')
    pHit = H ./ (H + M);
    pFA = FA ./ (FA + CR);
    
elseif strcmp(StimulusType , 'DoubleSameStimuli')
    % example: pHit = H (contra) ./ (H(contra) + M(contra) +H(ipsi));
   
    H_ = [H(2) H(1) H(4) H(3) ];
    FA_ = [FA(2) FA(1) FA(4) FA(3) ];
    pHit = H ./ (H + M +H_);
    pFA = FA ./ (FA + CR +FA_);   
    
elseif strcmp(StimulusType , 'Double D-T Stimuli')
    % example: pHit = H (contra) ./ (H(contra) + M(contra) +FA(ipsi));
    H_ = [H(2) H(1) H(4) H(3) ];
    FA_ = [FA(2) FA(1) FA(4) FA(3) ];
    pHit = H ./ (H + M +FA_);
    pFA = FA ./ (FA + CR +H_);
end

% Calculate dprime and criterion
for k = 1:4
    [dprime(k),beta(k),criterion(k)] = perdis_Cal_SDTvariables(pHit(k),pFA(k));
end


%% computations for the relationship between hitrate/false alarm rate for sensitivity, criterion and accuracy
step = 0.01;
cmb  = ig_nchoosek_with_rep_perm([0:step:1],2); %combvec([0:step:1],[0:step:1]); %
% 2 x Matrix with all combine all possible cases
pHR_S = cmb(:,1);
pFAR_S = cmb(:,2);

for k = 1:length(cmb(:,1)),
    [dprime_S(k),beta_S(k),criterion_S(k)] = perdis_Cal_SDTvariables(pHR_S(k),pFAR_S(k));
    Accuracy_S(k) = (pHR_S(k) + (1-pFAR_S(k))) /2;
end
idx = find(dprime_S == Inf | dprime_S == -Inf | isnan(dprime_S));
dprime_S(idx)   =[];
pFAR_S(idx)     =[];
pHR_S(idx)      =[];
criterion_S(idx)=[];
Accuracy_S(idx) =[];

%% Plot two main graph for Hit rate vs False alarm rate and Criterion vs Dprime

% Colors for Plotting
Color.Ipsi = [0 0 1 ];
Color.Contra = [1 0 1 ];
Title = 'ManuscriptFigure';
ig_figure('Position',[200 200 1200 900],'PaperPositionMode','auto','Name',[Title, ' - scenario - ',NameScenario]); % ,'PaperOrientation','landscape'


Plot_Colums = 3;
Plot_Rows = 1;
MarkSize = 20;
fs = 25; % font size
LineWith = 3;

a =  subplot(Plot_Rows,Plot_Colums,1);

if Dprime_Change
    Settings.Graph.cmap = colormap( a, cbrewer('div', 'RdYlGn', 100)); %colormap(flip(linspecer));
    scatter(pFAR_S,pHR_S,60,dprime_S, 'filled'); hold on;
elseif Dprime_Change == 0;
    Settings.Graph.cmap = colormap(a,cbrewer( 'div', 'BrBG', 100)); %colormap(flip(linspecer));
    scatter(pFAR_S,pHR_S,60,criterion_S, 'filled'); hold on;
end

plot([pFA(2),pFA(4)], [pHit(2),pHit(4)], 'o-','color',Color.Ipsi, 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith); hold on;
plot([pFA(4)], [pHit(4)], 'o','color',Color.Ipsi , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Ipsi,'LineWidth', LineWith); hold on;
line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
plot([pFA(1),pFA(3)], [pHit(1),pHit(3)], 'o-','color',Color.Contra , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith); hold on;
plot([pFA(3)], [pHit(3)], 'o','color',Color.Contra , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Contra,'LineWidth', LineWith); hold on;

set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',fs)
xlabel( 'False Alarm rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hit rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
axis square



subplot(Plot_Rows,Plot_Colums,2);
plot([dprime(2), dprime(4)],[-criterion(2),-criterion(4)] , 'o-','color',Color.Ipsi , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ],'LineWidth', LineWith); hold on;% reverse direction of criterion for ipsi
plot(dprime(4),-criterion(4), 'o','color',Color.Ipsi ,'MarkerSize',MarkSize,'markerfacecolor',Color.Ipsi);% reverse direction of criterion for ipsi
plot([dprime(1), dprime(3)],[criterion(1),criterion(3)], 'o-','color',Color.Contra , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ],'LineWidth', LineWith); hold on;
plot(dprime(3),criterion(3), 'o','color',Color.Contra ,'MarkerSize',MarkSize,'markerfacecolor',Color.Contra);
axis square
xlabel('Sensitivity','fontsize',fs,'fontweight','b', 'Interpreter', 'none')
ylabel('Criterion','fontsize',fs,'fontweight','b', 'Interpreter', 'none')
set(gca,'ylim',[-2 2],'xlim',[-1 4] ,'fontsize',fs)
text(-0.5,-1.8, 'More Contra', 'Color', 'k' ,'fontsize',20)
text(-0.5,1.8, 'Less Contra', 'Color', 'k' ,'fontsize',20)



%%
Plot_Rows = 2;
Plot_Colums = 3;
MarkSize = 15;
fs = 10; % font size


Title = 'AdditionalFigure';
ig_figure('Position',[200 200 1200 900],'PaperPositionMode','auto','Name',[Title, ' - scenario - ',NameScenario]); % ,'PaperOrientation','landscape'

subplot(Plot_Colums,Plot_Rows,1);
plot([1;2], [Tar_ContraSelection(1),Tar_ContraSelection(2)], 'o-','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ],'LineWidth', 2); hold on;
plot([1;2], [Tar_IpsiSelection(1),Tar_IpsiSelection(2)], 'o-','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1],'LineWidth', 2); hold on;
plot([1;2], [Tar_ContraFixation(1),Tar_ContraFixation(2)], 'o:','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0.5 0 0 ],'LineWidth', 2); hold on;
plot([1;2], [Tar_IpsiFixation(1),Tar_IpsiFixation(2)], 'o:','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0.5 ],'LineWidth', 2); hold on;

set(gca,'ylim',[0 1])
ylabel( 'Target','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',fs);
legend('sac con', 'sac ipsi', 'fix con', 'fix ipsi','Location','BestOutside')
axis square

subplot(Plot_Colums,Plot_Rows,2);
plot([1;2], [Dis_ContraSelection(1),Dis_ContraSelection(2)], 'o-','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0],'LineWidth', 2); hold on;
plot([1;2], [Dis_IpsiSelection(1),Dis_IpsiSelection(2)], 'o-','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1],'LineWidth', 2); hold on;
plot([1;2], [Dis_ContraFixation(1),Dis_ContraFixation(2)], 'o:','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0.5 0 0 ],'LineWidth', 2); hold on;
plot([1;2], [Dis_IpsiFixation(1),Dis_IpsiFixation(2)], 'o:','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0.5 ],'LineWidth', 2); hold on;
set(gca,'ylim',[0 1])
ylabel( 'Distractor','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',fs);
legend('sac con', 'sac ipsi', 'fix con', 'fix ipsi','Location','BestOutside')
axis square

% Accuracy
subplot(Plot_Colums,Plot_Rows,3);
plot([1;2], [Accuracy(1),Accuracy(2)], 'o','color',[0 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 0 ]); hold on;
line([1;2], [Accuracy(1),Accuracy(2)], 'Color',[0 0 0],'LineWidth', 2); hold on;
set(gca,'ylim',[0 1])
ylabel( 'Accuracy','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',fs);
axis square

subplot(Plot_Colums,Plot_Rows,4);
plot([1;2], [pHit(2),pHit(4)], 'o-','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1],'LineWidth', 2); hold on;
plot([1;2], [pHit(1),pHit(3)], 'o-','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ],'LineWidth', 2); hold on;
plot([1;2], [pFA(2),pFA(4)], '*--','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[0 0 1],'LineWidth', 2); hold on;
plot([1;2], [pFA(1),pFA(3)], '*--','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 0 0 ],'LineWidth', 2); hold on;

set(gca,'ylim',[0 1])
ylabel( 'Hitrate / FA rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
set(gca,'xlim',[0 3],'Xtick',1:2,'XTickLabel',{'pre' 'post'},'fontsize',fs);
legend('ipsi H', 'con H', 'ipsi FA', 'con FA','Location','BestOutside')
axis square

subplot(Plot_Colums,Plot_Rows,5);
plot([pFA(2),pFA(4)], [pHit(2),pHit(4)], 'o-','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
plot([pFA(1),pFA(3)], [pHit(1),pHit(3)], 'o-','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', 2); hold on;
plot([pFA(4)], [pHit(4)], 'o','color',[0 0 1] , 'MarkerSize',MarkSize-1,'markerfacecolor',[0 0 1],'LineWidth', 2); hold on;
plot([pFA(3)], [pHit(3)], 'o','color',[1 0 0] , 'MarkerSize',MarkSize-1,'markerfacecolor',[1 0 0],'LineWidth', 2); hold on;
line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',fs)
xlabel( 'FA rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
axis square
legend('pre ipsi', 'pre con', 'post ipsi', 'post con','Location','BestOutside')

subplot(Plot_Colums,Plot_Rows,6);
plot(dprime(3),criterion(3), 'o','color',[1 0 0] ,'MarkerSize',MarkSize,'markerfacecolor',[1 0 0]);hold on;
plot(dprime(1),criterion(1), 'o','color',[1 0 0] , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ]);
plot(dprime(2),-criterion(2), 'o','color',[0 0 1] , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ]);% reverse direction of criterion for ipsi
plot(dprime(4),-criterion(4), 'o','color',[0 0 1] ,'MarkerSize',MarkSize,'markerfacecolor',[0 0 1]);% reverse direction of criterion for ipsi

axis square
xlabel('sensitivity','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel('criterion','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
set(gca,'ylim',[-2 2],'xlim',[-1 4] ,'fontsize',fs)
legend('pre ipsi', 'pre con', 'post ipsi', 'post con','Location','BestOutside')




%% PLOT properties
MarkSize = 15;
fs = 25; % font size
LineWith = 3;


Title = 'AdditionalFigure';
ig_figure('Position',[200 200 1200 900],'PaperPositionMode','auto','Name',[Title, ' - scenario - ',NameScenario]); % ,'PaperOrientation','landscape'
Plot_Colums = 2;
Plot_Rows = 2;

%Hit rate vs False alarm rate
c = subplot(Plot_Rows,Plot_Colums,1);
Settings.Graph.cmap = colormap( c, cbrewer('div', 'RdYlGn', 100)); %colormap(flip(linspecer));
scatter(pFAR_S,pHR_S,60,dprime_S, 'filled'); hold on;
c = colorbar;
c.Label.String = 'sensitivity';
grid on;
plot([pFA(2),pFA(4)], [pHit(2),pHit(4)], 'o-','color',Color.Ipsi, 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith);
plot([pFA(4)], [pHit(4)], 'o','color',Color.Ipsi , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Ipsi,'LineWidth', LineWith); hold on;
line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
plot([pFA(1),pFA(3)], [pHit(1),pHit(3)], 'o-','color',Color.Contra , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith); hold on;
plot([pFA(3)], [pHit(3)], 'o','color',Color.Contra , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Contra,'LineWidth', LineWith); hold on;
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',fs)
xlabel( 'FA rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
axis square
hold off;

d = subplot(Plot_Rows,Plot_Colums,2);
Settings.Graph.cmap = colormap(d,cbrewer( 'div', 'BrBG', 100)); %colormap(flip(linspecer));
scatter(pFAR_S,pHR_S,60,criterion_S, 'filled'); hold on;
d = colorbar;
d.Label.String = 'criterion';
grid on;
plot([pFA(2),pFA(4)], [pHit(2),pHit(4)], 'o-','color',Color.Ipsi, 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith);
plot([pFA(4)], [pHit(4)], 'o','color',Color.Ipsi , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Ipsi,'LineWidth', LineWith); hold on;
line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
plot([pFA(1),pFA(3)], [pHit(1),pHit(3)], 'o-','color',Color.Contra , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith); hold on;
plot([pFA(3)], [pHit(3)], 'o','color',Color.Contra , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Contra,'LineWidth', LineWith); hold on;
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',fs)
xlabel( 'FA rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
axis square


e = subplot(Plot_Rows,Plot_Colums,3);
Settings.Graph.cmap = colormap( e, cbrewer('div', 'RdYlGn', 100)); %colormap(flip(linspecer));
scatter(pFAR_S,pHR_S,60,Accuracy_S, 'filled'); hold on;
e = colorbar;
e.Label.String = 'Accuracy';
grid on;
plot([pFA(2),pFA(4)], [pHit(2),pHit(4)], 'o-','color',Color.Ipsi, 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith);
plot([pFA(4)], [pHit(4)], 'o','color',Color.Ipsi , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Ipsi,'LineWidth', LineWith); hold on;
line([0 1],[1 0],'Color',[0 0 0],'LineStyle',':');
plot([pFA(1),pFA(3)], [pHit(1),pHit(3)], 'o-','color',Color.Contra , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1],'LineWidth', LineWith); hold on;
plot([pFA(3)], [pHit(3)], 'o','color',Color.Contra , 'MarkerSize',MarkSize-1,'markerfacecolor',Color.Contra,'LineWidth', LineWith); hold on;
set(gca,'ylim',[0 1],'xlim',[0 1],'fontsize',fs)
xlabel( 'FA rate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'Hitrate','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
axis square

f = subplot(Plot_Rows,Plot_Colums,4);
Settings.Graph.cmap = colormap( f, cbrewer('div', 'RdYlGn', 100)); %colormap(flip(linspecer));
scatter(dprime_S,criterion_S,60,Accuracy_S, 'filled'); hold on;
f = colorbar;
f.Label.String = 'Accuracy';
grid on;
plot([dprime(2), dprime(4)],[-criterion(2),-criterion(4)] , 'o-','color',Color.Ipsi , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ],'LineWidth', LineWith); hold on;% reverse direction of criterion for ipsi
plot(dprime(4),-criterion(4), 'o','color',Color.Ipsi ,'MarkerSize',MarkSize,'markerfacecolor',Color.Ipsi);% reverse direction of criterion for ipsi
plot([dprime(1), dprime(3)],[criterion(1),criterion(3)], 'o-','color',Color.Contra , 'MarkerSize',MarkSize,'markerfacecolor',[1 1 1 ],'LineWidth', LineWith); hold on;
plot(dprime(3),criterion(3), 'o','color',Color.Contra ,'MarkerSize',MarkSize,'markerfacecolor',Color.Contra);

set(gca,'xlim',[-5 5],'ylim',[-3 3],'fontsize',fs)
xlabel( 'sensitivity','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
ylabel( 'criterion','fontsize',fs,'fontweight','b', 'Interpreter', 'none' );
axis square



