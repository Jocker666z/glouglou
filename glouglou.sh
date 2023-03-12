#!/usr/bin/env bash
# shellcheck disable=SC2317,SC2086
# glouglou
# Bad bash script for no brain, also play vgm in shuffle
#
# Author : Romain Barbarot
# https://github.com/Jocker666z/glouglou/
# Licence : unlicense

# Setup
adplay_bin() {
local bin_name
local system_bin_location

bin_name="adplay"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	adplay_bin="$system_bin_location"
else
	unset ext_adlib
fi
}
aplay_bin() {
local bin_name
local system_bin_location

bin_name="aplay"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	aplay_bin="$system_bin_location"
fi
}
ffplay_bin() {
local bin_name
local system_bin_location

bin_name="ffplay"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	ffplay_bin="$system_bin_location"
fi
}
fluidsynth_bin() {
local bin_name
local system_bin_location

bin_name="fluidsynth"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	fluidsynth_bin="$system_bin_location"
fi
}
mpv_bin() {
local bin_name
local system_bin_location

bin_name="mpv"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	mpv_bin="$system_bin_location"
fi
}
openmpt123_bin() {
local bin_name
local system_bin_location

bin_name="openmpt123"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	openmpt123_bin="$system_bin_location"
fi
}
sc68_bin() {
local bin_name
local system_bin_location

bin_name="sc68"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	sc68_bin="$system_bin_location"
else
	unset ext_sc68
fi

if [[ -z "$aplay_bin" ]]; then
	unset sc68_bin
fi
}
sidplayfp_bin() {
local bin_name
local system_bin_location

bin_name="sidplayfp"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	sidplayfp_bin="$system_bin_location"
fi
}
spc2wav_bin() {
local bin_name
local system_bin_location

bin_name="spc2wav"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	spc2wav_bin="$system_bin_location"
fi

if [[ -z "$aplay_bin" ]]; then
	unset spc2wav_bin
fi
}
timidity_bin() {
local bin_name
local system_bin_location

bin_name="timidity"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	timidity_bin="$system_bin_location"
fi
}
uade123_bin() {
local bin_name
local system_bin_location

bin_name="uade123"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
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

if [[ -n "$system_bin_location" ]]; then
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

if [[ -n "$system_bin_location" ]]; then
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

if [[ -n "$system_bin_location" ]]; then
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

if [[ -n "$system_bin_location" ]]; then
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

# Midi
if [[ -z "$timidity_bin" ]] \
&& [[ -z "$fluidsynth_bin" ]]; then
	unset ext_midi
fi

# MPV
if [[ -z "$mpv_bin" ]] \
&& [[ -z "$ffplay_bin" ]] \
&& [[ -z "$vgmstream123_bin" ]]; then
	unset ext_mpv
fi

# SNES .spc
if [[ -z "$spc2wav_bin" ]] \
&& [[ -z "$zxtune123_bin" ]] \
&& [[ -z "$mpv_bin" ]]; then
	unset ext_snes
fi

# Tracker
if [[ -z "$xmp_bin" ]] \
&& [[ -z "$zxtune123_bin" ]] \
&& [[ -z "$openmpt123_bin" ]] \
&& [[ -z "$mpv_bin" ]]; then
	unset ext_tracker
fi
}
glouglou_config() {
if [[ ! -d "$glouglou_config_dir" ]]; then
	mkdir "$glouglou_config_dir"
fi
}
listenbrainz_bin() {
local bin_name
local system_bin_location

# curl
bin_name="curl"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	curl_bin="$system_bin_location"
fi

# curl
bin_name="vgm_tag"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	vgm_tag_bin="$system_bin_location"
fi

# info68
bin_name="info68"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	info68_bin="$system_bin_location"
fi

# xxd
bin_name="xxd"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	xxd_bin="$system_bin_location"
fi
}
# Tools
term_size() {
local term_size_raw
term_size_raw=$(stty size)

term_height="${term_size_raw%% *}"
term_width="${term_size_raw##* }"
term_width_trunc=$(( term_width - 3 ))
}
echo_truncate() {
local label
label="$1"

if [[ "${#label}" -gt "$term_width" ]]; then
	echo -e "$label" | cut -c 1-"$term_width_trunc" | awk '{print $0"..."}'
else
	echo -e "$label"
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
echo -e "  \u2261 glouglou playlist \u2933 $vgm_counter"/"${#lst_vgm[@]}"
tput sgr0 dim
echo_truncate "  ${lst_vgm_bef}"
tput sgr0 bold
echo_truncate "\u25b6 ${lst_vgm_current}"
tput sgr0
echo_truncate "  ${lst_vgm_aft_one}"
echo_truncate "  ${lst_vgm_aft_two}"
echo_separator
}
echo_error() {
local error_label
error_label="$1"

echo "${error_label}" >&2
}
# ListenBrainz
listenbrainz_token() {
if [[ -n "$listenbrainz_register" ]]; then
	echo "listenbrainz_token=${listenbrainz_register}" > "$glouglou_config_file"
	echo "${listenbrainz_register} has been registered as your new ListenBrainz token."
fi
if [[ -f "$glouglou_config_file" ]]; then
	listenbrainz_token=$(< "$glouglou_config_file" grep "listenbrainz_token=" \
						| awk -F"=" '{ print $2 }')
fi
}
listenbrainz_submit() {
if [[ -n "$curl_bin" ]] \
&& [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]] \
&& [[ -n "$tag_title" ]]; then

	local unix_date
	local player
	local diff_in_s
	local time_formated

	# Prevent repeat scrobb, limit to 5s
	last_submit_time=$(date +%s)
	submit_diff_in_s=$(( last_submit_time - new_submit_time ))

	if [[ "$submit_diff_in_s" -gt "5" ]]; then
	
		new_submit_time=$(date +%s)
		player="$1"
		unix_date=$(date +%s)

		"$curl_bin" --silent --output /dev/null \
			-X POST -H "Authorization: token $listenbrainz_token" \
			--header "Content-Type:application/json" \
			-d '{
			"listen_type": "single",
			"payload": [{
				"listened_at": "'"$unix_date"'",
				"track_metadata": {
					"additional_info": {
						"listening_from": "'"$player"'",
						"release_mbid": "",
						"artist_mbids": [""],
						"recording_mbid": "",
						"tags": []
						},
					"artist_name": "'"$tag_artist"'",
					"track_name": "'"$tag_title"'",
					"release_name": "'"$tag_album"'"
			}}]}' \
			https://api.listenbrainz.org/1/submit-listens

			# Reset
			unset tag_title
			unset tag_artist
			unset tag_album
	fi
