clc; clear all; close all;

% Directory to fALFF function
addpath(genpath('humanStructureFunction'));

% Data directory
DataDir = ('/../../../');

% Enter subject IDs
subID = {'sub-01'; ..................};
     
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


