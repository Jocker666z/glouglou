#!/usr/bin/env bash
# shellcheck disable=SC2317,SC2086,SC2207
# glouglou
# Bad bash script for no brain, also play vgm in shuffle
#
# Author : Romain Barbarot
# https://github.com/Jocker666z/glouglou/
# Licence : Unlicense

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
cvlc_bin() {
local bin_name
local system_bin_location

bin_name="cvlc"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	cvlc_bin="$system_bin_location"
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
gsf2wav_bin() {
local bin_name
local system_bin_location

bin_name="gsf2wav"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	gsf2wav_bin="$system_bin_location"
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
simple_mdx2wav_bin() {
local bin_name
local system_bin_location

bin_name="simple_mdx2wav"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	simple_mdx2wav_bin="$system_bin_location"
else
	unset ext_simple_mdx2wav
fi

if [[ -z "$aplay_bin" ]]; then
	unset ext_simple_mdx2wav
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
wildmidi_bin() {
local bin_name
local system_bin_location

bin_name="wildmidi"
system_bin_location=$(command -v $bin_name)

if [[ -n "$system_bin_location" ]]; then
	wildmidi_bin="$system_bin_location"
else
	unset ext_wildmidi
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
multi_depend() {
# C64 .sid
if [[ -z "$sidplayfp_bin" ]] \
&& [[ -z "$zxtune123_bin" ]]; then
	unset ext_sidplayfp
fi

# GBA
if [[ -z "$gsf2wav_bin" ]] \
&& [[ -z "$zxtune123_bin" ]]; then
	unset ext_gba
fi

# Midi
if [[ -z "$timidity_bin" ]] \
&& [[ -z "$fluidsynth_bin" ]]; then
	unset ext_midi
fi

# MPV
if [[ -z "$mpv_bin" ]] \
&& [[ -z "$ffplay_bin" ]]; then
	unset ext_common
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
if [[ ! -d "$glouglou_config_dir" ]] && [[ -w "/home/$USER/.config/" ]]; then
	mkdir "$glouglou_config_dir"
elif [[ ! -d "$glouglou_config_dir" ]] && [[ ! -w "/home/$USER/.config/" ]]; then
	echo_error "glouglou was breaked."
	echo_error "Impossible to create ${glouglou_config_dir}, not writable."
	exit
fi

if [[ ! -f "$glouglou_config_file" ]] && [[ -w "$glouglou_config_dir" ]]; then
	echo "listenbrainz_token=" > "$glouglou_config_file"
	echo "play_blacklist=" >> "$glouglou_config_file"
elif [[ ! -f "$glouglou_config_file" ]] && [[ ! -w "$glouglou_config_dir" ]]; then
	echo_error "glouglou was breaked."
	echo_error "Impossible to create ${glouglou_config_file}, not writable."
	exit
fi
}
various_bin() {
local bin_name
local system_bin_location

# curl
bin_name="curl"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	curl_bin="$system_bin_location"
fi

# curl
bin_name="beet"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	beet_bin="$system_bin_location"
fi

# info68
bin_name="info68"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	info68_bin="$system_bin_location"
fi

# ffmpeg
bin_name="ffmpeg"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	ffmpeg_bin="$system_bin_location"
fi

# mutagen-inspect
bin_name="mutagen-inspect"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	mutagen_inspect_bin="$system_bin_location"
fi

# vgm_tag
bin_name="vgm_tag"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	vgm_tag_bin="$system_bin_location"
fi

# vgmstream-cli
bin_name="vgmstream-cli"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	vgmstream_cli_bin="$system_bin_location"
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
local playlist_bef_nb
local playlist_aft_nb_one
local playlist_aft_nb_two
local playlist_aft_nb_three
local lst_vgm_bef
local lst_vgm_current
local lst_vgm_aft_one
local lst_vgm_aft_two
local lst_vgm_aft_three

play_item="$1"

# Load & reload term size
term_size

# Constuct
playlist_bef_nb=$(( play_item - 1 ))
playlist_aft_nb_one=$(( play_item + 1 ))
playlist_aft_nb_two=$(( play_item + 2 ))
playlist_aft_nb_three=$(( play_item + 3 ))
lst_vgm_bef=$(echo "${lst_vgm[playlist_bef_nb]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_current=$(echo "${lst_vgm[play_item]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_aft_one=$(echo "${lst_vgm[playlist_aft_nb_one]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_aft_two=$(echo "${lst_vgm[playlist_aft_nb_two]}" | rev | cut -d'/' -f-2 | rev)
lst_vgm_aft_three=$(echo "${lst_vgm[playlist_aft_nb_three]}" | rev | cut -d'/' -f-2 | rev)

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
echo_truncate "  ${lst_vgm_aft_three}"
echo_separator
}
echo_error() {
local error_label
error_label="$1"

echo "${error_label}" >&2
}
# Publish tags
publish_tags() {
local player
local file
local dir
local cover

player="$1"
file="$2"
dir=$(realpath "$(dirname "${file}")")

# Cover search
for img in "${cover_name[@]}"; do
	if [[ -f "${dir}/${img}" ]]; then
		cover="${dir}/${img}"
		break
	fi
done

# If no cover file, try to extract from file
if echo "|${ext_common}|" | grep -i "|${ext}|" &>/dev/null \
&& [[ -z "$cover" ]] \
&& [[ -n "$ffmpeg_bin" ]]; then

	# Reset
	if [[ -f "$glouglou_cover" ]]; then
		rm "$glouglou_cover" &>/dev/null
	fi

	# Try to extract
	"$ffmpeg_bin" -hide_banner -loglevel quiet -nostats\
		-y -i "$file" \
		-an -c:v copy "$glouglou_cover"

	# Set if exist
	if [[ -f "$glouglou_cover" ]]; then
		cover="$glouglou_cover"
	fi
fi

# Record
if [[ -n "$publish_tags" ]] \
&& [[ -n "$tag_title" ]]; then

	{
		echo "$tag_title"
		echo "$tag_artist"
		echo "$tag_album"
		echo "$player"
		echo "$cover"
		echo "$tag_total_duration"
		echo "$tag_system"
	} > "$glouglou_tags"

fi
}
# ListenBrainz
listenbrainz_status() {
if nc -zw1 api.listenbrainz.org 443 &>/dev/null; then
	listenbrainz_status="1"
fi
}
listenbrainz_token() {
local token_test

# If update token
if [[ -n "$listenbrainz_register" ]]; then

	# Test token
	token_test=$("$curl_bin" -s \
				-X POST -H "Authorization: token $listenbrainz_register" \
				https://api.listenbrainz.org/1/submit-listens \
				| grep "401")

	if [[ -n "$token_test" ]]; then
		echo "${listenbrainz_register} is not a valid ListenBrainz token."
	elif [[ -f "$glouglou_config_file" ]]; then
		sed -i "s/\(listenbrainz_token *= *\).*/\1${listenbrainz_register}/" "$glouglou_config_file"
		echo "${listenbrainz_register} has been registered as your new ListenBrainz token."
	fi

fi

# If no update token = set current
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

	local limit_scrobb_duration
	local submit_diff_in_s
	local unix_date
	local player

	# Prevent repeat scrobb, half total duration or limit to 10s
	last_submit_time=$(date +%s)
	submit_diff_in_s=$(( last_submit_time - new_submit_time ))
	if [[ -n "$tag_total_duration" ]]; then
		limit_scrobb_duration=$(( tag_total_duration / 2 ))
	else
		limit_scrobb_duration="10"
	fi

	if [[ "$submit_diff_in_s" -gt "$limit_scrobb_duration" ]]; then

		new_submit_time=$(date +%s)
		player="$1"
		unix_date=$(date +%s)

		# clean tag
		tag_artist="${tag_artist//\"/\'}"
		tag_title="${tag_title//\"/\'}"
		tag_album="${tag_album//\"/\'}"
		tag_brainz_artist_id=$(printf '"%s"\n' ${tag_brainz_artist_id// \/ / } \
								| paste -sd, -)

		"$curl_bin" --silent --output /dev/null \
			-X POST -H "Authorization: token $listenbrainz_token" \
			--header "Content-Type:application/json" \
			-d '{
			"listen_type": "single",
			"payload": [{
				"listened_at": "'"$unix_date"'",
				"track_metadata": {
					"additional_info": {
						"media_player": "'"$player"'",
						"submission_client": "glouglou",
						"release_mbid": "'"$tag_brainz_album_id"'",
						"artist_mbids": ['"$tag_brainz_artist_id"'],
						"recording_mbid": "'"$tag_brainz_recording_id"'",
						"release_group_mbid": "'"$tag_brainz_releasegroupid_id"'",
						"track_mbid": "'"$tag_brainz_track_id"'",
						"tags": []
						},
					"artist_name": "'"$tag_artist"'",
					"track_name": "'"$tag_title"'",
					"release_name": "'"$tag_album"'"
			}}]}' \
			https://api.listenbrainz.org/1/submit-listens

	fi

fi
}
# vgmfdb
vgmfdb_tags() {
local i
local file
local vgmfdb_tag_path
local vgmfdb_tag_size
local vgmfdb_tag_timestamp

file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -n "$vgmfdb" ]]; then

	# Get id
	vgmfdb_tag_path="$file"
	vgmfdb_tag_size=$(wc -c "$file" | awk '{print $1;}')
	vgmfdb_tag_timestamp=$(date -r "$file" "+%s")
	vgmfdb_tag_id=$(echo "${vgmfdb_tag_path}${vgmfdb_tag_size}${vgmfdb_tag_timestamp}" \
					| sha256sum | awk '{print $1;}')

	# Get all tags
	mapfile -t vgmfdb_tags < <( sqlite3 "$vgmfdb_database" "SELECT * FROM vgm WHERE id = '${vgmfdb_tag_id}'" \
								| awk '{gsub(/\|/,"\n")}1' )

	# Assign tags
	if (( "${#vgmfdb_tags[@]}" )); then
		tag_title="${vgmfdb_tags[2]}"
		tag_artist="${vgmfdb_tags[3]}"
		tag_album="${vgmfdb_tags[4]}"
		tag_total_duration="${vgmfdb_tags[8]}"
		tag_system="${vgmfdb_tags[9]}"
		vgmfdb_id="1"
	fi

fi
}
# Tag
tag_reset() {
if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]]; then
	# Reset
	unset tag_title
	unset tag_artist
	unset tag_album
	unset tag_total_duration
	unset tag_system
	unset tag_brainz_album_id
	unset tag_brainz_artist_id
	unset tag_brainz_recording_id
	unset tag_brainz_releasegroupid_id
	unset tag_brainz_track_id
	unset vgmfdb_id
fi
}
tag_default() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	if [[ -z "$tag_title" ]]; then
		tag_title=$(basename "${file%.*}")
	fi
	if [[ -z "$tag_album" ]]; then
		tag_album=$(dirname "$file" | rev | cut -d'/' -f-1 | rev)
		if [[ "$tag_album" = "." ]]; then
			tag_album=$(pwd -P | rev | cut -d'/' -f-1 | rev)
		fi
	fi
	if [[ -z "$tag_artist" ]]; then
		tag_artist="$tag_album"
	fi

	if [[ -z "$tag_system" ]]; then

		# tag_sytem by files ext.
		shopt -s nocasematch

		# Adlib
		if [[ "${file##*.}" = "adl" ]]; then
			tag_system="Westwood ADL"
		elif [[ "${file##*.}" = "amd" ]]; then
			tag_system="AMusic module"
		elif [[ "${file##*.}" = "bam" ]]; then
			tag_system="Bob's Adlib Music"
		elif [[ "${file##*.}" = "cff" ]]; then
			tag_system="Boom Tracker v4.0"
		elif [[ "${file##*.}" = "cmf" ]]; then
			tag_system="Creative Music Format"
		elif [[ "${file##*.}" = "d00" ]]; then
			tag_system="EdLib packed module"
		elif [[ "${file##*.}" = "dfm" ]]; then
			tag_system="Digital FM"
		elif [[ "${file##*.}" = "ddt" ]]; then
			tag_system="Jill of the Jungle Music File"
		elif [[ "${file##*.}" = "dmo" ]]; then
			tag_system="Twin TrackPlayer"
		elif [[ "${file##*.}" = "dtm" ]]; then
			tag_system="DeFy Tracker"
		elif [[ "${file##*.}" = "got" ]]; then
			tag_system="God of Thunder Music"
		elif [[ "${file##*.}" = "hsc" ]]; then
			tag_system="HSC AdLib Composer"
		elif [[ "${file##*.}" = "hsq" ]]; then
			tag_system="Herbulot AdLib"
		elif [[ "${file##*.}" = "imf" ]] || [[ "${file##*.}" = "wlf" ]]; then
			tag_system="Apogee IMF"
		elif [[ "${file##*.}" = "laa" ]]; then
			tag_system="LucasArts AdLib Module"
		elif [[ "${file##*.}" = "ksm" ]]; then
			tag_system="Ken's AdLib"
		elif [[ "${file##*.}" = "m" ]] || [[ "${file##*.}" = "tm" ]]; then
			tag_system="M Format"
		elif [[ "${file##*.}" = "mdi" ]]; then
			tag_system="AdLib MIDIPlay Format"
		elif [[ "${file##*.}" = "mtk" ]]; then
			tag_system="MPU-401 Tracker"
		elif [[ "${file##*.}" = "rad" ]]; then
			tag_system="Reality AdLib Tracker"
		elif [[ "${file##*.}" = "rol" ]]; then
			tag_system="AdLib/Roland Song"
		elif [[ "${file##*.}" = "sdb" ]] || [[ "${file##*.}" = "sqx" ]]; then
			tag_system="Herad System"
		elif [[ "${file##*.}" = "xms" ]]; then
			tag_system="AMUSIC Tracker XMS"
		elif [[ "${file##*.}" = "xsm" ]]; then
			tag_system="eXtra Simple Music"

		elif [[ "${file##*.}" = "ay" ]]; then
			tag_system="AY-3-8910"

		# MIDI
		elif [[ "${file##*.}" = "mid" ]]; then
			tag_system="MIDI"

		# MIDI-like
		elif [[ "${file##*.}" = "hmi" ]]; then
			tag_system="Human Machine Interfaces MIDI"
		elif [[ "${file##*.}" = "hmp" ]]; then
			tag_system="Human Machine Interfaces MIDI P"
		elif [[ "${file##*.}" = "xmi" ]]; then
			tag_system="Extended Multiple Instrument Digital Interface"

		# s98
		elif [[ "${file##*.}" = "s98" ]]; then
			tag_system="PC-Engine / TurboGrafx-16"

		# sc68
		elif [[ "${file##*.}" = "sc68" ]]; then
			tag_system="SC 68000"

		# SAP
		elif [[ "${file##*.}" = "sap" ]]; then
			tag_system="Atari 8-bit"

		# SID
		elif [[ "${file##*.}" = "sid" ]] || [[ "${file##*.}" = "prg" ]]; then
			tag_system="Comomdore 64/128"

		# SNES
		elif [[ "${file##*.}" = "spc" ]]; then
			tag_system="Super Nintendo / Super Famicom"

		# Tracker (uade)
		elif [[ "${file##*.}" = "ahx" ]]; then
			tag_system="Abyss Highest eXperience"
		elif [[ "${file##*.}" = "bp" ]]; then
			tag_system="SoundMon 2.0"
		elif [[ "${file##*.}" = "cm" ]] || [[ "${file##*.}" = "rk" ]]; then
			tag_system="CustomMade"
		elif [[ "${file##*.}" = "cus" ]]; then
			tag_system="DeliTracker Custom"
		elif [[ "${file##*.}" = "dw" ]]; then
			tag_system="David Whittaker"
		elif [[ "${file##*.}" = "fc13" ]] || [[ "${file##*.}" = "fc14" ]]; then
			tag_system="Future Composer"
		elif [[ "${file##*.}" = "gmc" ]]; then
			tag_system="Game Music Creator"
		elif [[ "${file##*.}" = "np3" ]]; then
			tag_system="Noise Packer 3.0"
		elif [[ "${file##*.}" = "okt" ]]; then
			tag_system="Oktalyzer"
		elif [[ "${file##*.}" = "pru2" ]]; then
			tag_system="Prorunner 2.0"
		elif [[ "${file##*.}" = "s7g" ]]; then
			tag_system="Jochen Hippel 7V"
		elif [[ "${file##*.}" = "sfx" ]]; then
			tag_system="SoundFX"
		elif [[ "${file##*.}" = "soc" ]]; then
			tag_system="Hippel-COSO"
		elif [[ "${file##*.}" = "tiny" ]]; then
			tag_system="Sonix Music Driver"
		elif [[ "${file##*.}" = "tw" ]]; then
			tag_system="Sound Images"

		# Tracker (xmp)
		elif [[ "${file##*.}" = "669" ]]; then
			tag_system="Composer 669 Module"
		elif [[ "${file##*.}" = "amf" ]]; then
			tag_system="Advanced Module Format"
		elif [[ "${file##*.}" = "dbm" ]] || [[ "${file##*.}" = "digi" ]]; then
			tag_system="DigiBooster Module"
		elif [[ "${file##*.}" = "dsym" ]]; then
			tag_system="Digital Symphony Module"
		elif [[ "${file##*.}" = "far" ]]; then
			tag_system=" Farandole Composer Module"
		elif [[ "${file##*.}" = "mdl" ]]; then
			tag_system="Digitrakker Module"
		elif [[ "${file##*.}" = "musx" ]]; then
			tag_system="Archimedes Tracker Module"
		elif [[ "${file##*.}" = "psm" ]]; then
			tag_system="ProTracker Studio Module"

		# Tracker (zxtune)
		elif [[ "${file##*.}" = "rmt" ]]; then
			tag_system="Raster Music Tracker"
		elif [[ "${file##*.}" = "v2m" ]]; then
			tag_system="Farbrausch V2M"
		elif [[ "${file##*.}" = "vt2" ]]; then
			tag_system="Vortex Tracker 2"
		elif [[ "${file##*.}" = "vtx" ]]; then
			tag_system="Vortex Tracker"
		elif [[ "${file##*.}" = "xrns" ]]; then
			tag_system="Renoise"

		# X68000
		elif [[ "${file##*.}" = "mdx" ]]; then
			tag_system="Sharp X68000"

		# xfs (zxtune)
		elif [[ "${file##*.}" = "psf" || "${file##*.}" = "minipsf" ]]; then
			tag_system="Sony PS1"
		elif [[ "${file##*.}" = "psf2" || "${file##*.}" = "minipsf2" ]]; then
			tag_system="Sony PS2"
		elif [[ "${file##*.}" = "2sf" || "${file##*.}" = "mini2sf" || "${file##*.}" = "minincsf" || "${file##*.}" = "ncsf" ]]; then
			tag_system="Nintendo DS"
		elif [[ "${file##*.}" = "ssf" || "${file##*.}" = "minissf" ]]; then
			tag_system="Sega Saturn"
		elif [[ "${file##*.}" = "gsf" || "${file##*.}" = "minigsf" ]]; then
			tag_system="Nintendo GBA"
		elif [[ "${file##*.}" = "usf" || "${file##*.}" = "miniusf" ]]; then
			tag_system="Nintendo 64"
		elif [[ "${file##*.}" = "dsf" || "${file##*.}" = "minidsf" ]]; then
			tag_system="Sega Dreamcast"

		elif [[ "${file##*.}" = "ym" ]]; then
			tag_system="Yamaha Music"

		# ZX Spectrum (zxtune)
		elif [[ "${file##*.}" = "asc" ]]; then
			tag_system="ASC Sound Master"
		elif [[ "${file##*.}" = "psc" ]]; then
			tag_system="Pro Sound Creator"
		elif [[ "${file##*.}" = "pt1" ]] || [[ "${file##*.}" = "pt2" ]] || [[ "${file##*.}" = "pt3" ]]; then
			tag_system="Pro Tracker"
		elif [[ "${file##*.}" = "sqt" ]]; then
			tag_system="Quartet PSG Module"
		elif [[ "${file##*.}" = "stc" ]]; then
			tag_system="STC Sound Trackere"
		elif [[ "${file##*.}" = "stp" ]]; then
			tag_system="Soundtracker Pro II Module"
		elif [[ "${file##*.}" = "tap" ]]; then
			tag_system="ZX Spectrum Tape Image"
		fi

		shopt -u nocasematch

	fi

fi
}
tag_common() {
local file
local file_type
local file_kbs
local file_size
local file_hz
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]]; then

	# According to https://picard-docs.musicbrainz.org/en/appendices/tag_mapping.html
	if [[ -n "$mutagen_inspect_bin" ]]; then

		"$mutagen_inspect_bin" "$file" > "$glouglou_cache_tags"

		tag_title=$(< "$glouglou_cache_tags" \
					grep -E -i -a "^title=|^TIT2=" \
					| cut -f2- -d'=')
		tag_artist=$(< "$glouglou_cache_tags" \
					grep -E -i -a "^artist=|^TPE1=" \
					| cut -f2- -d'=')
		tag_album=$(< "$glouglou_cache_tags" \
					grep -E -i -a "^album=|^TALB=" \
					| cut -f2- -d'=')
		tag_total_duration=$(< "$glouglou_cache_tags" \
							grep "seconds" \
							| head -1 \
							| awk -F"seconds" '{print $1}' \
							| awk '{print $NF}' \
							| awk -F"." '{print $1}')
		tag_brainz_album_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_ALBUMID=|^TXXX:MusicBrainz Artist Id=" \
								| cut -f2- -d'=')
		tag_brainz_artist_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_ARTISTID=|^TXXX:MusicBrainz Artist Id=" \
								| cut -f2- -d'=')
		tag_brainz_recording_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_TRACKID=" \
								| cut -f2- -d'=')
		tag_brainz_releasegroupid_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_RELEASEGROUPID=|^TXXX:MusicBrainz Release Group Id" \
								| cut -f2- -d'=')
		tag_brainz_track_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_RELEASETRACKID=|^TXXX:MusicBrainz Release Track Id" \
								| cut -f2- -d'=')

		# tag_system type
		file_type="${file##*.}"
		file_type="${file_type^^}"
		if [[ "$file_type" = "FLC" ]]; then
			file_type="FLAC - "
		elif [[ "$file_type" = "WV" ]]; then
			file_type="WAVPACK"
		fi
		# tag_system kb/s
		file_kbs=$(< "$glouglou_cache_tags" \
					grep "bps" \
					| head -1 \
					| awk -F"bps" '{print $1}' \
					| awk '{print $NF}')
		if [[ $file_kbs =~ ^[0-9]+$ ]]; then
			file_kbs=$(bc <<< "scale=0; $file_kbs/1000")
			file_kbs="$file_kbs kb/s"
		elif [[ $tag_total_duration =~ ^[0-9]+$ ]]; then
			file_size=$(wc -c "$file" | awk '{print $1;}')
			file_size=$(bc <<< "scale=0; $file_size / 1024")
			file_kbs=$(( 8 * file_size / tag_total_duration))
			file_kbs="$file_kbs kb/s"
		else
			unset file_kbs
		fi
		# tag_system kHz
		if [[ "$file_type" = "OPUS" ]]; then
			file_hz="48 kHz"
		else
			file_hz=$(< "$glouglou_cache_tags" \
						grep "Hz" \
						| head -1 \
						| awk -F"Hz" '{print $1}' \
						| awk '{print $NF}')
			if [[ $file_hz =~ ^[0-9]+$ ]]; then
				file_hz=$(bc <<< "scale=1; $file_hz/1000")
				file_hz="$file_hz kHz"
			else
				unset file_hz
			fi
		fi
		# tag_system
		if [[ -z "$file_kbs" ]] \
		&& [[ -z "$file_hz" ]]; then
			tag_system="${file_type}"
		elif [[ -n "$file_kbs" ]] \
		  && [[ -z "$file_hz" ]]; then
			tag_system="${file_type} - ${file_kbs}"
		elif [[ -z "$file_kbs" ]] \
		  && [[ -n "$file_hz" ]]; then
			tag_system="${file_type} - ${file_hz}"
		elif [[ -n "$file_kbs" ]] \
		  && [[ -n "$file_hz" ]]; then
			tag_system="${file_type} - ${file_kbs}, ${file_hz}"
		fi

	fi

	if [[ -n "$mpv_bin" ]]; then

		if [[ -z "$tag_title" ]] \
		|| [[ -z "$tag_artist" ]] \
		|| [[ -z "$tag_album" ]]; then
			"$mpv_bin" --terminal --no-video --vo=null --ao=null \
				--display-tags=Title,Artist,Album \
				--frames=0 --quiet --no-cache --no-config "$file" \
				> "$glouglou_cache_tags"
		fi

		if [[ -z "$tag_title" ]]; then
			tag_title=$(sed -n 's/Title:/&\n/;s/.*\n//p' "$glouglou_cache_tags" | awk '{$1=$1}1')
		fi
		if [[ -z "$tag_artist" ]]; then
			tag_artist=$(sed -n 's/Artist:/&\n/;s/.*\n//p' "$glouglou_cache_tags" | awk '{$1=$1}1')
		fi
		if [[ -z "$tag_album" ]]; then
			tag_album=$(sed -n 's/Album:/&\n/;s/.*\n//p' "$glouglou_cache_tags" | awk '{$1=$1}1')
		fi

	fi

	tag_default "$file"

fi
}
tag_openmpt() {
local file
local duration_record
local minute
local second
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	"$openmpt123_bin" --info "$file" \
		> "$glouglou_cache_tags"

	tag_title=$(< "$glouglou_cache_tags" grep "Title." \
				| awk -F'.: ' '{print $NF}' \
				| awk '{$1=$1};1')
	tag_artist=$(< "$glouglou_cache_tags" grep "Artist." \
				| awk -F'.: ' '{print $NF}' \
				| awk '{$1=$1};1')
	# Special trick, many mod not have artist
	if [[ -n "$tag_title" ]] \
	&& [[ -z "$tag_artist" ]]; then
		tag_artist=$(basename "${file%.*}")
	fi
	tag_system=$(< "$glouglou_cache_tags" grep "Tracker....:" \
				| awk -F'.: ' '{print $NF}' \
				| awk '{$1=$1};1')
	if [[ "${tag_system}" = "Unknown" ]] \
	|| [[ "${tag_system}" = "..converted.." ]]; then
		tag_system=$(< "$glouglou_cache_tags" grep "Type.......:" \
					| awk -F'[()]' '{print $2}')
	fi
	# Remove useless extra
	tag_system="${tag_system// or compatible}"
	tag_system="${tag_system//-compatible Tracker}"
	tag_system="${tag_system// (compatibility export)}"
	tag_system="${tag_system// (test build)}"
	# Duration
	duration_record=$(< "$glouglou_cache_tags" grep "Duration." \
						| awk '{print $2}')
	if [[ "$duration_record" == *":"* ]]; then
		minute=$(echo "$duration_record" \
				| awk -F ":" '{print $1}' \
				| sed 's/^0*//' )
		second=$(echo "$duration_record" \
				| awk -F ":" '{print $2}' \
				| awk '{print int($1+0.5)}' | sed 's/^0*//')
		if [[ -n "$minute" ]]; then
			minute=$((minute*60))
		fi
		tag_total_duration=$((minute+second))
	else
		tag_total_duration=$(echo "$duration_record" | awk '{print int($1+0.5)}')
	fi

	tag_default "$file"
fi
}
tag_sap() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	strings -e S "$file" | head -15 > "$glouglou_cache_tags"

	tag_artist=$(< "$glouglou_cache_tags" grep -i -a "AUTHOR" \
				| awk -F'"' '$0=$2')
	if [[ "$tag_artist" = "<?>" ]]; then
		unset tag_artist
	fi
	tag_album=$(< "$glouglou_cache_tags" grep -i -a "NAME" \
				| awk -F'"' '$0=$2')
	if [[ "$tag_album" = "<?>" ]]; then
		unset tag_album
	fi

	tag_default "$file"

