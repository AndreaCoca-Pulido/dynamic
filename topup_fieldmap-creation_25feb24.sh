#!/bin/sh

# Ses-1
acq_parameters=/home/jovyan/neurodesktop-storage/Agueda/BIDS/derivatives/CONN/dynamic_prueba/BIDS/derivatives/task-rest_fieldmap_topup_acq_parameters.txt

for sub in 101 103 106 # your list of participants
do
    sub=sub-${sub}
    echo -----starting subject $sub------

    SES1DIR=/home/jovyan/neurodesktop-storage/Agueda/BIDS/derivatives/CONN/dynamic/BIDS/${sub}/ses-1 # your ses-1 directory

    # Verify if SES1DIR exists
    if [ -d "$SES1DIR" ]; then
        fslmerge -t "${SES1DIR}/fmap/${sub}_ses-1_AP_PA" "${SES1DIR}/fmap/${sub}_ses-1_task-rest_dir-AP_fieldmap.nii.gz" "${SES1DIR}/fmap/${sub}_ses-1_task-rest_dir-PA_fieldmap.nii.gz"
        topup --imain="${SES1DIR}/fmap/${sub}_ses-1_AP_PA" --datain="${acq_parameters}" --config=b02b0.cnf --out="${SES1DIR}/fmap/${sub}_ses-1_topup_results" --fout="${SES1DIR}/fmap/${sub}_ses-1_fieldmap" --iout="${SES1DIR}/fmap/${sub}_ses-1_magnitude"
    else
        echo "The $SES1DIR directory does not exist. Skipping to the next iteration."
    fi
done

# Ses-6
for sub in 101 103 106 # your list of participants
do
    sub=sub-${sub}
    echo -----starting subject $sub------

    SES6DIR=/home/jovyan/neurodesktop-storage/Agueda/BIDS/derivatives/CONN/dynamic_prueba/BIDS/${sub}/ses-6 # your ses-6 directory

    # Verify if SES6DIR exists
    if [ -d "$SES6DIR" ]; then
        fslmerge -t "${SES6DIR}/fmap/${sub}_ses-6_AP_PA" "${SES6DIR}/fmap/${sub}_ses-6_task-rest_dir-AP_fieldmap.nii.gz" "${SES6DIR}/fmap/${sub}_ses-6_task-rest_dir-PA_fieldmap.nii.gz"
        topup --imain="${SES6DIR}/fmap/${sub}_ses-6_AP_PA" --datain="${acq_parameters}" --config=b02b0.cnf --out="${SES6DIR}/fmap/${sub}_ses-6_topup_results" --fout="${SES6DIR}/fmap/${sub}_ses-6_fieldmap" --iout="${SES6DIR}/fmap/${sub}_ses-6_magnitude"
    else
        echo "The $SES6DIR directory does not exist. Skipping to the next iteration."
    fi
done

