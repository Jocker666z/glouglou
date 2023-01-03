#!/usr/bin/env bash
# glouglou
# Bad bash script for no brain, also play vgm in shuffle
#
# Author : Romain Barbarot
# https://github.com/Jocker666z/glouglou/
# Licence : unlicense

# Test dependencies
command_test() {
n=0;
for command in "${core_dependencies[@]}"; do
	if hash "$command" &>/dev/null; then
		(( c++ )) || true
	else
		echo "You shall not pass without installing: $command" && exit
		(( n++ )) || true
	fi
done
}
# Test argument
test_argument() {
# If no argument set $PWD for search vgm (take a coffee)
if [[ -d "$arg" ]]; then
	vgm_dir="$arg"
elif [[ -z "${vgm_dir}" ]]; then
	vgm_dir="$PWD"
fi
}
# Populate vgm array
search_vgm() {
mapfile -t lst_vgm < <(find "$vgm_dir" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$' 2>/dev/null | shuf)
}
# Play loop
main_loop () {
while true
do
	for file in "${lst_vgm[@]}"; do
		clear
		echo "======= glouglou ======="
		if [[ "${file##*.}" = "vgz" ]]; then
			vgmplay "${file}"
		else
			zxtune123 --alsa --file "${file}"
		fi
	done
done
}

# Argument
arg="$1"
# Need Dependencies
core_dependencies=(vgmplay zxtune123)
# Paths
export PATH=$PATH:/home/$USER/.local/bin
# Type of files allowed
ext_spcplay="spc"
ext_psfplay="2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_vgmplay="s98|vgm|vgz"
ext_allplay="${ext_spcplay}|${ext_psfplay}|${ext_vgmplay}"

# Main
command_test
test_argument
search_vgm
main_loop

exit
