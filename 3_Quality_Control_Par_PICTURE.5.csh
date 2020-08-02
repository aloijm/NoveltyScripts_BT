#!/bin/tcsh

set subdirs="1291	1292	1294-2	1295	1296	1297	2725-2O	2735	2813	2814	2820	2821	2822	2831-2O	2876	2888	2905"

set rootdir=/Volumes/alojos/Novelty_GLMs/DATA

# print column labels
echo "ssnr censored_TR ave_mot_per_TR max_disp outcount nruns trs maxF" > ~/Desktop/Picture_output.txt

foreach i ($subdirs)

	cd "$rootdir"/"$i"_Omn_V2/Preproc_Omn_V2.results

	set enorm_dset       = motion_Preproc.5_PIC_enorm.1D
	set mot_limit        = 0.5
	set motion_dset      = dfile_PIC.1D
	set outlier_dset     = outcount_PIC.1D
	set out_limit        = 0.1
	set XMat	     	 		 = X.xmat_NOVEL6_Basic.1D
	set stats_dset       = stats.NOVEL6_Basic+tlrc.HEAD
	set mask_dset        = full_mask.Preproc_Omn_V2+tlrc.HEAD

	# calculate TRs above motion limit (which are also censored)
	set censored_TR = `1deval -a $enorm_dset -expr "step(a-$mot_limit)"      \
                        | awk '$1 != 0 {print}' | wc -l`

	# average motion per TR
	set ave_mot_per_TR = `3dTstat -prefix - -mean $enorm_dset\' | & tail -n 1`

	# maximum motion displacement displacement over all TR pairs
	set max_disp = `1d_tool.py -infile $motion_dset -show_max_displace -verb 0`

	# outliers
	set outcount = `1deval -a $outlier_dset -expr "step(a-$out_limit)"      \
                        | awk '$1 != 0 {print}' | wc -l`

	set nruns = ( `1d_tool.py -infile $XMat -show_num_runs` )
	set trs   = ( `1d_tool.py -infile $XMat -show_tr_run_counts trs_no_cen` )

	# note maximum masked F-stat
	set fmax = `3dBrickStat -slow -max -mask $mask_dset $stats_dset"[Full_Fstat]"`

	echo "$i $censored_TR $ave_mot_per_TR $max_disp $outcount $nruns $trs $fmax"

	echo "$i	$censored_TR	$ave_mot_per_TR	$max_disp	$outcount	$nruns	$trs	$fmax"  >> ~/Desktop/Picture_output.txt
end