fi
}
tag_sc68() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	if [[ -n "$info68_bin" ]]; then

		"$info68_bin" -A "$file" > "$glouglou_cache_tags"

		tag_title=$(< "$glouglou_cache_tags" grep -i -a title: \
					| sed 's/^.*: //' \
					| head -1)
		if [[ "$tag_title" = "N/A" ]]; then
			unset tag_title
		fi
		tag_artist=$(< "$glouglou_cache_tags" grep -i -a artist: \
					| sed 's/^.*: //' \
					| head -1)
		if [[ "$tag_artist" = "N/A" ]]; then
			unset tag_artist
		fi

	fi

	tag_default "$file"

fi
}
tag_sid() {
local file
local ext

file="$1"
ext="${file##*.}"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	if [[ -n "$xxd_bin" ]] && [[ "$ext" = "sid" ]]; then

		tag_artist=$("$xxd_bin" -ps -s 0x36 -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0' \
					| iconv -f latin1 -t ascii//TRANSLIT \
					| awk '{$1=$1}1')
		if [[ "$tag_artist" = "<?>" ]]; then
			unset tag_artist
		fi
		tag_album=$("$xxd_bin" -ps -s 0x16 -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0' \
					| iconv -f latin1 -t ascii//TRANSLIT \
					| awk '{$1=$1}1')
		if [[ "$tag_album" = "<?>" ]]; then
			unset tag_album
		fi

	fi

	tag_default "$file"

fi
}
tag_spc() {
local file
local spc_duration
local spc_fading
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	if [[ -n "$xxd_bin" ]]; then

		tag_title=$("$xxd_bin" -ps -s 0x0002Eh -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
		tag_artist=$("$xxd_bin" -ps -s 0x000B1h -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
		tag_album=$("$xxd_bin" -ps -s 0x0004Eh -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0')

		spc_duration=$(xxd -ps -s 0x000A9h -l 3 "$file" \
						| xxd -r -p \
						| tr -d '\0' \
						| sed 's/^0*//')
		spc_fading=$(xxd -ps -s 0x000ACh -l 5 "$file" \
					| xxd -r -p \
					| tr -d '\0' \
					| sed 's/^0*//')
		# Correction if empty, or not an integer
		if [[ -z "$spc_duration" ]] || ! [[ "$spc_duration" =~ ^[0-9]*$ ]]; then
			spc_duration="0"
		fi
		if [[ -z "$spc_fading" ]] || ! [[ "$spc_fading" =~ ^[0-9]*$ ]]; then
			spc_fading="0"
		fi
		spc_fading=$((spc_fading/1000))
		tag_total_duration=$((spc_duration+spc_fading))

	fi

	tag_default "$file"

fi
}
tag_vgm() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	if [[ -n "$vgm_tag_bin" ]]; then

		"$vgm_tag_bin" -ShowTag8 "$file" > "$glouglou_cache_tags"

		tag_title=$(sed -n 's/Track Title:/&\n/;s/.*\n//p' "$glouglou_cache_tags" \
					| awk '{$1=$1}1')
		tag_artist=$(sed -n 's/Composer:/&\n/;s/.*\n//p' "$glouglou_cache_tags" \
					| awk '{$1=$1}1')
		tag_album=$(sed -n 's/Game Name:/&\n/;s/.*\n//p' "$glouglou_cache_tags" \
					| awk '{$1=$1}1')
		tag_system=$(sed -n 's/System:/&\n/;s/.*\n//p' "$glouglou_cache_tags" \
					| awk '{$1=$1}1')

	fi

	tag_default "$file"

fi
}
tag_vgmstream() {
local file
local sample_duration
local samplerate
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	if [[ -n "$vgmstream_cli_bin" ]]; then

		"$vgmstream_cli_bin" -m "$file" > "$glouglou_cache_tags"

		tag_system=$(sed -n 's/encoding:/&\n/;s/.*\n//p' "$glouglou_cache_tags" \
					| awk '{$1=$1}1')
		# Duration
		sample_duration=$(< "$glouglou_cache_tags" grep "play duration:" \
							| awk '{print $3}')
		samplerate=$(< "$glouglou_cache_tags" grep "sample rate:" \
					| awk '{print $3}')
		tag_total_duration=$(echo "scale=4;$sample_duration/$samplerate" \
							| bc \
							| awk '{print int($1+0.5)}')

	fi

	tag_default "$file"

fi
}
tag_xmp() {
local file
local duration_record
local minute
local second
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	"$xmp_bin" --load-only "$file" \
		&> "$glouglou_cache_tags"

	tag_title=$(< "$glouglou_cache_tags" grep "Module name" \
				| awk -F': ' '{print $NF}' \
				| awk '{$1=$1};1')
	tag_system=$(< "$glouglou_cache_tags" grep "Module type" \
				| awk -F': ' '{print $NF}' \
				| awk '{$1=$1};1')

	# Duration
	duration_record=$(< "$glouglou_cache_tags" grep "Duration" \
						| awk -F ":" '{print $2}')
	duration_record="${duration_record//s/}"
	if [[ "$duration_record" == *"min"* ]]; then
		minute=$(echo "$duration_record" \
				| awk -F "min" '{print $1}' \
				| sed 's/^0*//' )
		second=$(echo "$duration_record" \
				| awk -F "min" '{print $2}' \
				| awk '{print int($1+0.5)}' \
				| sed 's/^0*//')
		if [[ -n "$minute" ]]; then
			minute=$((minute*60))
		fi
		tag_total_duration=$((minute+second))
	fi

	tag_default "$file"
fi
}
tag_xsf() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]] \
&& [[ -z "$vgmfdb_id" ]]; then

	strings -e S "$file" \
		| tr -cd '\11\12\15\40-\176' \
		| sed -n '/TAG/,$p' > "$glouglou_cache_tags"

	tag_title=$(< "$glouglou_cache_tags" grep -i -a title= | awk -F'=' '$0=$NF')
	tag_artist=$(< "$glouglou_cache_tags" grep -i -a artist= | awk -F'=' '$0=$NF')
	tag_album=$(< "$glouglou_cache_tags" grep -i -a game= | awk -F'=' '$0=$NF')
	tag_total_duration=$(< "$glouglou_cache_tags" grep -i -a length= \
						| awk -F'=' '$0=$NF' \
						| awk -F '.' 'NF > 1 { printf "%s", $1; exit } 1' \
						| awk -F":" '{ print ($1 * 60) + $2 }' \
						| tr -d '[:space:]')

	tag_default "$file"

fi
}
# Usage
usage() {
cat <<- EOF
glouglou - <https://github.com/Jocker666z/glouglou>
Bad bash script for no brain, also play audio/vgm/chiptune in shuffle.

Usage: glouglou [options]
                                   Without option inplace recursively search/play files.
  -h|--help                        Display this help.
  -p|--publish_tags                Publish tags in text file > $glouglou_tags.

 Playlist manipulation:
  -c|--classic                     Playlist in alphabetical order.
  -e|--exclude "pattern"           Exclude files contain pattern.
  --exclude_conf_add "pattern"     Add exclude pattern in config.
  --exclude_conf_replace "pattern" Replace all exclude pattern in config.
  --exclude_conf_list              See exclude pattern in config.
  --exclude_conf_remove            Remove all exclude pattern in config.
  --exclude_ignore                 Ignore exclude in config.
  -f|--filter "pattern"            Select only files contain pattern.
  -i|--input <directory>           Target search directory.
  -r|--repeat_off                  No repeat.

   -e, --exclude_conf, -f are multi-word: "pattern one"
   -e, --exclude_conf, -f are also multi-pattern: "pattern0|pattern 1"
   -i is cumulative: -i <dir0> -i <dir1> ...

 VGM Files Database for tags:
  --vgmfdb                         Use vgmfdb tag instead glouglou extract.

 Beets database in playlist:
  -b|--beet "pattern"              Select only a pattern in Beets database.
  -be|--beet_exclusive             Use only Beets database.

   -b is cumulative & multi-word: -b "pattern0" -b "pattern 1" ...

 ListenBrainz:
  -s|--scrobb                      Use ListenBrainz scrobber.
  -t|--token <token>               Register your ListenBrainz token.
EOF
}
# Dependencies test
player_dependency_test() {
if [[ -z "$adplay_bin" ]] \
&& [[ -z "$cvlc_bin" ]] \
&& [[ -z "$ffplay_bin" ]] \
&& [[ -z "$fluidsynth_bin" ]] \
&& [[ -z "$gsf2wav_bin" ]] \
&& [[ -z "$mpv_bin" ]] \
&& [[ -z "$openmpt123_bin" ]] \
&& [[ -z "$sc68_bin" ]] \
&& [[ -z "$sidplayfp_bin" ]] \
&& [[ -z "$simple_mdx2wav_bin" ]] \
&& [[ -z "$spc2wav_bin" ]] \
&& [[ -z "$timidity_bin" ]] \
&& [[ -z "$uade123_bin" ]] \
&& [[ -z "$vgmplay_bin" ]] \
&& [[ -z "$vgmstream123_bin" ]] \
&& [[ -z "$xmp_bin" ]] \
&& [[ -z "$zxtune123_bin" ]]; then
	echo_error "glouglou was breaked, none dependencies are met:"
	printf '  %s\n' "${player_dependency[@]}" >&2
	exit
fi
}
# Populate vgm array
search_blacklist() {
local old_play_blacklist

set_play_blacklist() {
play_blacklist=$(< "$glouglou_config_file" grep "play_blacklist=" \
					| cut -d'=' -f2-)
}

print_blacklist() {
echo "${play_blacklist}" \
	| tr "|" "\n" \
	| awk '{print " * " $0}'
}

if [[ -n "$exclude_conf_replace" ]] \
|| [[ -n "$exclude_conf_add" ]]; then

	# Set current blacklist in config
	set_play_blacklist

	# Store old play_blacklist
	old_play_blacklist="$play_blacklist"

	# Merge current & Input
	if [[ -n "$exclude_conf_replace" ]]; then
		play_blacklist="${exclude_conf_replace}"
	elif [[ -n "$exclude_conf_add" ]]; then
		play_blacklist="${play_blacklist}|${exclude_conf_add}"
	fi

	# Remove duplicate pattern & sort
	play_blacklist=$(echo "$play_blacklist" \
						|  tr '|' '\n' \
						| sort -u \
						| grep . \
						| tr '\n' '|')

	# If exist remove lead |
	if [[ "${play_blacklist::1}" = "|" ]]; then
		play_blacklist="${play_blacklist:1}"
	fi

	# If exist remove end |
	if [[ "${play_blacklist: -1}" = "|" ]]; then
		play_blacklist="${play_blacklist::-1}"
	fi

	# Write in config if different
	if [[ "$old_play_blacklist" != "$play_blacklist" ]]; then
		sed -i "s/\(play_blacklist *= *\).*/\1${play_blacklist//\\/\\\\}/" "$glouglou_config_file"
		echo "The entry has been registered in your play/search blacklist, containt:"
	else
		echo "The entry is identical to the current pattern:"
	fi

	print_blacklist
fi

# If print blacklist
if [[ -n "$exclude_conf_list" ]]; then
	set_play_blacklist

	if [[ -z "$play_blacklist" ]]; then
		echo "You have no play/search blacklist."
	else
		echo "You're current patterns play/search blacklist:"
		echo "Config raw: ${play_blacklist}"
		print_blacklist
	fi
fi

# If no update blacklist = set current
set_play_blacklist
}
search_vgm() {
local input_realpath
local oldIFS

oldIFS="$IFS"

# Search file with find
if [[ -z "$beet_exclusive" ]]; then
	# If no input dir
	if ! (( "${#input_dir[@]}" )); then
		input_dir=( "$PWD" )
	fi

	# Change IFS
	IFS=$'\n'

	for input in "${input_dir[@]}"; do
		input_realpath=$(realpath "$input")
		lst_vgm+=( $(find "${input_realpath}" -type f -regextype posix-egrep -iregex '.*\.('$ext_allplay')$') )
	done

	# Reset IFS
	IFS="$oldIFS"
fi

# Search file in beets
if [[ -n "$beet_pattern" ]]; then
	for input in "${beet_pattern[@]}"; do
		mapfile -t -O "${#lst_beet[@]}" lst_beet < <("$beet_bin" ls "$input" -p)
	done

	# Merge search array 
	lst_vgm=( "${lst_vgm[@]}" "${lst_beet[@]}" )

	# Remove duplicate if find + beets
	if [[ -z "$beet_exclusive" ]]; then
		mapfile -t lst_vgm < <(printf '%s\n' "${lst_vgm[@]}" \
								| sort -u)
	fi
fi

# Filter by filename include path
if (( "${#lst_vgm[@]}" )); then
	# Sort type: shuffle or alphabetical
	if [[ -n "$classic_player" ]]; then
		sort_type=('sort' '-V')
	else
		sort_type=('shuf')
	fi

	# Unset play_blacklist if exclude_ignore=1
	if [[ -n "$exclude_ignore" ]]; then
		unset play_blacklist
	fi

	# Use exclude pattern list from config
	if [[ -n "$exclude_filter" ]] && [[ -n "$play_blacklist" ]]; then
		exclude_filter="${exclude_filter}|${play_blacklist}"
	elif [[ -z "$exclude_filter" ]] && [[ -n "$play_blacklist" ]]; then
		exclude_filter="${play_blacklist}"
	fi

	# Change IFS
	IFS=$'\n'

	# Final playlist array
	## If no patern
	if [[ -z "$input_filter" ]] && [[ -z "$exclude_filter" ]]; then
		lst_vgm=( $(printf '%s\n' "${lst_vgm[@]}" \
								| "${sort_type[@]}") )
	## If -f = select only files pattern
	elif [[ -n "$input_filter" ]] && [[ -z "$exclude_filter" ]]; then
		input_filter="${input_filter//||/|}"
		lst_vgm=( $(printf '%s\n' "${lst_vgm[@]}" \
								| grep -E -i "$input_filter" \
								| "${sort_type[@]}") )
	## If -e = exclude files pattern
	elif [[ -z "$input_filter" ]] && [[ -n "$exclude_filter" ]]; then
		exclude_filter="${exclude_filter//||/|}"
		lst_vgm=( $(printf '%s\n' "${lst_vgm[@]}" \
								| grep --text -E -i -v "$exclude_filter" \
								| "${sort_type[@]}") )

	## If -f -e = select & exclude pattern
	elif [[ -n "$input_filter" ]] && [[ -n "$exclude_filter" ]]; then
		exclude_filter="${exclude_filter//||/|}"
		input_filter="${input_filter//||/|}"
		lst_vgm=( $(printf '%s\n' "${lst_vgm[@]}" \
								| grep -E -i -v "$exclude_filter" \
								| grep -E -i "$input_filter" \
								| "${sort_type[@]}") )
	fi

	# Reset IFS
	IFS="$oldIFS"

fi
}
# Play loop
main_loop () {
local _progress_bar
local _timer_start
local _total_time_formated
local _timer_stop
local _diff_in_s
local _elapsed_time_formated
local _progress
local _done
local _left
local i
local ext
local uade_test_result
local vgmstream_test_result
local zxtune_test_result

# For debug
#set -x
#printf '%s\n' "${lst_vgm[@]}"
#exit

force_quit() {
_progress_bar="$1"

if [[ "$_progress_bar" = "progress" ]] && [[ -n "$tag_total_duration" ]]; then
	# Remove previous line with total duration if progress
	echo
	printf '\e[A\e[K'
	# Get start time
	_timer_start=$(date +%s)
	_total_time_formated=$(printf '%02d:%02d\n' $((tag_total_duration%3600/60)) $((tag_total_duration%60)))
fi

while true; do
	read -t0.1 -rsn1 k
	if [[ "$k" = "q" ]]; then
		kill -9 "$Player_PID" &>/dev/null
		break
	fi
	if ! ps -p $Player_PID > /dev/null; then
		break
	fi

	# Progress bar
	if [[ "$_progress_bar" = "progress" ]] \
	&& [[ -n "$tag_total_duration" ]]; then
		_timer_stop=$(date +%s)
		_diff_in_s=$(( _timer_stop - _timer_start ))
		_elapsed_time_formated=$(printf '%02d:%02d\n' $((_diff_in_s%3600/60)) $((_diff_in_s%60)))
		_progress=$(( ( ((_diff_in_s * 100) / tag_total_duration) * 100 ) / 100 ))
		_done=$(( (_progress * 4) / 10 ))
		_left=$(( 40 - _done ))
		_done=$(printf "%${_done}s")
		_left=$(printf "%${_left}s")

		echo -e -n "\r\e[0K]${_done// /▇}${_left// / }[ ${_elapsed_time_formated}/${_total_time_formated}"
	fi
done
}
print_tag() {
player="$1"

echo "$1"
if [[ -n "$tag_title" ]]; then
	echo "Title: $tag_title"
fi
if [[ -n "$tag_artist" ]]; then
	echo "Artist: $tag_artist"
fi
if [[ -n "$tag_album" ]]; then
	echo "Album: $tag_album"
fi
if [[ -n "$tag_total_duration" ]]; then
	echo "Duration: ${tag_total_duration}s"
fi
}

if (( "${#lst_vgm[@]}" )); then
	while true
	do
		for i in "${!lst_vgm[@]}"; do
			# For final stat & playlist display
			vgm_counter=$(( vgm_counter + 1 ))

			# Try to get tag from vgmfdb
			vgmfdb_tags "${lst_vgm[i]}"

			# Playlist display
			echo_playlist "$i"

			# For test ext
			ext="${lst_vgm[i]##*.}"
			ext="${ext,,}"

			# Play
			if echo "|${ext_multi_filter}|" | grep -i "|${ext}|" &>/dev/null; then
				# SAP files
				if [[ "$ext" = "sap" ]] && [[ -n "$vgmstream_cli_bin" ]]; then
					vgmstream_test_result=$("$vgmstream_cli_bin" -m "${lst_vgm[i]}" 2>/dev/null)
					if [[ "${#vgmstream_test_result}" -gt "0" ]]; then
						tag_vgmstream "${lst_vgm[i]}"
						publish_tags "vgmstream" "${lst_vgm[i]}"
						"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"
						listenbrainz_submit "vgmstream"
					fi
				fi
				if [[ "$ext" = "sap" ]] && [[ -n "$zxtune123_bin" ]] \
				&& [[ "${#vgmstream_test_result}" = "0" ]]; then
					zxtune_test_result=$("$zxtune123_bin" "${lst_vgm[i]}" --null 2>&1)
					if [[ "${#zxtune_test_result}" -gt "0" ]]; then
						tag_sap "${lst_vgm[i]}"
						publish_tags "ZXTune" "${lst_vgm[i]}"
						"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
						listenbrainz_submit "ZXTune"
					fi
				fi
				# SFX files
				if [[ "$ext" = "sfx" ]] && [[ -n "$uade123_bin" ]]; then
					uade_test_result=$("$uade123_bin" -g "${lst_vgm[i]}" 2>/dev/null)
					if [[ "${#uade_test_result}" -gt "0" ]]; then
						tag_default "${lst_vgm[i]}"
						publish_tags "UADE" "${lst_vgm[i]}"
						"$uade123_bin" "${lst_vgm[i]}"
						listenbrainz_submit "UADE"
					fi
				fi
				if [[ "$ext" = "sfx" ]] && [[ -n "$vgmstream_cli_bin" ]] \
				&& [[ "${#uade_test_result}" = "0" ]]; then
					vgmstream_test_result=$("$vgmstream_cli_bin" -m "${lst_vgm[i]}" 2>/dev/null)
					if [[ "${#vgmstream_test_result}" -gt "0" ]]; then
						tag_vgmstream "${lst_vgm[i]}"
						publish_tags "vgmstream" "${lst_vgm[i]}"
						"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"
						listenbrainz_submit "vgmstream"
					fi
				fi
				# SND files
				if [[ "$ext" = "snd" ]] && [[ -n "$vgmstream_cli_bin" ]]; then
					vgmstream_test_result=$("$vgmstream_cli_bin" -m "${lst_vgm[i]}" 2>/dev/null)
					if [[ "${#vgmstream_test_result}" -gt "0" ]]; then
						tag_vgmstream "${lst_vgm[i]}"
						publish_tags "vgmstream" "${lst_vgm[i]}"
						"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"
						listenbrainz_submit "vgmstream"
					elif [[ -n "$sc68_bin" ]]; then
						tag_sc68 "${lst_vgm[i]}"
						publish_tags "sc68" "${lst_vgm[i]}"
						"$sc68_bin" "${lst_vgm[i]}" --track=all --stdout \
							| "$aplay_bin" -r 44100 -c 2 -f S16_LE --quiet 2>/dev/null &
						Player_PID="$!"
						force_quit
						listenbrainz_submit "sc68"
					fi
				fi

			elif echo "|${ext_adplay}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$adplay_bin" ]]; then
				tag_default "${lst_vgm[i]}"
				publish_tags "AdPlay" "${lst_vgm[i]}"
				"$adplay_bin" "${lst_vgm[i]}" -v -r -o &
				Player_PID="$!"
				force_quit
				listenbrainz_submit "AdPlay"

			elif echo "|${ext_common}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_common "${lst_vgm[i]}"
				if [[ -n "$mpv_bin" ]]; then
					publish_tags "MPV" "${lst_vgm[i]}"
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--rebase-start-time=no \
						--volume=100 \
						--replaygain=album \
						--display-tags=Album,Date,Year,Artist,Artists,Composer,Track,Title,Genre
					listenbrainz_submit "MPV"
				elif [[ -n "$cvlc_bin" ]]; then
					publish_tags "VLC" "${lst_vgm[i]}"
					print_tag "VLC"
					"$cvlc_bin" --play-and-exit -q "${lst_vgm[i]}" &>/dev/null &
					Player_PID="$!"
					force_quit "progress"
					listenbrainz_submit "VLC"
				elif [[ -n "$ffplay_bin" ]]; then
					publish_tags "ffplay" "${lst_vgm[i]}"
					"$ffplay_bin" -hide_banner -showmode 0 \
						-vn -autoexit -volume 100 "${lst_vgm[i]}" &
					Player_PID="$!"
					force_quit
					listenbrainz_submit "ffplay"
				fi

			elif echo "|${ext_gba}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_xsf "${lst_vgm[i]}"
				if [[ -n "$gsf2wav_bin" ]]; then
					publish_tags "gsf2wav" "${lst_vgm[i]}"
					print_tag "gsf2wav"
					"$gsf2wav_bin" "${lst_vgm[i]}" /dev/stdout 2>/dev/null \
						| "$aplay_bin" --quiet  &>/dev/null &
					Player_PID="$!"
					force_quit "progress"
					listenbrainz_submit "gsf2wav"
				elif [[ -n "$zxtune123_bin" ]]; then
					publish_tags "ZXTune" "${lst_vgm[i]}"
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune"
				fi

			elif echo "|${ext_sc68}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$sc68_bin" ]]; then
				tag_sc68 "${lst_vgm[i]}"
				publish_tags "sc68" "${lst_vgm[i]}"
				"$sc68_bin" "${lst_vgm[i]}" --track=all --stdout \
					| "$aplay_bin" -r 44100 -c 2 -f S16_LE --quiet 2>/dev/null &
				Player_PID="$!"
				force_quit
				listenbrainz_submit "sc68"

			elif echo "|${ext_sidplayfp}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_sid "${lst_vgm[i]}"
				if [[ -n "$sidplayfp_bin" ]]; then
					publish_tags "sidplayfp" "${lst_vgm[i]}"
					"$sidplayfp_bin" "${lst_vgm[i]}" -v -s --digiboost
					listenbrainz_submit "sidplayfp"
				elif [[ -n "$zxtune123_bin" ]] && [[ "$ext" = "sid" ]]; then
					publish_tags "ZXTune" "${lst_vgm[i]}"
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune"
				fi

			elif echo "|${ext_simple_mdx2wav}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_default "${lst_vgm[i]}"
				if [[ -n "$simple_mdx2wav_bin" ]]; then
					print_tag "simple_mdx2wav"
					publish_tags "simple_mdx2wav" "${lst_vgm[i]}"
					"$simple_mdx2wav_bin" -i "${lst_vgm[i]}" -o /dev/stdout 2>/dev/null \
						| "$aplay_bin" --quiet  &>/dev/null &
					Player_PID="$!"
					force_quit
					listenbrainz_submit "simple_mdx2wav"
				fi

			elif echo "|${ext_snes}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_spc "${lst_vgm[i]}"
				if [[ -n "$spc2wav_bin" ]]; then
					publish_tags "spc2wav" "${lst_vgm[i]}"
					"$spc2wav_bin" "${lst_vgm[i]}" /dev/stdout \
						| "$aplay_bin" --quiet  &>/dev/null &
					Player_PID="$!"
					force_quit "progress"
					listenbrainz_submit "spc2wav"
				elif [[ -n "$zxtune123_bin" ]]; then
					publish_tags "ZXTune" "${lst_vgm[i]}"
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune"
				elif [[ -n "$mpv_bin" ]]; then
					publish_tags "MPV" "${lst_vgm[i]}"
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--rebase-start-time=no \
						--volume=100 \
						--term-osd-bar=yes \
						--display-tags=Artists,Composer,Album,Track,Title,Date,Year,Artist,Genre
					listenbrainz_submit "MPV"
				fi

			elif echo "|${ext_midi}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_default "${lst_vgm[i]}"
				if [[ -n "$timidity_bin" ]]; then
					publish_tags "TiMidity++" "${lst_vgm[i]}"
					"$timidity_bin" "${lst_vgm[i]}" -in --volume=100
					listenbrainz_submit "TiMidity++"
				elif [[ -n "$fluidsynth_bin" ]]; then
					publish_tags "FluidSynth" "${lst_vgm[i]}"
					"$fluidsynth_bin" "${lst_vgm[i]}"
					listenbrainz_submit "FluidSynth"
				fi

			elif echo "|${ext_tracker}|" | grep -i "|${ext}|" &>/dev/null; then
				if [[ -n "$openmpt123_bin" ]]; then
					tag_openmpt "${lst_vgm[i]}"
					publish_tags "openmpt123" "${lst_vgm[i]}"
					"$openmpt123_bin" --terminal-width "$term_width" \
						--terminal-height "$term_height" --no-details \
						"${lst_vgm[i]}"
					listenbrainz_submit "openmpt123"
				elif [[ -n "$xmp_bin" ]]; then
					tag_xmp "${lst_vgm[i]}"
					publish_tags "XMP" "${lst_vgm[i]}"
					"$xmp_bin" "${lst_vgm[i]}"
					listenbrainz_submit "XMP"
				elif [[ -n "$zxtune123_bin" ]]; then
					tag_default "${lst_vgm[i]}"
					publish_tags "ZXTune" "${lst_vgm[i]}"
					"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
					listenbrainz_submit "ZXTune"
				elif [[ -n "$mpv_bin" ]]; then
					tag_default "${lst_vgm[i]}"
					publish_tags "MPV" "${lst_vgm[i]}"
					"$mpv_bin" "${lst_vgm[i]}" --terminal --no-video \
						--rebase-start-time=no \
						--volume=100 \
						--term-osd-bar=yes \
						--display-tags=Artists,Composer,Album,Track,Title,Date,Year,Artist,Genre
					listenbrainz_submit "MPV"
				fi

			elif echo "|${ext_uade}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$uade123_bin" ]]; then
				tag_default "${lst_vgm[i]}"
				publish_tags "UADE" "${lst_vgm[i]}"
				"$uade123_bin" "${lst_vgm[i]}"
				listenbrainz_submit "UADE"

			elif echo "|${ext_vgmstream}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$vgmstream123_bin" ]]; then
				tag_vgmstream "${lst_vgm[i]}"
				publish_tags "vgmstream" "${lst_vgm[i]}"
				"$vgmstream123_bin" -D alsa -m "${lst_vgm[i]}"
				listenbrainz_submit "vgmstream"

			elif echo "|${ext_vgmplay}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$vgmplay_bin" ]]; then
				if [[ "$ext" != "s98" ]]; then
					tag_vgm "${lst_vgm[i]}"
				else
					tag_default "${lst_vgm[i]}"
				fi
				publish_tags "VGMPlay" "${lst_vgm[i]}"
				"$vgmplay_bin" "${lst_vgm[i]}"
				listenbrainz_submit "VGMPlay"

			elif echo "|${ext_wildmidi}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$wildmidi_bin" ]]; then
				tag_default "${lst_vgm[i]}"
				publish_tags "WildMIDI" "${lst_vgm[i]}"
				"$wildmidi_bin" -s -b "${lst_vgm[i]}" &
				Player_PID="$!"
				force_quit
				listenbrainz_submit "WildMIDI"

			elif echo "|${ext_xmp}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$xmp_bin" ]]; then
				tag_xmp "${lst_vgm[i]}"
				publish_tags "XMP" "${lst_vgm[i]}"
				"$xmp_bin" "${lst_vgm[i]}"
				listenbrainz_submit "XMP"

			elif echo "|${ext_zxtune}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$zxtune123_bin" ]]; then
				if echo "|${ext_zxtune_xsf}|" | grep -i "|${ext}|" &>/dev/null; then
					tag_xsf "${lst_vgm[i]}"
				else
					tag_default "${lst_vgm[i]}"
				fi
				publish_tags "ZXTune" "${lst_vgm[i]}"
				"$zxtune123_bin" --alsa --file "${lst_vgm[i]}"
				listenbrainz_submit "ZXTune"
			fi

			# Reset
			tag_reset

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
local time_formated

