#!/bin/tcsh

#Version 2.3 is the same as 2.2. Only the length of the jitter changed, nothing else

set rootdir=/Volumes/alojos/Novelty_GLMs/DATA

set subdirs=(1291	1292	1294-2	1295	1296	1297	2725-2O	2735	2813	2814	2820	2821	2822	2831-2O	2876	2888	2905)
#
#change this if the input time series are different runs
set Run1 = r01
set Run2 = r02

foreach i ($subdirs)
	set subj 	= NOVEL6

	#copy onset files
	rsync "$rootdir"/"$i"_Omn_V2/"$i"_EDATA/PIC_*.txt "$rootdir"/"$i"_Omn_V2/Preproc_Omn_V2.results/stimuli

	cd "$rootdir"/"$i"_Omn_V2/Preproc_Omn_V2.results
	pwd


	3dDeconvolve -input pb05.Preproc_Omn_V2.${Run1}.scale+tlrc.HEAD pb05.Preproc_Omn_V2.${Run2}.scale+tlrc.HEAD                \
    	-censor motion_Preproc.5_PIC_censor.1D'[0]'                                      \
    	-polort 5                                                            \
    	-num_stimts 12                                                      \
    	-stim_times_AM2 1 stimuli/PIC_Cue_EV.txt 'GAM'                        \
    	-stim_label 1 Cue_EV                                              \
    	-stim_times 2 stimuli/PIC_Cue_Novel_Chosen.txt 'GAM'                        \
    	-stim_label 2 Cue_Novel_Chosen                                              \
    	-stim_times_AM2 3 stimuli/PIC_Fdb_PE.txt 'GAM'                        \
    	-stim_label 3 Fdb_PE                                            \
    	-stim_times_AM2 4 stimuli/PIC_Fdb_Novel_Chosen_PE.txt 'GAM'                         \
    	-stim_label 4 Fdb_Novel_Chosen_PE                                               \
    	-stim_times 5 stimuli/PIC_Excl_Cue.txt 'GAM'                        \
    	-stim_label 5 Excl_Cue                                              \
    	-stim_times 6 stimuli/PIC_Respond_Faster.txt 'GAM'                        \
    	-stim_label 6 Respond_Faster                                              \
    	-stim_file 7 motion_demean_PIC.1D'[0]' -stim_base 7 -stim_label 7 roll  \
    	-stim_file 8 motion_demean_PIC.1D'[1]' -stim_base 8 -stim_label 8 pitch \
    	-stim_file 9 motion_demean_PIC.1D'[2]' -stim_base 9 -stim_label 9 yaw   \
    	-stim_file 10 motion_demean_PIC.1D'[3]' -stim_base 10 -stim_label 10 dS    \
    	-stim_file 11 motion_demean_PIC.1D'[4]' -stim_base 11 -stim_label 11 dL    \
    	-stim_file 12 motion_demean_PIC.1D'[5]' -stim_base 12 -stim_label 12 dP    \
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
		    	-num_stimts 10                                                      \
		    	-stim_times_AM2 1 stimuli/PIC_Cue_All_EV.txt 'GAM'                        \
		    	-stim_label 1 Cue_All_EV                                              \
		    	-stim_times_AM2 2 stimuli/PIC_Fdb_All_PE.txt 'GAM'                        \
		    	-stim_label 2 Fdb_All_PE                                            \
		    	-stim_times 3 stimuli/PIC_Excl_Cue.txt 'GAM'                        \
		    	-stim_label 3 Excl_Cue                                              \
		    	-stim_times 4 stimuli/PIC_Respond_Faster.txt 'GAM'                        \
		    	-stim_label 4 Respond_Faster                                              \
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

		    	
	set subj 	= NOVEL6_Rew

			3dDeconvolve -input pb05.Preproc_Omn_V2.${Run1}.scale+tlrc.HEAD pb05.Preproc_Omn_V2.${Run2}.scale+tlrc.HEAD                \
		    	-censor motion_Preproc.5_PIC_censor.1D'[0]'                                      \
		    	-polort 5                                                            \
		    	-num_stimts 11                                                      \
		    	-stim_times_AM2 1 stimuli/PIC_Cue_All_EV.txt 'GAM'                        \
		    	-stim_label 1 Cue_All_EV                                              \
		    	-stim_times_AM2 2 stimuli/PIC_Fdb_Novel_Chosen_Rew.txt 'GAM'                        \
		    	-stim_label 2 Fdb_Rew_Novel_Chosen                                            \
		    	-stim_times_AM2 3 stimuli/PIC_Fdb_Rew.txt 'GAM'                        \
		    	-stim_label 3 Fdb_Rew                                           \
		    	-stim_times 4 stimuli/PIC_Excl_Cue.txt 'GAM'                        \
		    	-stim_label 4 Excl_Cue                                              \
		    	-stim_times 5 stimuli/PIC_Respond_Faster.txt 'GAM'                        \
		    	-stim_label 5 Respond_Faster                                              \
		    	-stim_file 6 motion_demean_PIC.1D'[0]' -stim_base 6 -stim_label 6 roll  \
		    	-stim_file 7 motion_demean_PIC.1D'[1]' -stim_base 7 -stim_label 7 pitch \
		    	-stim_file 8 motion_demean_PIC.1D'[2]' -stim_base 8 -stim_label 8 yaw   \
		    	-stim_file 9 motion_demean_PIC.1D'[3]' -stim_base 9 -stim_label 9 dS    \
		    	-stim_file 10 motion_demean_PIC.1D'[4]' -stim_base 10 -stim_label 10 dL    \
		    	-stim_file 11 motion_demean_PIC.1D'[5]' -stim_base 11 -stim_label 11 dP    \
		    	-fout -tout -x1D X.xmat_${subj}.1D -xjpeg X_${subj}.jpg                              \
		    	-x1D_uncensored X.nocensor.xmat_${subj}.1D                                   \
		    	-fitts fitts.${subj}                                                   \
		    	-errts errts.${subj}                                                 \
		    	-cbucket all_betas.${subj}                                             \
		    	-bucket stats.${subj}
end
