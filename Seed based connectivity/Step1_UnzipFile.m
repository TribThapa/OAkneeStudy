clc; clear all; close all;

% Enter subject ID
subID = {'sub-01'; ....................};
     
%Connectivity issues: 'sub-27'; 
%Removed: 'sub-59' 292 vols; 'sub-70 244 vols    

for j = 1:length(subID)
   
    % Determine path to subject specific fMRIPrep output directory
    fMRIPrepDir = ['/../../', subID{j}, '/'];

    % Determine path to func directory
    funcDir = [fMRIPrepDir filesep 'func/'];
    
    % Load subject func file   
    MNI_2009cAsym_preproc_file = [subID{j} '_task-rest_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz'];
    
    %gunzip([funcDir, MNI_2009cAsym_preproc_file]);    
    gunzip([funcDir, MNI_2009cAsym_preproc_file]);    
    
end
