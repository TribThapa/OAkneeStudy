% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/fs03/hf49/thapa/PainProjects/1_PlaceboTrial/6_ROI/ScriptsUsed/Step6_2ndLevel_ROIanalysis_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
