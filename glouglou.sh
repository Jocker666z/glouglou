#!/usr/bin/env bash
# shellcheck disable=SC2317,SC2086
# glouglou
# Bad bash script for no brain, also play vgm in shuffle
#
# Author : Romain Barbarot
# https://github.com/Jocker666z/glouglou/
# Licence : unlicense

# Test dependencies
adplay_bin() {
local bin_name
local system_bin_location

bin_name="adplay"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	adplay_bin="$system_bin_location"
else
	unset ext_adlib
fi
}
mpv_bin() {
local bin_name
local system_bin_location

bin_name="mpv"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	mpv_bin="$system_bin_location"
else
	unset ext_mpv
fi
}
sc68_bin() {
local bin_name0
local bin_name1
local system_bin_location0
local system_bin_location1

bin_name0="sc68"
bin_name1="aplay"
system_bin_location0=$(command -v $bin_name0)
system_bin_location1=$(command -v $bin_name1)

if test -n "$system_bin_location0"; then
	sc68_bin="$system_bin_location0"
else
	unset ext_sc68
fi

if test -n "$system_bin_location1"; then
	aplay_bin="$system_bin_location1"
else
	unset ext_sc68
fi
}
sidplayfp_bin() {
local bin_name
local system_bin_location

bin_name="sidplayfp"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	sidplayfp_bin="$system_bin_location"
fi
}
spc2wav_bin() {
local bin_name
local system_bin_location

bin_name="spc2wav"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	spc2wav_bin="$system_bin_location"
fi
}
timidity_bin() {
local bin_name
local system_bin_location

bin_name="timidity"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	timidity_bin="$system_bin_location"
else
	unset ext_timidity
fi
}
uade123_bin() {
local bin_name
local system_bin_location

bin_name="uade123"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	uade123_bin="$system_bin_location"
else
	unset ext_uade
	unset pre_uade
fi
}
vgmplay_bin() {
local bin_name
local system_bin_location

bin_name="vgmplay"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	vgmplay_bin="$system_bin_location"
else
	unset ext_vgmplay
fi
}
xmp_bin() {
local bin_name
local system_bin_location

bin_name="xmp"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	xmp_bin="$system_bin_location"
else
	unset ext_xmp
fi
}
zxtune123_bin() {
local bin_name
local system_bin_location

bin_name="zxtune123"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	zxtune123_bin="$system_bin_location"
else
	unset ext_zxtune
	if [[ -n "$spc2wav_bin" ]]; then
		unset ext_snes
	fi
fi
}
vgmstream123_bin() {
local bin_name
local system_bin_location

bin_name="vgmstream123"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	vgmstream123_bin="$system_bin_location"
else
	unset ext_vgmstream
fi
}
multi_depend() {
# C64 .sid
if [[ -z "$sidplayfp_bin" ]] \
&& [[ -z "$zxtune123_bin" ]]; then
	unset ext_sidplayfp
fi

# SNES .spc
if [[ -z "$spc2wav_bin" ]] \
&& [[ -z "$zxtune123_bin" ]] \
&& [[ -z "$mpv_bin" ]]; then
	unset ext_snes
fi
}
# Tools
term_size() {
term_width=$(stty size | awk '{print $2}')
term_width_trunc=$(stty size | awk '{print $2}' | awk '{ print $1 - 3 }')
}
echo_truncate() {
local label
label="$1"

if [[ "${#label}" -gt "$term_width" ]]; then
	echo "$label" | cut -c 1-"$term_width_trunc" | awk '{print $0"..."}'
else
	echo "$label"
fi
}
echo_separator() {
tput dim
printf "%*s" "$term_width" "" | tr ' ' "-"; echo
tput sgr0
}
echo_playlist() {
local play_item
play_item="$1"

# Load & reload term size
term_size

# Constuct
playlist_bef_nb=$(( play_item - 1 ))
playlist_aft_nb_one=$(( play_item + 1 ))
playlist_aft_nb_two=$(( play_item + 2 ))
lst_vgm_bef=$(echo "${lst_vgm[playlist_bef_nb]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_current=$(echo "${lst_vgm[play_item]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_aft_one=$(echo "${lst_vgm[playlist_aft_nb_one]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_aft_two=$(echo "${lst_vgm[playlist_aft_nb_two]}" | rev | cut -d'/' -f-2 | rev)

# Display
clear
tput bold sitm
echo "  < glouglou Playlist - $vgm_counter"/"${#lst_vgm[@]} >"
tput sgr0 dim
echo_truncate "  ${lst_vgm_bef}"
tput sgr0 bold
echo_truncate "> ${lst_vgm_current}"
tput sgr0
echo_truncate "  ${lst_vgm_aft_one}"
echo_truncate "  ${lst_vgm_aft_two}"
echo_separator
}
# Usage
usage() {
cat <<- EOF
glouglou - <https://github.com/Jocker666z/glouglou>
Bad bash script for no brain, also play audio/vgm/chiptune in shuffle.

Usage: glouglou [options]
                          Without option inplace recursively search files.
  -c|--classic            Playlist in alphabetical order
  -e|--exclude "pattern"  Exclude files contain pattern.
  -f|--filter "pattern"   Select only files contain pattern.
  -i|--input <directory>  Target search directory.
  -h|--help               Display this help.
  -r|--repeat_off         No repeat.
EOF
}
# Test argument, if no argument set $PWD for search vgm (take a coffee)
test_argument() {
if ! (( "${#input_dir[@]}" )); then
	input_dir="."
fi
}
# Dependencies test
player_dependency_test() {
if [[ -z "$adplay_bin" ]] \
   && [[ -z "$aplay_bin" ]] \
   && [[ -z "$mpv_bin" ]] \
   && [[ -z "$sc68_bin" ]] \
   && [[ -z "$sidplayfp_bin" ]] \
   && [[ -z "$spc2wav_bin" ]] \
   && [[ -z "$timidity_bin" ]] \
   && [[ -z "$uade123_bin" ]] \
   && [[ -z "$vgmplay_bin" ]] \
   && [[ -z "$xmp_bin" ]] \
   && [[ -z "$zxtune123_bin" ]] \
   && [[ -z "$vgmstream123_bin" ]]; then
	echo "glouglou break, none dependencies are met:"
	printf '  %s\n' "${player_dependency[@]}"
	exit
fi
}
# Populate vgm array
search_vgm() {
for input in "${input_dir[@]}"; do
	mapfile -t -O "${#lst_vgm[@]}" lst_vgm < <(find "$input" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$' 2>/dev/null)
	#if [[ -n "$uade123_bin" ]]; then
		#mapfile -t -O "${#lst_vgm[@]}" lst_vgm < <(find "$input" -type f -regextype posix-extended -iregex '.*/('$pre_uade').*' 2>/dev/null)
	#fi
done

# Sort type: shuffle or alphabetical
if [[ -n "$classic_player" ]]; then
	sort_type=('sort' '-V')
else
	sort_type=('shuf')
fi

# Final playlist array
## If no patern
if [[ -z "$input_filter" ]] && [[ -z "$exclude_filter" ]]; then
	mapfile -t lst_vgm < <(printf '%s\n' "${lst_vgm[@]}" \
							| "${sort_type[@]}")
## If -f
elif [[ -n "$input_filter" ]] && [[ -z "$exclude_filter" ]]; then
	mapfile -t lst_vgm < <(printf '%s\n' "${lst_vgm[@]}" \
							| grep -E -i "$input_filter" \
							| "${sort_type[@]}")
## If -e
elif [[ -z "$input_filter" ]] && [[ -n "$exclude_filter" ]]; then
	mapfile -t lst_vgm < <(printf '%s\n' "${lst_vgm[@]}" \
							| grep -E -i -v "$exclude_filter" \
							| "${sort_type[@]}")
## If -f -e
elif [[ -n "$input_filter" ]] && [[ -n "$exclude_filter" ]]; then
	mapfile -t lst_vgm < <(printf '%s\n' "${lst_vgm[@]}" \
							| grep -E -i -v "$exclude_filter" \
							| grep -E -i "$input_filter" \
							| "${sort_type[@]}")
fi
}
# Play loop
main_loop () {
local ext
local pre

# For debug
#set -x
#printf '%s\n' "${lst_vgm[@]}"
#exit

if (( "${#lst_vgm[@]}" )); then
	while true
	do
		for i in "${!lst_vgm[@]}"; do
			# For final stat & playlist display
			vgm_counter=$(( vgm_counter + 1 ))

			# Playlist display
			echo_playlist "$i"

			# For test ext
			ext="${lst_vgm[i]##*.}"
			# For test prefix
			pre=$(basename "${lst_vgm[i]%.*}")
			# Play
			if echo "|${ext_adplay}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$adplay_bin" ]]; then
				"$adplay_bin" "${lst_vgm[i]}" -v -r -o

			elif echo "|${ext_mpv}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$mpv_bin" ]]; then
				"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
					--term-osd-bar yes \
					--display-tags=Album,Date,Year,Artist,Artists,Composer,Track,Title,Genre

			elif echo "|${ext_sc68}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$sc68_bin" ]]; then
				"$sc68_bin" "${lst_vgm[i]}" --track=all --stdout | "$aplay_bin" -r 44100 -c 2 -f S16_LE -q

			elif echo "|${ext_sidplayfp}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$sidplayfp_bin" ]]; then
					"$sidplayfp_bin" "${lst_vgm[i]}" -v -s --digiboost
				elif [[ -n "$zxtune123_bin" ]]; then
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
				fi

			elif echo "|${ext_snes}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$zxtune123_bin" ]]; then
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
				elif [[ -n "$spc2wav_bin" ]]; then
					"$spc2wav_bin" "${lst_vgm[i]}" /dev/stdout | aplay -V stereo
				elif [[ -n "$mpv_bin" ]]; then
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--term-osd-bar yes \
						--display-tags=Artists,Composer,Album,Track,Title,Date,Year,Artist,Genre
				fi

			elif echo "|${ext_timidity}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$timidity_bin" ]]; then
				"$timidity_bin" "${lst_vgm[i]}" -in --volume=100

			elif echo "|${ext_uade}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$uade123_bin" ]]; then
				"$uade123_bin" "${lst_vgm[i]}" -v

			#elif echo "|${pre_uade}|" | grep -i "|${pre}|" &>/dev/null && [[ -n "$uade123_bin" ]]; then
				#"$uade123_bin" "${lst_vgm[i]}"

			elif echo "|${ext_vgmstream}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$vgmstream123_bin" ]]; then
				"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"

			elif echo "|${ext_vgmplay}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$vgmplay_bin" ]]; then
				"$vgmplay_bin" "${lst_vgm[i]}"

			elif echo "|${ext_xmp}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$xmp_bin" ]]; then
				"$xmp_bin" "${lst_vgm[i]}"

			elif echo "|${ext_zxtune}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$zxtune123_bin" ]]; then
				"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
			fi
		done

		# If no repeat
		if [[ -n "$no_repeat" ]] \
		&& [[ "$vgm_counter" = "${#lst_vgm[@]}" ]]; then
			kill_stat
		fi

	done
