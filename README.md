# NoveltyScripts_BT
Novelty Scripts for Processing Novelty Data
These scripts implement the data conversion, preprocessing, and first level glms for the Novelty data.

# Data conversion and preprocessing

1Convert_data_NOV_only.csh
Converts Novelty from dicom images to Brick/Head for use in AFNI

2Add_ses_nr_NOV_only.csh
Organizes Brick/Head files from previous script for use in AFNI

3CopyExcel.csh
Copies excel file into EDATA folder for participant.  After this excel file is copied over, run the macro (cmd+option+e) in the excel file to extract data from the Presentation
files.  You will then need to look in the excel file to find the correct number of TR's for both runs to use for preprocessing

4Run_preproc.5mm_NOV_only1.csh
Wrapper for afni_proc.py that runs preprocessing steps on data.  Use the TR's that you extracted with the excel macro in this step.  Make sure to open up the preprocessed data
in the AFNI gui after running this to QC and to make sure the preprocessing steps ran correctly and that the data make sense.




# First level GLMs
1_3dDec_PIC_NOV_only.csh/1_3dDec_PIC_NOV_only_NM.csh
Uses 3dDeconvolve to run first level GLMs on the preprocessed data.  Use the "_NM" variety if the participant responded on all trials

3_Quality_Contrl_Par_PICTURE.5.csh
Extract QC parameters on the first level GLMs.

4_openAFNI_PICTURE.csh
Open first level GLMs in AFNI GUI for QC.

5_PullImages_Functional2.sh
Save out pictures of first level GLMs for QC (I didn't use this too much)

Run_Subbrick_Novelty.txt
Exports subbricks for ease of use during group level analyses
