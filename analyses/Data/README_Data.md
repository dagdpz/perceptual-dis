README Data

This README provides an overview and detailed description of the datasets, 
including the behavioral variables to compute the Figures of the manuscript and statistic.
Each dataset exist for each monkey (Cornelius, M1; Curius, M2).
 
Dataset: Cornelius_SDT_RT_Acc.mat or Curius_SDT_RT_Acc.mat

%% The structure of the datasets (*.mat) 
The structure of the data is part of a larger behavioral dataset 
focusing on the selection of two monkeys to three different stimulus types 
(Single stimuli (Sgl), Double Same stimuli (DSS) and Double Different Stimuli (DDS)). 
The data includes 7 sessions per monkey as control sessions and 7 sessions for dorsal pulvinar. 
Please see details in the related manuscript. 
 
The dataset includes SDT, Accuracy (Acc) and Reactiontimes (RT). 
The Variables for the Signal Detection Theory are as follows: 
- SDT variable (d_prime, criterion, pHit, pFA, Hit,CR,FA,CR), 
- difficulty of the task (difficult vs. easy),
- hemifield of stimulus presentation (ipsi or contra relative to the side of inactivation), and 
- intervention (pre vs. post). 
In case of "pre" represents the Control session and "post" represents the Inactivation sessions. 

%% Here is an example: Da.SDT.Sgl.d_prime.difficult.contra.post
Da.SDT.Sgl.d_prime.difficult.contra.post would then contain the d-prime values calculated 
for the contralateral hemifield in the difficult conditions after the inactivation. 

%% Description of the SDT variables
d_prime (d'): Measures the sensitivity or discriminability between signal and noise, 
indicating how well an individual can distinguish between the presence and absence of a 
target stimulus.

criterion: The threshold at which a subject decides whether a signal is present or absent, 
balancing the rates of false alarms and missed detections based on their perception.

pHit (Probability of Hit): The probability or rate at which the subject correctly identifies 
the presence of the target stimulus when it is indeed present.

pFA (Probability of False Alarm): The probability or rate at which the subject incorrectly 
identifies the presence of the target stimulus when it is actually absent.

Hit: An instance where the subject correctly identifies the presence of the target stimulus.
CR (Correct Rejection): An instance where the subject correctly identifies that the target 
stimulus is absent.

FA (False Alarm): An instance where the subject incorrectly identifies the presence of the 
target stimulus when it is not present.

CR (Correct Rejection): Appears to be mistakenly repeated; should be considered as mentioned 
above under "Correct Rejection".
