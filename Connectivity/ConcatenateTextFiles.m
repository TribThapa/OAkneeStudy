clc; clear all; close all;

% Enter subject IDs
subID = {'sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15';
         'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'; 'sub-28'; 'sub-29'; 'sub-30';
         'sub-31'; 'sub-32'; 'sub-33'; 'sub-34'; 'sub-35'; 'sub-36'; 'sub-37'; 'sub-38'; 'sub-39'; 'sub-40'; 'sub-41'; 'sub-42'; 'sub-43'; 'sub-44'; 'sub-45';
         'sub-46'; 'sub-47'; 'sub-48'; 'sub-49'; 'sub-50'; 'sub-51'; 'sub-52'; 'sub-53'; 'sub-54'; 'sub-55'; 'sub-56'; 'sub-57'; 'sub-58'; 'sub-60';
         'sub-61'; 'sub-62'; 'sub-63'; 'sub-64'; 'sub-65'; 'sub-66'; 'sub-67'; 'sub-68'; 'sub-69'; 'sub-71'; 'sub-72'; 'sub-73'; 'sub-74'; 'sub-75';
         'sub-76'};
     
% Removed 27, 35, 59, 70
 
% Define subject directories
DataDir = ('/home/trthapa/cw84/thapa/PainProjects/1_PlaceboTrial/8_NiLearn/ConnectivityMatrix_GraphLasso/');     
     
for i = 1:length(subID);
    
    ts = dlmread([DataDir,'/',subID{i},'_power.txt']);      
        
    FC{i} = (ts');            
    
end

% Concatenate files
FC_all = cat(3, FC{:,:});
 
save([DataDir, 'FC_all.mat'], 'FC_all');
     
% FC_mat_Real = load([DataDir,'FC_all_Real.mat']);
% FC_mat_Sham = load([DataDir,'FC_all_Sham.mat']);
% 
% FC_Comb = cat(3, FC_mat_Real.FC_all, FC_mat_Sham.FC_all);
% 
% save([DataDir, 'FC_RealPrePostnShamPrePost.mat'], 'FC_Comb');