fi
}
tag_default() {
local file
file="$1"

if [[ -z "$tag_title" ]]; then
	tag_title=$(basename "${file%.*}")
fi
if [[ -z "$tag_artist" ]]; then
	tag_artist="Unknow"
fi
if [[ -z "$tag_album" ]]; then
	tag_album=$(dirname "$file" | rev | cut -d'/' -f-1 | rev)
fi
}
tag_mpv() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	"$mpv_bin" --terminal --no-video --vo=null --ao=null \
		--display-tags=Title,Artist,Album \
		--frames=0 --quiet --no-cache --no-config "$file" \
		> "$glouglou_cache_tag"

	tag_title=$(sed -n 's/Title:/&\n/;s/.*\n//p' "$glouglou_cache_tag" | awk '{$1=$1}1')
	tag_artist=$(sed -n 's/Artist:/&\n/;s/.*\n//p' "$glouglou_cache_tag" | awk '{$1=$1}1')
	tag_album=$(sed -n 's/Album:/&\n/;s/.*\n//p' "$glouglou_cache_tag" | awk '{$1=$1}1')
	tag_default "$file"
fi
}
tag_sap() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	strings -e S "$file" | head -15 > "$glouglou_cache_tag"

	tag_artist=$(< "$glouglou_cache_tag" grep -i -a "AUTHOR" | awk -F'"' '$0=$2')
	if [[ "$tag_artist" = "<?>" ]]; then
		unset tag_artist
	fi
	tag_album=$(< "$glouglou_cache_tag" grep -i -a "NAME" | awk -F'"' '$0=$2')
	if [[ "$tag_album" = "<?>" ]]; then
		unset tag_album
	fi
	tag_default "$file"
