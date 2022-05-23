clc; clear all; close all;

% Directory to fALFF function
addpath(genpath('humanStructureFunction'));

% Data directory
DataDir = ('/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/7_fALFF/');

% Enter subject IDs
subID = {'sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15';
         'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'; 'sub-28'; 'sub-29'; 'sub-30';
         'sub-31'; 'sub-32'; 'sub-33'; 'sub-34'; 'sub-35'; 'sub-36'; 'sub-37'; 'sub-38'; 'sub-39'; 'sub-40'; 'sub-41'; 'sub-42'; 'sub-43'; 'sub-44'; 'sub-45';
         'sub-46'; 'sub-47'; 'sub-48'; 'sub-49'; 'sub-50'; 'sub-51'; 'sub-52'; 'sub-53'; 'sub-54'; 'sub-55'; 'sub-56'; 'sub-57'; 'sub-58'; 'sub-60';
         'sub-61'; 'sub-62'; 'sub-63'; 'sub-64'; 'sub-65'; 'sub-66'; 'sub-67'; 'sub-68'; 'sub-69'; 'sub-71'; 'sub-72'; 'sub-73'; 'sub-74'; 'sub-75';
         'sub-76'};
     
%Connectivity issues: 'sub-27';  
%Removed: 'sub-59' 292 vols; 'sub-70 244 vols   

% Define sampling period
samplingPeriod = 1.418;

% Create for loop to calculate fALFF
for i = 1:length(subID)  
    
    PFC_ts = dlmread([DataDir, subID{i}, '/', subID{i},'_task-rest_Cingulum_Post_R_ts.txt']);

    y = PFC_ts;
    
    out{i} = SP_fALFF(y, samplingPeriod);  
        
end

% Concatenate the structure in each cell into a structure array:
struct = [out{1:end}]; 

fALFF_mat = cat(3, struct.fALFF);
ALFF_mat = cat(3, struct.ALFF);
ALFF_power = cat(3, struct.ALFFpower);

fALFF_cell = squeeze(fALFF_mat(:, :, :));
ALFF_cell = squeeze(ALFF_mat(:, :, :));
ALFF_power_cell = squeeze(ALFF_power(:, :, :));
 
% Create table
Table = table(subID(:,1), fALFF_cell(1:end, 1), ALFF_cell(1:end, 1), ALFF_power_cell(1:end, 1));
Table.Properties.VariableNames = {'ID' 'fALFF' 'ALFF' 'ALFFpower'};

% Generate plots
subplot(3,3,1:3)
scatter(1:73, Table.fALFF, 15, 'red', 'd',  'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
legend('fALFF');
xlabel('subject IDs');
ylabel('fALFF values');
set(gca, 'FontSize', 5)

subplot(3,3,4:6)
scatter(1:73, Table.ALFF, 15, 'red', 'd',  'filled', 'MarkerEdgeColor', 'red', 'LineWidth', 1);
legend('ALFF');
xlabel('subject IDs');
ylabel('ALFF values');
set(gca, 'FontSize', 5)

subplot(3,3,7:9)
scatter(1:73, Table.ALFFpower, 15, 'blue',  'MarkerEdgeColor', 'blue', 'LineWidth', 1);
hold on;
legend('ALFFpower');
xlabel('subject IDs');
ylabel('ALFF power values');
set(gca, 'FontSize', 5)

% Save table
writetable(Table, [DataDir,'TimeseriesAnalysis/fALFF_Cingulum_Post_R.csv']);


