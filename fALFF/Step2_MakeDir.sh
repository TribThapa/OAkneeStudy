#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</../../../SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		LeftM1Dir=/../../$subID/Left_M1
		RightM1Dir=/../../$subID/Right_M1

		if [ ! -d $LeftM1Dir ]; then mkdir $LeftM1Dir; echo "making Left M1 directory"; fi		
		if [ ! -d $RightM1Dir ]; then mkdir $RightM1Dir; echo "making Right M1 directory"; fi

		

done