else
	echo "glouglou break, there's nothing here, no file to play."
fi
}
# Kill stat
kill_stat () {
local diff_in_s
local time_formated

# End time counter of process
stop_process_time=$(date +%s)

# Duration fomarted
diff_in_s=$(( stop_process_time - start_process_time ))
time_formated="$((diff_in_s/3600))h$((diff_in_s%3600/60))m$((diff_in_s%60))s"

# Print stats
echo
echo_separator
echo "glouglou was exited."
echo "You have listened ${vgm_counter}/${#lst_vgm[@]} tracks".
echo "The duration of your crazy listening was ${time_formated}".

# Proper exit
stty sane
exit
}

# Trap
trap 'kill_stat' SIGINT

# Dependencies
player_dependency=(
	'adplay'
	'mpv'
	'sc68 + aplay'
	'sidplayfp'
	'spc2wav + aplay'
	'timidity'
	'uade123'
	'vgmstream123'
	'vgmplay'
	'xmp'
	'zxtune123'
	)
# Paths
export PATH=$PATH:/home/$USER/.local/bin
# Type of files allowed by player
ext_adplay="adl|amd|bam|cff|cmf|d00|dfm|ddt|dtm|got|hsc|hsq|imf|laa|ksm|mdi|mtk|rad|rol|sdb|sqx|wlf|xms|xsm"
ext_mpv_various="ape|flac|m4a|mp3|ogg|opus|wav|wv"
ext_mpv_tracker="it|cow|mo3|mms|mod|s3m|stp|plm|xm"
ext_mpv="${ext_mpv_various}|${ext_mpv_tracker}"
ext_sc68="sc68|sndh"
ext_sidplayfp="sid"
ext_snes="spc"
ext_timidity="mid"
ext_uade="aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|hot|fc13|fc14|med|mug|np3|sfx|smus|soc|p4x|tiny"
#pre_uade="aam|bp|cm|cus|dw|hipc|mdat|med|mod|np3|okt|rjp|rk|s7g|sfx|smus|soc|sog|p4x|tiny|xm"
ext_vgmstream_0_c="8svx|ads|adp|adpcm|adx|aix|apc|at3|bcstm|bcwav|brstm|cfn|csmp|cps"
ext_vgmstream_d_n="dsm|dsp|fsb|genh|hca|hps|imc|lwav|mic|mus|musx|nlsd|npsf"
ext_vgmstream_o_z="sad|ss2|strm|p04|p16|thp|vag|vgmstream|xa|xnb|xwv"
ext_vgmstream="${ext_vgmstream_0_c}|${ext_vgmstream_d_n}|${ext_vgmstream_o_z}"
ext_vgmplay="s98|vgm|vgz"
ext_xmp="669|amf|dbm|digi|dsm|dsym|far|gz|mdl|musx|psm"
ext_zxtune_various="ay|ams|dmf|dtt|hvl|sap|v2m|ym"
ext_zxtune_xfs="2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_zxtune_zx_spectrum="asc|psc|pt2|pt3|sqt|stc|stp"
ext_zxtune="${ext_zxtune_various}|${ext_zxtune_xfs}|${ext_zxtune_zx_spectrum}"

