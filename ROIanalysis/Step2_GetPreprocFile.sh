#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		DataDir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/$subID
		fMRIPrep_dir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/2_fMRIPrep/derivatives/fmriprep
		sub_dir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/$subID

		if [ ! -d $DataDir ]; then mkdir $DataDir; echo "making project directory"; fi

		# Copy files
		cp $fMRIPrep_dir/$subID/func/$subID'_task-rest_space-MNI152NLin2009cAsym_desc-preproc_bold.nii' $DataDir

done
