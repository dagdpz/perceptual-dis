# perceptual-dis
SDT simulations and code for the perceptual **dis**crimination / **dis**tractor study
Related to the study: Dorsal pulvinar inactivation leads to spatial selection bias without perceptual deficit
Kristin Kaduk, Melanie Wilke, Igor Kagan 

This project is a simulation of expected changes in criterion and d-prime according to spatial selection bias hypothesis or perceptual discrimination deficit hypothesis. 
The simulations are implemented in MATLAB. The purpose of the stimulations is to visualize the changes related to different scenarios (single stimuli, double same stimuli and double different stimuli) for the two hypotheses. 

## Installation
Tested with MATLAB2014b and MATLAB2020b
1. Clone this repository: https://github.com/dagdpz/perceptual-dis
2. Install the required dependencies: https://github.com/igorkagan/Igtools 

## Usage
``` 
path_toGitHub = ''; 
cd path_tothe Repository 
addpath([path_toGitHub , filesep, 'Igtools']) # needs: ig_figure & ig_figurename
addpath([path_toGitHub , filesep, 'Igtools\external\cbrewer']) # external function cbrewer
perdisr_Simulate_SpatialSelectionHypo_PercepDeficitHypo('Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis')
```
## Resulting figures for each scenario 
Figure 1: The figure corresponding to the figure in the manuscript
Figure 2: Additional plots for changes in hit rate and false alarm rate before and after inactivation
Figure 3: Additional plots with showing the distribution of values for the criterion, d-prime and accuracy

## Acknowledgement
Thanks to Charles Robert whose function cbrewer is used in the code

