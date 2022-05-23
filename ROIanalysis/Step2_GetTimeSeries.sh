#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		DataDir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/$subID
		TS_dir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/3_TimeSeries

		if [ ! -d $DataDir ]; then mkdir $DataDir; echo "making project directory"; fi

		# Copy files
		cp $TS_dir/$subID/ROIanalysis/$subID'_task-rest_Cingulum_Post_R_ts.txt' $DataDir		
		cp $TS_dir/$subID/ROIanalysis/$subID'_task-rest_Insular_R_ts.txt' $DataDir
		cp $TS_dir/$subID/ROIanalysis/$subID'_task-rest_M1_left_ts.txt' $DataDir
		cp $TS_dir/$subID/ROIanalysis/$subID'_task-rest_M1_right_ts.txt' $DataDir
		cp $TS_dir/$subID/ROIanalysis/$subID'_task-rest_SuppMotor_L_ts.txt' $DataDir

done
