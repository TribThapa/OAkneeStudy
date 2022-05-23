#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		DataDir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/$subID
		Reg_dir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/5_Preproc_2PGSR

		if [ ! -d $DataDir ]; then mkdir $DataDir; echo "making project directory"; fi

		# Copy files
		cp $Reg_dir/$subID/$subID'_task-rest_WMCSFGSRXYZ.txt' $DataDir

done