fi
}
tag_sc68() {
local file
file="$1"

if [[ -n "$info68_bin" ]] \
&& [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	"$info68_bin" -A "$file" > "$glouglou_cache_tag"

	tag_title=$(< "$glouglou_cache_tag" grep -i -a title: | sed 's/^.*: //' | head -1)
	if [[ -z "$tag_title" ]] \
	|| [[ "$tag_title" = "N/A" ]]; then
		unset tag_title
	fi
	tag_artist=$(< "$glouglou_cache_tag" grep -i -a artist: | sed 's/^.*: //' | head -1)
	if [[ -z "$tag_artist" ]] \
	|| [[ "$tag_artist" = "N/A" ]]; then
		unset tag_artist
	fi
	tag_default "$file"

elif [[ -n "$listenbrainz_scrobb" ]] \
  && [[ -n "$listenbrainz_token" ]]; then
	tag_default "$file"
fi
}
tag_sid() {
local file
file="$1"

if [[ -n "$xxd_bin" ]] \
&& [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	tag_artist=$("$xxd_bin" -ps -s 0x36 -l 32 "$file" | tr -d '[:space:]' | xxd -r -p | tr -d '\0')
	if [[ "$tag_artist" = "<?>" ]]; then
		unset tag_artist
	fi
	tag_album=$("$xxd_bin" -ps -s 0x16 -l 32 "$file" | tr -d '[:space:]' | xxd -r -p | tr -d '\0')
	if [[ "$tag_album" = "<?>" ]]; then
		unset tag_album
	fi
	tag_default "$file"

elif [[ -n "$listenbrainz_scrobb" ]] \
  && [[ -n "$listenbrainz_token" ]]; then
	tag_default "$file"
fi
}
tag_spc() {
local file
file="$1"

if [[ -n "$xxd_bin" ]] \
&& [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	tag_title=$("$xxd_bin" -ps -s 0x0002Eh -l 32 "$file" \
				| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
	tag_artist=$("$xxd_bin" -ps -s 0x000B1h -l 32 "$file" \
				| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
	tag_album=$("$xxd_bin" -ps -s 0x0004Eh -l 32 "$file" \
				| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
	tag_default "$file"

elif [[ -n "$listenbrainz_scrobb" ]] \
  && [[ -n "$listenbrainz_token" ]]; then
	tag_default "$file"
fi
}
tag_vgm() {
local file
file="$1"

if [[ -n "$vgm_tag_bin" ]] \
&& [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	"$vgm_tag_bin" -ShowTag8 "$file" > "$glouglou_cache_tag"

	tag_title=$(sed -n 's/Track Title:/&\n/;s/.*\n//p' "$glouglou_cache_tag" | awk '{$1=$1}1')
	tag_artist=$(sed -n 's/Composer:/&\n/;s/.*\n//p' "$glouglou_cache_tag" | awk '{$1=$1}1')
	tag_album=$(sed -n 's/Game Name:/&\n/;s/.*\n//p' "$glouglou_cache_tag" | awk '{$1=$1}1')
	tag_default "$file"

elif [[ -n "$listenbrainz_scrobb" ]] \
  && [[ -n "$listenbrainz_token" ]]; then
	tag_default "$file"
fi
}
tag_xsf() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
&& [[ -n "$listenbrainz_token" ]]; then

	strings -e S "$file" | sed -n '/TAG/,$p' > "$glouglou_cache_tag"

	tag_title=$(< "$glouglou_cache_tag" grep -i -a title= | sed 's/^.*=//')
	tag_artist=$(< "$glouglou_cache_tag" grep -i -a artist= | sed 's/^.*=//')
	tag_album=$(< "$glouglou_cache_tag" grep -i -a game= | sed 's/^.*=//')
	tag_default "$file"
fi
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
  -s|--scrobb             Use ListenBrainz scrobber.
  -t|--token <token>      Register your ListenBrainz token.
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
   && [[ -z "$ffplay_bin" ]] \
   && [[ -z "$fluidsynth_bin" ]] \
   && [[ -z "$mpv_bin" ]] \
   && [[ -z "$openmpt123_bin" ]] \
   && [[ -z "$sc68_bin" ]] \
   && [[ -z "$sidplayfp_bin" ]] \
   && [[ -z "$spc2wav_bin" ]] \
   && [[ -z "$timidity_bin" ]] \
   && [[ -z "$uade123_bin" ]] \
   && [[ -z "$vgmplay_bin" ]] \
   && [[ -z "$xmp_bin" ]] \
   && [[ -z "$zxtune123_bin" ]] \
   && [[ -z "$vgmstream123_bin" ]]; then
	echo_error "glouglou was breaked, none dependencies are met:"
	printf '  %s\n' "${player_dependency[@]}" >&2
	exit
fi
}
# Populate vgm array
search_vgm() {
for input in "${input_dir[@]}"; do
	mapfile -t -O "${#lst_vgm[@]}" lst_vgm < <(find "$input" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$' 2>/dev/null)
done

if (( "${#lst_vgm[@]}" )); then
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
fi
}
# Play loop
main_loop () {
local ext
local Player_PID

# For debug
#set -x
#printf '%s\n' "${lst_vgm[@]}"
#exit

force_quit() {
	while true; do
		read -t0.1 -rsn1 k
		if [[ "$k" = "q" ]]; then
			kill -9 "$Player_PID" &>/dev/null
			break
		fi
		if ! ps -p $Player_PID > /dev/null; then
			break
		fi
	done
}

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

			# Play
			if echo "|${ext_adplay}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$adplay_bin" ]]; then
				"$adplay_bin" "${lst_vgm[i]}" -v -r -o
				tag_default "${lst_vgm[i]}"
				listenbrainz_submit "AdPlay"

			elif echo "|${ext_mpv}|" | grep -i "|${ext}|" &>/dev/null; then

				if [[ -n "$mpv_bin" ]]; then
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--volume=100 \
						--display-tags=Album,Date,Year,Artist,Artists,Composer,Track,Title,Genre
						tag_mpv "${lst_vgm[i]}"
						listenbrainz_submit "MPV"
				elif [[ -n "$vgmstream123_bin" ]]; then
					"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "vgmstream"
				elif [[ -n "$ffplay_bin" ]]; then
					"$ffplay_bin" -showmode 0 -hide_banner -autoexit "${lst_vgm[i]}" &
					Player_PID="$!"
					force_quit
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "ffplay"
				fi

			elif echo "|${ext_sc68}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$sc68_bin" ]]; then
				"$sc68_bin" "${lst_vgm[i]}" --track=all --stdout \
					| "$aplay_bin" -r 44100 -c 2 -f S16_LE --quiet 2>/dev/null &
				Player_PID="$!"
				force_quit
				tag_sc68 "${lst_vgm[i]}"
				listenbrainz_submit "sc68"

			elif echo "|${ext_sidplayfp}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$sidplayfp_bin" ]]; then
					"$sidplayfp_bin" "${lst_vgm[i]}" -v -s --digiboost
					tag_sid "${lst_vgm[i]}"
					listenbrainz_submit "sidplayfp"
				elif [[ -n "$zxtune123_bin" ]]; then
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					tag_sid "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune SID"
				fi

			elif echo "|${ext_snes}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$zxtune123_bin" ]]; then
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					tag_spc "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune SNES"
				elif [[ -n "$spc2wav_bin" ]]; then
					"$spc2wav_bin" "${lst_vgm[i]}" /dev/stdout \
						| "$aplay_bin" --quiet 2>/dev/null &
					Player_PID="$!"
					force_quit
					tag_spc "${lst_vgm[i]}"
					listenbrainz_submit "spc2wav"
				elif [[ -n "$mpv_bin" ]]; then
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--volume=100 \
						--term-osd-bar=yes \
						--display-tags=Artists,Composer,Album,Track,Title,Date,Year,Artist,Genre
					tag_spc "${lst_vgm[i]}"
					listenbrainz_submit "MPV SNES"
				fi

			elif echo "|${ext_midi}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$timidity_bin" ]]; then
					"$timidity_bin" "${lst_vgm[i]}" -in --volume=100
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "TiMidity++"
				elif [[ -n "$fluidsynth_bin" ]]; then
					"$fluidsynth_bin" "${lst_vgm[i]}"
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "FluidSynth"
				fi

			elif echo "|${ext_tracker}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$xmp_bin" ]]; then
					"$openmpt123_bin" --terminal-width "$term_width" \
					--terminal-height "$term_height" --no-details \
						"${lst_vgm[i]}"
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "openmpt123"
				elif [[ -n "$xmp_bin" ]]; then
					"$xmp_bin" "${lst_vgm[i]}"
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "XMP"
				elif [[ -n "$zxtune123_bin" ]]; then
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune Tracker"
				elif [[ -n "$mpv_bin" ]]; then
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--volume=100 \
						--term-osd-bar=yes \
						--display-tags=Artists,Composer,Album,Track,Title,Date,Year,Artist,Genre
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "MPV Tracker"
				fi

			elif echo "|${ext_uade}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$uade123_bin" ]]; then
				"$uade123_bin" "${lst_vgm[i]}" -v
				tag_default "${lst_vgm[i]}"
				listenbrainz_submit "UADE"

			elif echo "|${ext_vgmstream}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$vgmstream123_bin" ]]; then
				"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"
				tag_default "${lst_vgm[i]}"
				listenbrainz_submit "vgmstream"

			elif echo "|${ext_vgmplay}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$vgmplay_bin" ]]; then
				"$vgmplay_bin" "${lst_vgm[i]}"
				tag_vgm "${lst_vgm[i]}"
				listenbrainz_submit "VGMPlay"

			elif echo "|${ext_xmp}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$xmp_bin" ]]; then
				"$xmp_bin" "${lst_vgm[i]}"
				tag_default "${lst_vgm[i]}"
				listenbrainz_submit "XMP"

			elif echo "|${ext_zxtune}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$zxtune123_bin" ]]; then
				"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
				if echo "|${ext_zxtune_xsf}|" | grep -i "|${ext}|" &>/dev/null; then
					tag_xsf "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune XSF"
				elif [[ "${ext}" = "sap" ]]; then
					tag_sap "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune SAP"
				else
					tag_default "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune"
				fi
			fi
		done

		# If no repeat
		if [[ -n "$no_repeat" ]] \
		&& [[ "$vgm_counter" = "${#lst_vgm[@]}" ]]; then
			kill_stat
		fi

	done
