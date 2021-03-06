#!/bin/tcsh
#this script needs one argument, i.e. the mrnr for the subject
#so run this script as ./5Check_Alignment.csh 1234
#the script will return an error when no input was supplied
#or if the path does not exist.
set rootdir="/Volumes/alojos/Novelty_GLMs/DATA"
set preproc_subj="Preproc_Omn_V2"
set protocol="_Omn_V2"
set stats_name="NOVEL6_Basic"

set results_path="$rootdir"/"$1$protocol"/"$preproc_subj".results

#check if first argument is empty
#if empty, return error message,
#otherwise proceed
if ($1 == "") then
  echo "****************************"
  echo "ERROR"
  echo "You need to enter a mr id"
  echo "Run this script as $0 [mrnr]"
  echo "Please try again"
  echo "****************************"
else
  #check if path exists
  #if does not exist, return error message,
  #otherwise proceed
  if (! -d $results_path ) then
    echo "****************************"
    echo "ERROR"
    echo Path is $results_path
    echo "Path failure"
    echo "It is possible this mr nr was not correct"
    echo "Please try again"
    echo "****************************"
  else

    #then navigate to the subject folder
    cd $results_path

    afni -com 'OPEN_WINDOW A.coronalimage geom=+440+900' \
    -com 'OPEN_WINDOW A.sagitalimage geom=+440+455' \
    -com "SWITCH_UNDERLAY A.anat_final.$preproc_subj" \
    -com 'SET_VIEW A.tlrc' \
    -com 'SET_XHAIRS A.ON' \
    -com "SWITCH_OVERLAY A.stats.$stats_name" \
    -com 'SET_SUBBRICKS A 1 2 2' \
    -com 'SET_DICOM_XYZ A 23 5 -15' \
    -com 'SET_THRESHNEW A 0.05 *p' \
    -com 'SET_PBAR_NUMBER A.8' \
    -com 'SEE_OVERLAY A.+' \
    &

    endif
endif
