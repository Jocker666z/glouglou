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
else
	unset ext_sidplayfp
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
# Usage
usage() {
cat <<- EOF
glouglou - <https://github.com/Jocker666z/glouglou>
Bad bash script for no brain, also play audio/vgm/chiptune in shuffle.

Usage: glouglou [options]
                          Without option recursively search files.
  -f|--filter "pattern"   Select only file & directory contain pattern.
  -i|--input <directory>  Treat in batch a specific directory.
  -h|--help               Display this help.
EOF
}
# Test argument, if no argument set $PWD for search vgm (take a coffee)
test_argument() {
if [[ -d "$input_dir" ]]; then
	vgm_dir="$input_dir"
else
	vgm_dir="$PWD"
fi
}
# Dependencies test
player_dependency_test() {
if [[ -z "$adplay_bin" ]] \
   && [[ -z "$aplay_bin" ]] \
   && [[ -z "$mpv_bin" ]] \
   && [[ -z "$sc68_bin" ]] \
   && [[ -z "$sidplayfp_bin" ]] \
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
if [[ -z "$input_filter" ]]; then
	mapfile -t lst_vgm < <(find "$vgm_dir" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$' 2>/dev/null | shuf)
else
	mapfile -t lst_vgm < <(find "$vgm_dir" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$' 2>/dev/null | shuf | grep -i "$input_filter")
fi
}
# Play loop
main_loop () {
local ext

if (( "${#lst_vgm[@]}" )); then
	while true
	do
		for file in "${lst_vgm[@]}"; do
			# For final stat
			vgm_counter=$(( vgm_counter + 1 ))
			# For test ext
			ext="${file##*.}"
			# Display
			clear
			echo "======= glouglou ======="
			# Play

			shopt -s nocasematch
			if echo "|${ext_adplay}|" | grep "|${ext}|" &>/dev/null && [[ -n "$adplay_bin" ]]; then
				"$adplay_bin" "${file}" -v -r -o

			elif echo "|${ext_mpv}|" | grep "|${ext}|" &>/dev/null && [[ -n "$mpv_bin" ]]; then
				"$mpv_bin" "${file}" --terminal --no-video \
					--term-osd-bar yes \
					--display-tags=Album,Date,Year,Artist,Artists,Composer,Track,Title,Genre

			elif echo "|${ext_sc68}|" | grep "|${ext}|" &>/dev/null && [[ -n "$sc68_bin" ]]; then
				"$sc68_bin" "${file}" --stdout | "$aplay_bin" -r 44100 -c 2 -f S16_LE -q

			elif echo "|${ext_sidplayfp}|" | grep "|${ext}|" &>/dev/null && [[ -n "$sidplayfp_bin" ]]; then
				"$sidplayfp_bin" "${file}" -v -s --digiboost

			elif echo "|${ext_timidity}|" | grep "|${ext}|" &>/dev/null && [[ -n "$timidity_bin" ]]; then
				"$timidity_bin" "${file}" -in --volume=100

			elif echo "|${ext_uade}|" | grep "|${ext}|" &>/dev/null && [[ -n "$uade123_bin" ]]; then
				"$uade123_bin" "${file}"

			elif echo "|${ext_vgmstream}|" | grep "|${ext}|" &>/dev/null && [[ -n "$vgmstream123_bin" ]]; then
				"$vgmstream123_bin" -D alsa -m "${file}"

			elif echo "|${ext_vgmplay}|" | grep "|${ext}|" &>/dev/null && [[ -n "$vgmplay_bin" ]]; then
				"$vgmplay_bin" "${file}"

			elif echo "|${ext_xmp}|" | grep "|${ext}|" &>/dev/null && [[ -n "$xmp_bin" ]]; then
				"$xmp_bin" "${file}"

			elif echo "|${ext_zxtune}|" | grep "|${ext}|" &>/dev/null && [[ -n "$zxtune123_bin" ]]; then
				"$zxtune123_bin" --analyzer --alsa --file "${file}"
			fi
			shopt -u nocasematch
		done

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
echo "--------------------"
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
ext_sc68="sc68"
ext_sidplayfp="sid"
ext_timidity="mid"
ext_uade="aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cus|dm|dm2|dmu|dss|ea|ex|hot|fc13|fc14|mug|sfx"
ext_vgmstream="ads|adp|adx|apc|at3|cps|dsm|genh|ss2|thp|xa"
ext_vgmplay="s98|vgm|vgz"
ext_xmp="669|amf|dbm|digi|dsm|dsym|far|gz|mdl|musx|psm"
ext_zxtune_various="ay|ams|dmf|dtt|hvl|sap|spc|v2m|ym"
ext_zxtune_xfs="2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_zxtune_zx_spectrum="asc|psc|pt2|pt3|sqt|stc|stp"
ext_zxtune="${ext_zxtune_various}|${ext_zxtune_xfs}|${ext_zxtune_zx_spectrum}"

# Arguments
while [[ $# -gt 0 ]]; do
	vgm2flac_args="$1"
	case "$vgm2flac_args" in
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
			input_dir="$1"
			if ! [[ -d "$input_dir" ]]; then
				echo "glouglou was exited."
				echo "\"$input_dir\" directory does not exist."
				exit
			fi
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
timidity_bin
uade123_bin
vgmstream123_bin
vgmplay_bin
xmp_bin
zxtune123_bin
player_dependency_test
# $ext_allplay contruction depend -> player_dependency_test
ext_allplay_raw="${ext_adplay}| \
				 ${ext_mpv}| \
				 ${ext_sc68}| \
				 ${ext_sidplayfp}| \
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