else
	echo_error "glouglou was breaked, there's nothing here, no file to play."
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
trap 'kill_stat' INT TERM

# Dependencies
player_dependency=(
	'adplay'
	'ffplay'
	'fluidsynth'
	'mpv'
	'openmpt123'
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
glouglou_config_dir="/home/$USER/.config/glouglou"
glouglou_config_file="/home/$USER/.config/glouglou/config"
glouglou_cache_tag="/tmp/glouglou-tag"

# Type of files allowed by player
ext_adplay="adl|amd|bam|cff|cmf|d00|dfm|ddt|dtm|got|hsc|hsq|imf|laa|ksm|mdi|mtk|rad|rol|sdb|sqx|wlf|xms|xsm"
ext_mpv_various="aac|ac3|aif|aiff|ape|flac|m4a|mp3|mpc|ogg|opus|wav|wv|wma"
ext_mpv_tracker="cow|mo3|stp|plm"
ext_mpv="${ext_mpv_various}|${ext_mpv_tracker}"
ext_sc68="sc68|sndh"
ext_sidplayfp="sid"
ext_snes="spc"
ext_midi="mid"
ext_tracker="it|mod|s3m|xm"
ext_uade="aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|hot|fc13|fc14|med|mug|np3|sfx|smus|soc|p4x|tiny"
ext_vgmstream_0_c="8svx|ads|adp|adpcm|adx|aix|apc|at3|bcstm|bcwav|bfstm|bfwav|brstm|cfn|csmp|cps"
ext_vgmstream_d_n="dsm|dsp|fsb|genh|hca|hps|ifs|imc|lwav|mic|mus|musx|nlsd|npsf"
ext_vgmstream_o_z="sad|ss2|strm|p04|p16|thp|vag|vgmstream|xa|xnb|xwv"
ext_vgmstream="${ext_vgmstream_0_c}|${ext_vgmstream_d_n}|${ext_vgmstream_o_z}"
ext_vgmplay="s98|vgm|vgz"
ext_xmp="669|amf|dbm|digi|dsm|dsym|far|gz|mdl|musx|psm"
ext_zxtune_various="ay|ams|dmf|dtt|hvl|sap|v2m|ym"
ext_zxtune_xsf="2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_zxtune_zx_spectrum="asc|psc|pt2|pt3|sqt|stc|stp"
ext_zxtune="${ext_zxtune_various}|${ext_zxtune_xsf}|${ext_zxtune_zx_spectrum}"

# Setup
aplay_bin
adplay_bin
ffplay_bin
fluidsynth_bin
mpv_bin
openmpt123_bin
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
glouglou_config
listenbrainz_token
listenbrainz_bin

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
					echo_error "glouglou was breaked."
					echo_error "\"$input\" directory does not exist."
					exit
				fi
			done
			;;
		-r|--repeat_off)
			no_repeat="1"
		;;
		-s|--scrobb)
			if [[ -z "$curl_bin" ]]; then
				echo_error "glouglou was breaked."
				echo_error "curl must be installed for use ListenBrainz scrobber."
				exit
			elif [[ -z "$listenbrainz_token" ]]; then
				echo_error "glouglou was breaked."
				echo_error "ListenBrainz token must be registered for use ListenBrainz scrobber"
				exit
			else
				listenbrainz_scrobb="1"
				new_submit_time=$(date +%s)
			fi
		;;
		-t|--token)
			shift
			listenbrainz_register="$1"
			listenbrainz_token
			exit
		;;
		*)
			usage
			exit
		;;
	esac
	shift
done

# $ext_allplay contruction depend -> player_dependency_test
ext_allplay_raw="${ext_adplay}| \
				 ${ext_mpv}| \
				 ${ext_sc68}| \
				 ${ext_sidplayfp}| \
				 ${ext_snes}| \
				 ${ext_midi}| \
				 ${ext_tracker}| \
				 ${ext_uade}| \
				 ${ext_vgmplay}| \
				 ${ext_vgmstream}| \
				 ${ext_vgmplay}| \
				 ${ext_xmp}| \
				 ${ext_zxtune}"
ext_allplay=$(echo ${ext_allplay_raw//[[:blank:]]/} | tr -s '|')
test_argument
search_vgm
# Start time counter of process
start_process_time=$(date +%s)
# Play
main_loop

exit