# Special case for ugly kill
kill -9 "$Player_PID" &>/dev/null

# Duration fomarted
time_formated="$((SECONDS/3600))h$((SECONDS%3600/60))m$((SECONDS%60))s"

# Print stats
echo
echo_separator
echo "glouglou was exited."
echo "You have listened ${vgm_counter}/${#lst_vgm[@]} tracks".
echo "The duration of your crazy listening was ${time_formated}".

# Proper exit
listenbrainz_submit "glouglou"
rm "$glouglou_cache_tags" &>/dev/null
rm "$glouglou_tags" &>/dev/null
rm "$glouglou_cover" &>/dev/null
stty sane
exit
}

# Trap
trap 'kill_stat' INT TERM SIGHUP

# Dependencies
player_dependency=(
	'adplay'
	'cvlc'
	'ffplay'
	'fluidsynth'
	'gsf2wav + aplay'
	'mpv'
	'openmpt123'
	'sc68 + aplay'
	'sidplayfp'
	'simple_mdx2wav + aplay'
	'spc2wav + aplay'
	'timidity'
	'uade123'
	'vgmstream123'
	'vgmplay'
	'xmp'
	'zxtune123'
	)

# Covers
cover_name=(
	'cover.jpg'
	'cover.png'
	'cover.webp'
	'folder.jpg'
	'folder.png'
	'folder.webp'
	'front.jpg'
	'front.png'
	'front.webp'
	'thumb.jpg'
	'thumb.png'
	'thumb.webp'
	'AlbumArt.jpg'
	'AlbumArt.png'
	'AlbumArt.webp'
	'AlbumArtSmall.jpg'
	'AlbumArtSmall.webp'
	'AlbumArtSmall.png'
	)

