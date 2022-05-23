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

TimeSeries_Dir = ('/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/3_TimeSeries/');

for j = 1:length(subID)
    
    % Determine path to subject specific fMRIPrep output directory
    fMRIPrepDir = ['/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/2_fMRIPrep/derivatives/fmriprep/', subID{j}, '/'];

    % Determine path to func directory
    funcDir = [fMRIPrepDir filesep 'func'];
    
    % Load subject specific .tsv file containing the regressors
    CSV_file = [subID{j} '_task-rest_desc-confounds_timeseries.tsv'];
    
    % Change directory to func dir to ensure the script's outputs can be seen in the pane to your left
    cd(funcDir);
    
    % Read the .tsv file containing the regressors
    FileName = tdfread(CSV_file);
    
    % Locate the x, y, and z plane regressors in the .tsv file
    WM = FileName.white_matter;
    CSF = FileName.csf;
    
    X = FileName.trans_x;
    Y = FileName.trans_y;
    Z = FileName.trans_z;
    
    % Locate files referring to rotation in the x, y, and z axis in the .tsv file   
    Rot_X = FileName.rot_x;
    Rot_Y = FileName.rot_y;
    Rot_Z = FileName.rot_z;
    
    % ROI timeseries
    M1_R = textread([TimeSeries_Dir '/', subID{j},'/ROIanalysis/',subID{j},'_task-rest_M1_right_ts.txt']);
    M1_L = textread([TimeSeries_Dir '/', subID{j},'/ROIanalysis/',subID{j},'_task-rest_M1_left_ts.txt']);
    SuppMotor = textread([TimeSeries_Dir '/', subID{j},'/ROIanalysis/',subID{j},'_task-rest_SuppMotor_L_ts.txt']);
    Insular_R = textread([TimeSeries_Dir '/', subID{j},'/ROIanalysis/',subID{j},'_task-rest_Insular_R_ts.txt']);
    Cingulum_R = textread([TimeSeries_Dir '/', subID{j},'/ROIanalysis/',subID{j},'_task-rest_Cingulum_Post_R_ts.txt']);
    
    % Place regressors from Step 6 & 7 into a table
    T_M1_R = table(M1_R(:,1), FileName.white_matter, FileName.csf, FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);
    T_M1_L = table(M1_L(:,1), FileName.white_matter, FileName.csf, FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);
    T_SuppMotor = table(SuppMotor(:,1), FileName.white_matter, FileName.csf, FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);
    T_Insular = table(Insular_R(:,1), FileName.white_matter, FileName.csf, FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);
    T_Cing = table(Cingulum_R(:,1), FileName.white_matter, FileName.csf, FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);
    
    % Define output directory to which to save the table
    OutDir = ['/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/',subID{j},'/'];
    
    % Save the table using tab delimiter
%     writetable(T_M1_R, [OutDir, subID{j} '_M1_R_WMCSFXYZrots.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
%     writetable(T_M1_L, [OutDir, subID{j} '_M1_L_WMCSFXYZrots.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
%     writetable(T_SuppMotor, [OutDir, subID{j} '_SuppMotor_WMCSFXYZrots.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
%     writetable(T_Insular, [OutDir, subID{j} '_Insular_R_WMCSFXYZrots.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
    writetable(T_Cing, [OutDir, subID{j} '_Cing_R_WMCSFXYZrots.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
    
end 
