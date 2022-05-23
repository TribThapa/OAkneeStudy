#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
		# Define paths to anat, func directories	
		ConDir=/home/trthapa/hf49_scratch/thapa/PainProjects/1_PlaceboTrial/6_ROI/$subID

		if [ ! -d $DataDir ]; then mkdir $DataDir; echo "making project directory"; fi

		# Copy files
		cp $ConDir/Cing_R/'con_0001.nii' $ConDir/Cing_R_reslice		
		cp $ConDir/Insular_R/'con_0001.nii' $ConDir/Insular_R_reslice		
		cp $ConDir/M1_L/'con_0001.nii' $ConDir/M1_L_reslice		
		cp $ConDir/M1_R/'con_0001.nii' $ConDir/M1_R_reslice		
		cp $ConDir/SuppMotor/'con_0001.nii' $ConDir/SuppMotor_reslice		

done