# Paths
export PATH=$PATH:/home/$USER/.local/bin
glouglou_config_dir="/home/$USER/.config/glouglou"
glouglou_config_file="/home/$USER/.config/glouglou/config"
glouglou_cache_tags="/tmp/glouglou-cache-tags"
glouglou_tags="/tmp/glouglou-tags"
glouglou_cover="/tmp/glouglou-cover.png"
vgmfdb_database="/home/$USER/.config/vgmfdb/vgm.db"

# Type of files allowed by player
ext_adplay="adl|amd|bam|cff|cmf|d00|dfm|ddt|dmo|dtm|got|hsc|hsq|imf|laa|ksm|m|mdi|mtk|rad|rol|sdb|sqx|tm|wlf|xms|xsm"
ext_gba="gsf|minigsf"
ext_common="aac|ac3|aif|aiff|ape|flac|m4a|mp2|mp3|mpc|ogg|opus|wav|wv|wma"
ext_sc68="sc68|sndh"
ext_sidplayfp="sid|prg"
ext_simple_mdx2wav="mdx"
ext_snes="spc"
ext_midi="mid"
ext_multi_filter="sap|sfx|snd"
ext_tracker="it|dsm|mod|mo3|mptm|s3m|stm|stp|plm|umx|xm"
ext_uade="aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|gmc|hot|fc13|fc14|med|mug|np3|okt|pru2|rk|s7g|smus|soc|p4x|tiny|tw"
ext_vgmstream_0_c="22k|8svx|aax|acb|acm|ad|ads|adp|adpcm|adx|aix|akb|asf|apc|at3|at9|awb|bcstm|bcwav|bfstm|bfwav|bigrp|bik|brstm|bwav|cfn|ckd|cmp|csa|csb|csmp|cps"
ext_vgmstream_d_n="dsp|dvi|fsb|gcm|genh|h4m|hca|hps|ifs|imc|int|isd|ivs|kma|ks|kvs|lac3|lasf|lbin|lmp3|logg|lopus|lrmh|lstm|lwav|mab|mca|mic|msf|mus|musx|nlsd|nop|npsf"
ext_vgmstream_o_z="ogv|oma|ras|rsd|rsnd|rws|sad|scd|sgd|ss2|str|strm|stx|svag|p04|p08|p16|pcm|psb|thp|trk|trs|txtp|ulw|vag|var|vas|vds|vgmstream|vig|voi|way|wem|xa|xai|xma|xmd|xnb|xvag|xwv"
ext_vgmstream="${ext_vgmstream_0_c}|${ext_vgmstream_d_n}|${ext_vgmstream_o_z}"
ext_vgmplay="s98|vgm|vgz"
ext_wildmidi="hmi|hmp|xmi"
ext_xmp="669|amf|dbm|digi|dsym|far|gz|mdl|musx|psm"
ext_zxtune_various="ay|ams|dmf|dtt|hvl|rmt|v2m|vt2|vtx|xrns|ym"
ext_zxtune_xsf="2sf|dsf|psf|psf2|mini2sf|minidsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_zxtune_zx_spectrum="asc|psc|pt1|pt2|pt3|sqt|stc|stp|tap|zxs"
ext_zxtune="${ext_zxtune_various}|${ext_zxtune_xsf}|${ext_zxtune_zx_spectrum}"

