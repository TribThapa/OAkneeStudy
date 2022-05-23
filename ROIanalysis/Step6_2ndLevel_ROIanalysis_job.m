%-----------------------------------------------------------------------
% Job saved on 13-May-2022 08:59:13 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all;

% Add SPM
addpath('/usr/local/spm12/matlab2015b.r6685/');
%addpath('/usr/local/spm12/matlab2018a.r7487/');

% Enter subject ID
controls = {'sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15';
            'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'};

patients = {'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'; 'sub-28'; 'sub-29'; 'sub-30'; 'sub-31'; 'sub-32'; 'sub-33'; 'sub-34'; 'sub-35'; 'sub-36';
            'sub-37'; 'sub-38'; 'sub-39'; 'sub-40'; 'sub-41'; 'sub-42'; 'sub-43'; 'sub-44'; 'sub-45'; 'sub-46'; 'sub-47'; 'sub-48'; 'sub-49'; 'sub-50'; 'sub-51';
            'sub-52'; 'sub-53'; 'sub-54'; 'sub-55'; 'sub-56'; 'sub-57'; 'sub-58'; 'sub-60'; 'sub-61'; 'sub-62'; 'sub-63'; 'sub-64'; 'sub-65'; 'sub-66'; 'sub-67';
            'sub-68'; 'sub-69'; 'sub-71'; 'sub-72'; 'sub-73'; 'sub-74'; 'sub-75'; 'sub-76'};
     
%Connectivity issues: 'sub-27'; 
%Removed: 'sub-59' 292 vols; 'sub-70 244 vols 

matlabbatch{1}.spm.stats.factorial_design.dir = {'/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/SecondLevel/SuppMotor_reslice'};

matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-01/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-02/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-03/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-04/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-05/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-06/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-07/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-08/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-09/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-10/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-11/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-12/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-13/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-14/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-15/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-16/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-17/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-18/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-19/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-20/SuppMotor_reslice/rcon_0001.nii,1'
                                                           };

matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = {
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-21/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-22/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-23/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-24/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-25/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-26/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-28/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-39/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-30/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-31/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-32/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-33/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-34/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-35/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-36/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-37/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-38/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-39/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-40/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-41/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-42/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-43/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-44/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-45/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-46/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-47/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-48/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-49/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-50/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-51/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-52/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-53/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-54/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-55/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-56/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-57/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-58/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-60/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-61/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-62/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-63/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-64/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-65/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-66/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-67/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-68/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-69/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-71/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-72/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-73/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-74/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-75/SuppMotor_reslice/rcon_0001.nii,1'
                                                           '/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/sub-76/SuppMotor_reslice/rcon_0001.nii,1'                                                   
                                                           };

matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Con>Patients';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Con<Patients';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'ConOnly';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [1 0];
matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{4}.tcon.name = 'PatientsOnly';
matlabbatch{3}.spm.stats.con.consess{4}.tcon.weights = [0 1];
matlabbatch{3}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;

spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);
