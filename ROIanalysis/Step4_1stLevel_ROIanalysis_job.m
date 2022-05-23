%-----------------------------------------------------------------------
% Job saved on 12-May-2022 14:20:30 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all;

% Add SPM
addpath('/usr/local/spm12/matlab2015b.r6685/');

% Enter subject ID
subID = {'sub-01'; 'sub-02'; 'sub-03'; 'sub-04'; 'sub-05'; 'sub-06'; 'sub-07'; 'sub-08'; 'sub-09'; 'sub-10'; 'sub-11'; 'sub-12'; 'sub-13'; 'sub-14'; 'sub-15';
         'sub-16'; 'sub-17'; 'sub-18'; 'sub-19'; 'sub-20'; 'sub-21'; 'sub-22'; 'sub-23'; 'sub-24'; 'sub-25'; 'sub-26'; 'sub-28'; 'sub-29'; 'sub-30';
         'sub-31'; 'sub-32'; 'sub-33'; 'sub-34'; 'sub-35'; 'sub-36'; 'sub-37'; 'sub-38'; 'sub-39'; 'sub-40'; 'sub-41'; 'sub-42'; 'sub-43'; 'sub-44'; 'sub-45';
         'sub-46'; 'sub-47'; 'sub-48'; 'sub-49'; 'sub-50'; 'sub-51'; 'sub-52'; 'sub-53'; 'sub-54'; 'sub-55'; 'sub-56'; 'sub-57'; 'sub-58'; 'sub-60';
         'sub-61'; 'sub-62'; 'sub-63'; 'sub-64'; 'sub-65'; 'sub-66'; 'sub-67'; 'sub-68'; 'sub-69'; 'sub-71'; 'sub-72'; 'sub-73'; 'sub-74'; 'sub-75';
         'sub-76'};
     
%Connectivity issues: 'sub-27'; 
%Removed: 'sub-59' 292 vols; 'sub-70 244 vols 

for i = 1:length(subID)

matlabbatch{1}.spm.stats.fmri_spec.dir = {['/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/', subID{i},'/Cing_R/']};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2.5;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;

for j = 1:300
    
        Rest(j) = {['/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/',subID{i},'/',subID{i},'_task-rest_space-MNI152NLin2009cAsym_desc-preproc_bold.nii,',num2str(j)]};
end

matlabbatch{1}.spm.stats.fmri_spec.sess.scans = Rest';

matlabbatch{1}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {['/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/',subID{i},'/',subID{i},'_Cing_R_WMCSFXYZrots.txt']};
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'ROI';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = 1;
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;

spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);
    
end
