#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/7_fALFF/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		DataDir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/3_TimeSeries/$subID/ROIanalysis
		SubDir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/7_fALFF/$subID

		if [ ! -d $SubDir ]; then mkdir $SubDir; echo "making subject directory"; fi

		# Copy files
		cp $DataDir/$subID'_task-rest_Cingulum_Post_R_ts.txt' $SubDir

done
