# perceptual-dis
SDT simulations and code for the perceptual **dis**crimination / **dis**tractor study
related to the Paper: 

This project is a simulation of the expected changes in criterion and dprime
according to the spatial selection bias hypothesis or perceptal deficit hypothessis. 
The simulation is implemented in MATLAB and utilizes Ig_tools. The purpose of the stimulation to\
visualize the change related to different szenarios (Single Stimuli, Double Same and Double Different Stimuli) for the two hypothesis. 

## Installation
To run  this stimulation, you will need to install the MATLAB! I tested it with MATLAB 2014b & 2021
1. Clone this repository: https://github.com/dagdpz/perceptual-dis
2. Install the required dependencies
	- https://github.com/igorkagan/Igtools 



## Usage
``` 
path_toGitHub = ''; 
cd [path_toGitHub , filesep, perceptual-dis repository]
addpath([path_toGitHub , filesep, 'Igtools']) # needs: ig_figure & ig_figurename
addpath([path_toGitHub , filesep, 'Igtools\external\cbrewer']) # external function cbrewer
perdisr_Simulate_SpatialSelectionHypo_PercepDeficitHypo('Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis('')
```
## Results
Figure 1: the figure of the manuscript
Figure 2: Additional plots for the changes in hitrate and false alarm for before and after inactivation
Figure 3: Additional plots with showing the distribution of values of the criterion, dprime and accuarcy

## Acknowledgement
 Thanks to Charles Robert who provided the function cbrewer (license included in the folder)
