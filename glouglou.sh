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
openmpt_bin() {
local bin_name
local system_bin_location

bin_name="openmpt123"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	openmpt_bin="$system_bin_location"
else
	unset ext_openmpt
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
zxtune123_bin() {
local bin_name
local system_bin_location

bin_name="zxtune123"
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	zxtune123_bin="$system_bin_location"
else
	unset ext_zxtune0
	unset ext_zxtune1
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
# Test argument, if no argument set $PWD for search vgm (take a coffee)
test_argument() {
if [[ -d "$arg" ]]; then
	vgm_dir="$arg"
elif [[ -z "${vgm_dir}" ]]; then
	vgm_dir="$PWD"
fi
}
# Dependencies test
player_dependency_test() {
if [[ -z "$adplay_bin" ]] \
   && [[ -z "$aplay_bin" ]] \
   && [[ -z "$openmpt_bin" ]] \
   && [[ -z "$sc68_bin" ]] \
   && [[ -z "$timidity_bin" ]] \
   && [[ -z "$uade123_bin" ]] \
   && [[ -z "$vgmplay_bin" ]] \
   && [[ -z "$zxtune123_bin" ]] \
   && [[ -z "$vgmstream123_bin" ]]; then
	echo "glouglou break, none dependencies are met:"
	printf '  %s\n' "${player_dependency[@]}"
	exit
fi
}
# Populate vgm array
search_vgm() {
mapfile -t lst_vgm < <(find "$vgm_dir" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$' 2>/dev/null | shuf)
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
			if [[ "$ext_adplay" =~ $ext ]] && [[ -n "$adplay_bin" ]]; then
				"$adplay_bin" "${file}" -v -r -o

			elif [[ "$ext_openmpt" =~ $ext ]] && [[ -n "$openmpt_bin" ]]; then
				"$openmpt_bin" "${file}"

			elif [[ "$ext_sc68" =~ $ext ]] && [[ -n "$sc68_bin" ]]; then
				"$sc68_bin" "${file}" --stdout | "$aplay_bin" -r 44100 -c 2 -f S16_LE -q

			elif [[ "$ext_timidity" =~ $ext ]] && [[ -n "$timidity_bin" ]]; then
				"$timidity_bin" "${file}" -in --volume=100

			elif [[ "$ext_uade" =~ $ext ]] && [[ -n "$uade123_bin" ]]; then
				"$uade123_bin" "${file}"

			elif [[ "$ext_vgmstream" =~ $ext ]] && [[ -n "$vgmstream123_bin" ]]; then
				"$vgmstream123_bin" -D alsa -m "${file}"

			elif [[ "$ext_vgmplay" =~ $ext ]] && [[ -n "$vgmplay_bin" ]]; then
				"$vgmplay_bin" "${file}"

			elif [[ "$ext_zxtune" =~ $ext ]] && [[ -n "$zxtune123_bin" ]]; then
				"$zxtune123_bin" --analyzer --alsa --file "${file}"
			fi
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
echo "You have listened ${vgm_counter} tracks".
echo "The duration of your crazy listening was ${time_formated}".

# Proper exit
stty sane
exit
}

# Trap
trap 'kill_stat' SIGINT

# Argument
arg="$1"
# Dependencies
player_dependency=(
	'openmpt123'
	'sc68 + aplay'
	'timidity'
	'uade123'
	'vgmstream123'
	'vgmplay'
	'zxtune123'
	)
# Paths
export PATH=$PATH:/home/$USER/.local/bin
# Type of files allowed by player
ext_adplay="adl|amd|d00|got|hsc|hsq|imf|ksm|mdi|rad|rol|sdb|sqx|wlf"
ext_openmpt="it|mo3|mod|s3m|xm"
ext_sc68="sc68"
ext_timidity="mid"
ext_uade="abk|ahx|bp|fc13|fc14"
ext_vgmstream="ads|adp|adx|at3|cps|genh|ss2|thp|xa"
ext_vgmplay="s98|vgm|vgz"
ext_zxtune_xfs="2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_zxtune_various="hvl|sap|sid|spc|v2m|ym"
ext_zxtune="${ext_zxtune_xfs}|${ext_zxtune_various}"

# Start time counter of process
start_process_time=$(date +%s)

# Set up
adplay_bin
openmpt_bin
sc68_bin
timidity_bin
uade123_bin
vgmplay_bin
zxtune123_bin
vgmstream123_bin
player_dependency_test
# $ext_allplay contruction depend -> player_dependency_test
ext_allplay_raw="${ext_adplay}| \
				 ${ext_openmpt}| \
				 ${ext_sc68}| \
				 ${ext_timidity}| \
				 ${ext_uade}| \
				 ${ext_vgmplay}| \
				 ${ext_vgmstream}| \
				 ${ext_vgmplay}| \
				 ${ext_zxtune}"
ext_allplay="${ext_allplay_raw//[[:blank:]]/}"
test_argument
search_vgm
# Play
main_loop

exit