# Arguments
while [[ $# -gt 0 ]]; do
	vgm2flac_args="$1"
	case "$vgm2flac_args" in
		-c|--classic)
			classic_player="1"
		;;
		-e|--exclude)
			shift
			exclude_filter="$1"
		;;
		-f|--filter)
			shift
			input_filter="$1"
		;;
		-h|--help)
			usage
			exit
		;;
		-i|--input)
			shift
			input_dir+=( "$1" )
			for input in "${input_dir[@]}"; do
				if ! [[ -d "$input" ]]; then
					echo "glouglou was exited."
					echo "\"$input\" directory does not exist."
					exit
				fi
			done
			;;
		-r|--repeat_off)
			no_repeat="1"
		;;
		*)
			usage
			exit
		;;
	esac
	shift
done

# Setup
adplay_bin
mpv_bin
sc68_bin
sidplayfp_bin
spc2wav_bin
timidity_bin
uade123_bin
vgmstream123_bin
vgmplay_bin
xmp_bin
zxtune123_bin
multi_depend
player_dependency_test
# $ext_allplay contruction depend -> player_dependency_test
ext_allplay_raw="${ext_adplay}| \
				 ${ext_mpv}| \
				 ${ext_sc68}| \
				 ${ext_sidplayfp}| \
				 ${ext_snes}| \
				 ${ext_timidity}| \
				 ${ext_uade}| \
				 ${ext_vgmplay}| \
				 ${ext_vgmstream}| \
				 ${ext_vgmplay}| \
				 ${ext_xmp}| \
				 ${ext_zxtune}"
ext_allplay="${ext_allplay_raw//[[:blank:]]/}"
test_argument
search_vgm
# Start time counter of process
start_process_time=$(date +%s)
# Play
main_loop

exit
