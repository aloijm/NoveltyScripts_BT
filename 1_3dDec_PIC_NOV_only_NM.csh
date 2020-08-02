#!/bin/tcsh

#Version 2.3 is the same as 2.2. Only the length of the jitter changed, nothing else

set rootdir=/Volumes/alojos/Novelty_GLMs/DATA

set subdirs=(1023-2 1167 2347 2607)
#1023-2 1167 2347 2607

#change this if the input time series are different runs
set Run1 = r01
set Run2 = r02

set subj 	= NOVEL6

foreach i ($subdirs)

	set subj 	= NOVEL6

	#copy onset files
	rsync "$rootdir"/"$i"_Omn_V2/"$i"_EDATA/PIC_*.txt "$rootdir"/"$i"_Omn_V2/Preproc_Omn_V2.results/stimuli

	cd "$rootdir"/"$i"_Omn_V2/Preproc_Omn_V2.results
	pwd

	3dDeconvolve -input pb05.Preproc_Omn_V2.${Run1}.scale+tlrc.HEAD pb05.Preproc_Omn_V2.${Run2}.scale+tlrc.HEAD                \
    	-censor motion_Preproc.5_PIC_censor.1D'[0]'                                      \
    	-polort 5                                                            \
    	-num_stimts 10                                                    \
    	-stim_times_AM2 1 stimuli/PIC_Cue_EV.txt 'GAM'                        \
    	-stim_label 1 Cue_EV                                              \
    	-stim_times 2 stimuli/PIC_Cue_Novel_Chosen.txt 'GAM'                        \
    	-stim_label 2 Cue_Novel_Chosen                                              \
    	-stim_times_AM2 3 stimuli/PIC_Fdb_PE.txt 'GAM'                        \
    	-stim_label 3 Fdb_PE                                            \
    	-stim_times_AM2 4 stimuli/PIC_Fdb_Novel_Chosen_PE.txt 'GAM'                         \
    	-stim_label 4 Fdb_Novel_Chosen_PE                                               \
    	-stim_file 5 motion_demean_PIC.1D'[0]' -stim_base 5 -stim_label 5 roll  \
    	-stim_file 6 motion_demean_PIC.1D'[1]' -stim_base 6 -stim_label 6 pitch \
    	-stim_file 7 motion_demean_PIC.1D'[2]' -stim_base 7 -stim_label 7 yaw   \
    	-stim_file 8 motion_demean_PIC.1D'[3]' -stim_base 8 -stim_label 8 dS    \
    	-stim_file 9 motion_demean_PIC.1D'[4]' -stim_base 9 -stim_label 9 dL    \
    	-stim_file 10 motion_demean_PIC.1D'[5]' -stim_base 10 -stim_label 10 dP    \
    	-fout -tout -x1D X.xmat_${subj}.1D -xjpeg X_${subj}.jpg                              \
    	-x1D_uncensored X.nocensor.xmat_${subj}.1D                                   \
    	-fitts fitts.${subj}                                                   \
    	-errts errts.${subj}                                                 \
    	-cbucket all_betas.${subj}                                             \
    	-bucket stats.${subj}

			set subj 	= NOVEL6_Basic

			3dDeconvolve -input pb05.Preproc_Omn_V2.${Run1}.scale+tlrc.HEAD pb05.Preproc_Omn_V2.${Run2}.scale+tlrc.HEAD                \
		    	-censor motion_Preproc.5_PIC_censor.1D'[0]'                                      \
		    	-polort 5                                                            \
		    	-num_stimts 8                                                    \
		    	-stim_times_AM2 1 stimuli/PIC_Cue_All_EV.txt 'GAM'                        \
		    	-stim_label 1 Cue_All_EV                                              \
		    	-stim_times_AM2 2 stimuli/PIC_Fdb_All_PE.txt 'GAM'                        \
		    	-stim_label 2 Fdb_All_PE                                            \
		    	-stim_file 3 motion_demean_PIC.1D'[0]' -stim_base 3 -stim_label 3 roll  \
		    	-stim_file 4 motion_demean_PIC.1D'[1]' -stim_base 4 -stim_label 4 pitch \
		    	-stim_file 5 motion_demean_PIC.1D'[2]' -stim_base 5 -stim_label 5 yaw   \
		    	-stim_file 6 motion_demean_PIC.1D'[3]' -stim_base 6 -stim_label 6 dS    \
		    	-stim_file 7 motion_demean_PIC.1D'[4]' -stim_base 7 -stim_label 7 dL    \
		    	-stim_file 8 motion_demean_PIC.1D'[5]' -stim_base 8 -stim_label 8 dP    \
		    	-fout -tout -x1D X.xmat_${subj}.1D -xjpeg X_${subj}.jpg                              \
		    	-x1D_uncensored X.nocensor.xmat_${subj}.1D                                   \
		    	-fitts fitts.${subj}                                                   \
		    	-errts errts.${subj}                                                 \
		    	-cbucket all_betas.${subj}                                             \
		    	-bucket stats.${subj}
		    	
		    	
	set subj 	= NOVEL6_Rew

			3dDeconvolve -input pb05.Preproc_Omn_V2.${Run1}.scale+tlrc.HEAD pb05.Preproc_Omn_V2.${Run2}.scale+tlrc.HEAD                \
		    	-censor motion_Preproc.5_PIC_censor.1D'[0]'                                      \
		    	-polort 5                                                            \
		    	-num_stimts 9                                                      \
		    	-stim_times_AM2 1 stimuli/PIC_Cue_All_EV.txt 'GAM'                        \
		    	-stim_label 1 Cue_All_EV                                              \
		    	-stim_times_AM2 2 stimuli/PIC_Fdb_Novel_Chosen_Rew.txt 'GAM'                        \
		    	-stim_label 2 Fdb_Rew_Novel_Chosen                                            \
		    	-stim_times_AM2 3 stimuli/PIC_Fdb_Rew.txt 'GAM'                        \
		    	-stim_label 3 Fdb_Rew                                           \
		    	-stim_file 4 motion_demean_PIC.1D'[0]' -stim_base 4 -stim_label 4 roll  \
		    	-stim_file 5 motion_demean_PIC.1D'[1]' -stim_base 5 -stim_label 5 pitch \
		    	-stim_file 6 motion_demean_PIC.1D'[2]' -stim_base 6 -stim_label 6 yaw   \
		    	-stim_file 7 motion_demean_PIC.1D'[3]' -stim_base 7 -stim_label 7 dS    \
		    	-stim_file 8 motion_demean_PIC.1D'[4]' -stim_base 8 -stim_label 8 dL    \
		    	-stim_file 9 motion_demean_PIC.1D'[5]' -stim_base 9 -stim_label 9 dP    \
		    	-fout -tout -x1D X.xmat_${subj}.1D -xjpeg X_${subj}.jpg                              \
		    	-x1D_uncensored X.nocensor.xmat_${subj}.1D                                   \
		    	-fitts fitts.${subj}                                                   \
		    	-errts errts.${subj}                                                 \
		    	-cbucket all_betas.${subj}                                             \
		    	-bucket stats.${subj}


end
