export ssid=" 1166 "
export results_dir="/Volumes/NeuroBHealth/2_First_level_protocol_analysis/OmnV2/DATA"
export subbrick_pic="/Volumes/OmnV2/OmnV2/Pictures_Analysis/8_Group/2_Images"
export contrast="EV0 EV0 EV1 CueNov FDB0 FDB1 FdbNovel0 FdbNovel1"
declare -a subbrick=(2 2 4 7 10 12 15 17 17)

#Xvfb (The X Windows Virtual Frame Buffer).
#Xvfb allows you to launch X windows (of which AFNI is one)
#without actually displaying the contents to your screen

`which Xvfb` :1 -screen 0 1024x768x24 &

for ssid_index in $ssid
do
	let SubbrickIndex=0
	for contrast_index in $contrast
	do

		let SubbrickIndex=SubbrickIndex+1
		export FileName=$ssid_index"_NOVP_"$contrast_index

		echo "************************************"
		echo the FileName = $FileName
		echo the SubbrickIndex = $SubbrickIndex
		echo the subbrick is ${subbrick[$SubbrickIndex-1]}
		echo the contrast is $contrast_index
		echo "************************************"


		cd "$results_dir"/"$ssid_index"_Omn_V2/Preproc_Omn_V2.results
		pwd

		DISPLAY=:1 afni	-com "OPEN_WINDOW A.axialimage mont=6x6:3 " \
				-com 'SWITCH_UNDERLAY A.anat_final.Preproc_Omn_V2+tlrc' \
				-com 'SET_VIEW A.tlrc' \
				-com "SWITCH_OVERLAY A.stats.NOVEL3+tlrc" \
				-com 'SET_XHAIRS A.OFF' \
				-com "SET_SUBBRICKS A 0 ${subbrick[$SubbrickIndex-1]} ${subbrick[$SubbrickIndex-1]} " \
				-com "SET_DICOM_XYZ A 0 0 0 " \
				-com 'SET_THRESHNEW A 0.05 *p' \
				-com 'SET_PBAR_NUMBER A.8' \
				-com 'SEE_OVERLAY A.+' \
				-com "SAVE_JPEG A.axialimage $FileName" \
				-com 'QUIT'

	done
	mv *NOVP* "$subbrick_pic"
done

killall Xvfb

#colors of the color bar from top to bottom
#0000ff #aa00aa #ff0000 #ffaa00 #ffff00
#blue purple red orange yellow
#0000ff #aa00aa #ff0000
#blue purple red
#ff0000 #ffaa00 #ffff00
#red_orange_yellow
#ffff00 #ffaa00 #ff0000
#yellow_orange_red
#ffff00 #ffaa00 #ff0000
#yellow_orange_red_darkred
#ffff00 #ffaa00 #ff0000 #8b0000
#lightyellow_yellow_orange_red
#ffffe0 #ffff00 #ffaa00 #ff0000
#darkred_red_orange_yellow
#8b0000 #ffff00 #ffaa00 #ff0000
#lightyellow_yellow_orange_red_darkred
#ffffe0 #ffff00 #ffaa00 #ff0000 #8b0000
#white_lightyellow_yellow_orange_red_darkred
#ffffff #ffffe0 #ffff00 #ffaa00 #ff0000 #8b0000
#white_lightyellow_yellow_orange_red_darkred
#ffffff #ffffe0 #ffff00 #ffaa00 #ff0000 #8b0000