# Setup
aplay_bin
adplay_bin
cvlc_bin
ffplay_bin
fluidsynth_bin
gsf2wav_bin
mpv_bin
openmpt123_bin
sc68_bin
sidplayfp_bin
simple_mdx2wav_bin
spc2wav_bin
timidity_bin
uade123_bin
vgmstream123_bin
vgmplay_bin
wildmidi_bin
xmp_bin
zxtune123_bin
multi_depend
player_dependency_test
glouglou_config
listenbrainz_status
listenbrainz_token
search_blacklist
various_bin

# Arguments
while [[ $# -gt 0 ]]; do
	glouglou_arg="$1"
	case "$glouglou_arg" in
		-b|--beet)
			if [[ -z "$beet_bin" ]]; then
				echo_error "glouglou was breaked."
				echo_error "beets must be installed for use beets database."
				exit
			fi
			shift
			beet_pattern+=( "$1" )
		;;
		-be|--beet_exclusive)
			if [[ -z "$beet_bin" ]]; then
				echo_error "glouglou was breaked."
				echo_error "beets must be installed for use beets database."
				exit
			fi
			beet_exclusive="1"
		;;
		-c|--classic)
			classic_player="1"
		;;
		-e|--exclude)
			shift
			exclude_filter="$1"
		;;
		--exclude_conf_add)
			shift
			exclude_conf_add="$1"
			if [[ -z "$exclude_conf_add" ]]; then
				echo_error "glouglou was breaked."
				echo_error "Exclude pattern must be filled."
				exit
			else
				search_blacklist
			fi
			exit
		;;
		--exclude_conf_replace)
			shift
			exclude_conf_replace="$1"
			if [[ -z "$exclude_conf_replace" ]]; then
				echo_error "glouglou was breaked."
				echo_error "Exclude pattern must be filled."
				exit
			else
				search_blacklist
			fi
			exit
		;;
		--exclude_conf_list)
			exclude_conf_list="1"
			search_blacklist
			exit
		;;
		--exclude_conf_clean)
			sed -i "s/\(play_blacklist *= *\).*/\1/" "$glouglou_config_file"
			echo "Your play/search blacklist has been deleted."
			exit
		;;
		--exclude_ignore)
			exclude_ignore="1"
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
			elif [[ -n "$listenbrainz_status" ]]; then
				listenbrainz_scrobb="1"
				new_submit_time=$(date +%s)
			fi
		;;
		-p|--publish_tags)
			publish_tags="1"
		;;
		-t|--token)
			shift
			if [[ -n "$listenbrainz_status" ]]; then
				listenbrainz_register="$1"
				listenbrainz_token
			else
				echo_error "glouglou was breaked."
				echo_error "ListenBrainz server is unreachable"
			fi
			exit
		;;
		--vgmfdb)
			if [[ -f "$vgmfdb_database" ]]; then
				vgmfdb="1"
			else
				echo_error "glouglou was breaked."
				echo_error "vgmfdb database not present in $vgmfdb_database"
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

# $ext_allplay contruction depend -> player_dependency_test
ext_allplay_raw="${ext_adplay}| \
				 ${ext_gba}| \
				 ${ext_common}| \
				 ${ext_sc68}| \
				 ${ext_sidplayfp}| \
				 ${ext_simple_mdx2wav}| \
				 ${ext_snes}| \
				 ${ext_midi}| \
				 ${ext_multi_filter}| \
				 ${ext_tracker}| \
				 ${ext_uade}| \
				 ${ext_vgmplay}| \
				 ${ext_vgmstream}| \
				 ${ext_vgmplay}| \
				 ${ext_wildmidi}| \
				 ${ext_xmp}| \
				 ${ext_zxtune}"
ext_allplay=$(echo "${ext_allplay_raw//[[:blank:]]/}" | tr -s '|')
search_vgm
# Play
main_loop

exit
