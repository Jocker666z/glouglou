#!/usr/bin/env bash
# glouglou
# Bad bash script for no brain, also play vgm in shuffle
#
# Author : Romain Barbarot
# https://github.com/Jocker666z/glouglou/
# Licence : unlicense

# Test dependencies
vgmplay_bin() {
local bin_name="vgmplay"
local system_bin_location
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	vgmplay_bin="$system_bin_location"
fi
}
zxtune123_bin() {
local bin_name="zxtune123"
local system_bin_location
system_bin_location=$(command -v $bin_name)

if test -n "$system_bin_location"; then
	zxtune123_bin="$system_bin_location"
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
# Depending on the bin available builds the extension list to search
make_ext_list() {
if [[ -n "$vgmplay_bin" ]] \
  && [[ -n "$zxtune123_bin" ]]; then
	ext_allplay="${ext_zxtune}|${ext_vgmplay}"
elif [[ -n "$vgmplay_bin" ]] \
  && [[ -z "$zxtune123_bin" ]]; then
	ext_allplay="${ext_vgmplay}"
elif [[ -z "$vgmplay_bin" ]] \
  && [[ -n "$zxtune123_bin" ]]; then
	ext_allplay="${ext_zxtune}"
elif [[ -z "$vgmplay_bin" ]] \
  && [[ -z "$zxtune123_bin" ]]; then
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
			if [[ "$ext_vgmplay" =~ $ext ]]; then
				"$vgmplay_bin" "${file}"
			elif [[ "$ext_zxtune" =~ $ext ]]; then
				"$zxtune123_bin" --alsa --file "${file}"
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
player_dependency=(vgmplay zxtune123)
# Paths
export PATH=$PATH:/home/$USER/.local/bin
# Type of files allowed by player
ext_zxtune="2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|spc|ssf|usf"
ext_vgmplay="s98|vgm|vgz"

# Start time counter of process
start_process_time=$(date +%s)

# Set up
vgmplay_bin
zxtune123_bin
make_ext_list
test_argument
search_vgm
# Play
main_loop

exit
