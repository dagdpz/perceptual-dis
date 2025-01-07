# perceptual-dis

Analysis code and SDT simulations for the perceptual **dis**crimination / **dis**tractor study: Dorsal pulvinar inactivation leads to spatial selection bias without perceptual deficit

Kristin Kaduk, Melanie Wilke, Igor Kagan 


## Installation
Tested with MATLAB2014b and MATLAB2020b
1. Clone this repository: https://github.com/dagdpz/perceptual-dis
2. Install the required dependencies: https://github.com/igorkagan/Igtools 

``` 
path_toRepo = ''; % your path
cd path_toRepo 
addpath([path_toRepo , filesep, 'Igtools']) # needs: ig_figure & ig_figurename

```

## /Analyses

## /Simulations

The main simulation function `perdis_Simulate.m` implements computational models for analyzing perceptual discrimination and spatial selection bias. It simulates behavioral data according to the assumptions of the spatial selection bias hypothesis or perceptual discrimination hypothesis.

### Usage
```matlab
perdis_Simulate('Fig4A_SingleStimuli_DifficultDistr_SelectionBiasHypothesis');
```

### Key Features
- Simulates behavioral data for different stimulus conditions:
  - Single Stimuli
  - Double Same Stimuli
  - Double D-T Stimuli
- Calculates key behavioral metrics:
  - Hit rates and False alarm rates
  - D-prime (sensitivity)
  - Response criterion
  - Accuracy
  - Spatial selections (ipsilateral and contralateral)
- Includes corrections for edge cases (zero or infinite probabilities)
- Generates comprehensive visualization plots

### Resulting figures for each scenario 

Figure 1: The figure corresponding to the figure in the manuscript

Figure 2: Additional plots for changes in hit rate and false alarm rate before and after inactivation

Figure 3: Additional plots showing the distribution of values for the criterion, d-prime and accuracy


## Acknowledgments
Thanks to Charles Robert whose function cbrewer is used in the code

