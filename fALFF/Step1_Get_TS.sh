#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</../../../SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		DataDir=/../../$subID/ROIanalysis
		SubDir=/../../../$subID

		if [ ! -d $SubDir ]; then mkdir $SubDir; echo "making subject directory"; fi

		# Copy files
		cp $DataDir/$subID'_task-rest_Cingulum_Post_R_ts.txt' $SubDir

done
