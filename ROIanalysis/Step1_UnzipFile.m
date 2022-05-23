clc; clear all; close all;

% Enter subject ID
subID = {'sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15';
         'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'; 'sub-28'; 'sub-29'; 'sub-30';
         'sub-31'; 'sub-32'; 'sub-33'; 'sub-34'; 'sub-35'; 'sub-36'; 'sub-37'; 'sub-38'; 'sub-39'; 'sub-40'; 'sub-41'; 'sub-42'; 'sub-43'; 'sub-44'; 'sub-45';
         'sub-46'; 'sub-47'; 'sub-48'; 'sub-49'; 'sub-50'; 'sub-51'; 'sub-52'; 'sub-53'; 'sub-54'; 'sub-55'; 'sub-56'; 'sub-57'; 'sub-58'; 'sub-60';
         'sub-61'; 'sub-62'; 'sub-63'; 'sub-64'; 'sub-65'; 'sub-66'; 'sub-67'; 'sub-68'; 'sub-69'; 'sub-71'; 'sub-72'; 'sub-73'; 'sub-74'; 'sub-75';
         'sub-76'};
     
%Connectivity issues: 'sub-27'; 
%Removed: 'sub-59' 292 vols; 'sub-70 244 vols    

for j = 1:length(subID)
   
    % Determine path to subject specific fMRIPrep output directory
    fMRIPrepDir = ['/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/2_fMRIPrep/derivatives/fmriprep/', subID{j}, '/'];

    % Determine path to func directory
    funcDir = [fMRIPrepDir filesep 'func/'];
    
    % Load subject func file   
    MNI_2009cAsym_preproc_file = [subID{j} '_task-rest_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz'];
    
    %gunzip([funcDir, MNI_2009cAsym_preproc_file]);    
    gunzip([funcDir, MNI_2009cAsym_preproc_file]);    
    
end