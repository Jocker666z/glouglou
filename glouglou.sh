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
if [[ ! -d "$glouglou_config_dir" ]]; then
	mkdir "$glouglou_config_dir"
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

# info68
bin_name="info68"
system_bin_location=$(command -v $bin_name)
if [[ -n "$system_bin_location" ]]; then
	info68_bin="$system_bin_location"
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

	# Prevent repeat scrobb, limit to 10s
	last_submit_time=$(date +%s)
	submit_diff_in_s=$(( last_submit_time - new_submit_time ))

	if [[ "$submit_diff_in_s" -gt "10" ]]; then
	
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
						"media_player": "'"$player"'",
						"submission_client": "glouglou",
						"release_mbid": "'"$tag_brainz_album_id"'",
						"artist_mbids": ["'"$tag_brainz_artist_id"'"],
						"recording_mbid": "",
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
	unset tag_brainz_artist_id
	unset tag_brainz_album_id
	unset tag_brainz_album_id
fi
}
tag_default() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]]; then

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

	# tag_sytem by files ext.
	shopt -s nocasematch

	# MIDI
	if [[ "${file##*.}" = "mid" ]]; then
		tag_system="MIDI"

	# sc68
	elif [[ "${file##*.}" = "sc68" ]]; then
		tag_system="SC 68000"

	# SAP
	elif [[ "${file##*.}" = "sap" ]]; then
		tag_system="Atari 8-bit"

	# SID
	elif [[ "${file##*.}" = "sid" ]] || [[ "${file##*.}" = "prg" ]]; then
		tag_system="Comomdore 64/128"

	# Tracker (uade)
	elif [[ "${file##*.}" = "bp" ]]; then
		tag_system="SoundMon 2.0"
	elif [[ "${file##*.}" = "cm" ]] || [[ "${file##*.}" = "rk" ]]; then
		tag_system="CustomMade"
	elif [[ "${file##*.}" = "dw" ]]; then
		tag_system="David Whittaker"
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
	elif [[ "${file##*.}" = "soc" ]]; then
		tag_system="Hippel-COSO"
	elif [[ "${file##*.}" = "tiny" ]]; then
		tag_system="Sonix Music Driver"
	elif [[ "${file##*.}" = "tw" ]]; then
		tag_system="Sound Images"

	# Tracker (zxtune)
	elif [[ "${file##*.}" = "rmt" ]]; then
		tag_system="Raster Music Tracker"
	elif [[ "${file##*.}" = "v2m" ]]; then
		tag_system="Farbrausch V2M"
	elif [[ "${file##*.}" = "xrns" ]]; then
		tag_system="Renoise"

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
	elif [[ "${file##*.}" = "dsf" ]]; then
		tag_system="Sega Dreamcast"
	fi
	shopt -u nocasematch

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
					| sed 's/^.*=//')
		tag_artist=$(< "$glouglou_cache_tags" \
					grep -E -i -a "^artist=|^TPE1=" \
					| sed 's/^.*=//')
		tag_album=$(< "$glouglou_cache_tags" \
					grep -E -i -a "^album=|^TALB=" \
					| sed 's/^.*=//')
		tag_total_duration=$(< "$glouglou_cache_tags" \
							grep "seconds" \
							| head -1 \
							| awk -F"seconds" '{print $1}' \
							| awk '{print $NF}' \
							| awk -F"." '{print $1}')
		tag_brainz_artist_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_ARTISTID=|^TXXX:MusicBrainz Artist Id=" \
								| sed 's/^.*=//')
		tag_brainz_album_id=$(< "$glouglou_cache_tags" \
								grep -E -i -a "^MUSICBRAINZ_ALBUMID=|^TXXX:MusicBrainz Artist Id=" \
								| sed 's/^.*=//')

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
			file_kbs=$(( 8 * $file_size / $tag_total_duration))
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
|| [[ -n "$publish_tags" ]]; then

	"$openmpt123_bin" --info "$file" \
		> "$glouglou_cache_tags"

	tag_title=$(< "$glouglou_cache_tags" grep "Title." \
				| awk -F'.: ' '{print $NF}' | awk '{$1=$1};1')
	tag_artist=$(< "$glouglou_cache_tags" grep "Artist." \
				| awk -F'.: ' '{print $NF}' | awk '{$1=$1};1')
	# Special trick, many mod not have artist
	if [[ -n "$tag_title" ]] && [[ -z "$tag_artist" ]]; then
		tag_artist=$(basename "${file%.*}")
	fi
	tag_system=$(< "$glouglou_cache_tags" grep "Tracker....:" \
				| awk -F'.: ' '{print $NF}' | awk '{$1=$1};1')

	# Duration
	duration_record=$(< "$glouglou_cache_tags" grep "Duration." \
						| awk '{print $2}')
	if [[ "$duration_record" == *":"* ]]; then
		minute=$(echo "$duration_record" | awk -F ":" '{print $1}' \
				| sed 's/^0*//' )
		second=$(echo "$duration_record" | awk -F ":" '{print $2}' \
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
|| [[ -n "$publish_tags" ]]; then

	strings -e S "$file" | head -15 > "$glouglou_cache_tags"

	tag_artist=$(< "$glouglou_cache_tags" grep -i -a "AUTHOR" | awk -F'"' '$0=$2')
	if [[ "$tag_artist" = "<?>" ]]; then
		unset tag_artist
	fi
	tag_album=$(< "$glouglou_cache_tags" grep -i -a "NAME" | awk -F'"' '$0=$2')
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
|| [[ -n "$publish_tags" ]]; then

	if [[ -n "$info68_bin" ]]; then

		"$info68_bin" -A "$file" > "$glouglou_cache_tags"

		tag_title=$(< "$glouglou_cache_tags" grep -i -a title: | sed 's/^.*: //' | head -1)
		if [[ -z "$tag_title" ]] \
		|| [[ "$tag_title" = "N/A" ]]; then
			unset tag_title
		fi
		tag_artist=$(< "$glouglou_cache_tags" grep -i -a artist: | sed 's/^.*: //' | head -1)
		if [[ -z "$tag_artist" ]] \
		|| [[ "$tag_artist" = "N/A" ]]; then
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
|| [[ -n "$publish_tags" ]]; then

	if [[ -n "$xxd_bin" ]] && [[ "$ext" = "sid" ]]; then

		tag_artist=$("$xxd_bin" -ps -s 0x36 -l 32 "$file" \
				| tr -d '[:space:]' | xxd -r -p | tr -d '\0' \
				| awk '{$1=$1}1')
		if [[ "$tag_artist" = "<?>" ]]; then
			unset tag_artist
		fi
		tag_album=$("$xxd_bin" -ps -s 0x16 -l 32 "$file" \
				| tr -d '[:space:]' | xxd -r -p | tr -d '\0' \
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
|| [[ -n "$publish_tags" ]]; then

	if [[ -n "$xxd_bin" ]]; then

		tag_title=$("$xxd_bin" -ps -s 0x0002Eh -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
		tag_artist=$("$xxd_bin" -ps -s 0x000B1h -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0')
		tag_album=$("$xxd_bin" -ps -s 0x0004Eh -l 32 "$file" \
					| tr -d '[:space:]' | xxd -r -p | tr -d '\0')

		spc_duration=$(xxd -ps -s 0x000A9h -l 3 "$file" \
						| xxd -r -p | tr -d '\0')
		spc_fading=$(xxd -ps -s 0x000ACh -l 5 "$file" \
					| xxd -r -p | tr -d '\0')
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

	tag_system="Super Nintendo / Super Famicom"
	tag_default "$file"

fi
}
tag_vgm() {
local file
file="$1"

if [[ -n "$listenbrainz_scrobb" ]] \
|| [[ -n "$publish_tags" ]]; then

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
|| [[ -n "$publish_tags" ]]; then

	if [[ -n "$vgmstream_cli_bin" ]]; then

		"$vgmstream_cli_bin" -m "$file" > "$glouglou_cache_tags"

		tag_system=$(sed -n 's/encoding:/&\n/;s/.*\n//p' "$glouglou_cache_tags" \
					| awk '{$1=$1}1')
		# Duration
		sample_duration=$(< "$glouglou_cache_tags" grep "play duration:" \
							| awk '{print $3}')
		samplerate=$(< "$glouglou_cache_tags" grep "sample rate:" \
							| awk '{print $3}')
		tag_total_duration=$(echo "scale=4;$sample_duration/$samplerate" | bc | awk '{print int($1+0.5)}')

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
|| [[ -n "$publish_tags" ]]; then

	"$xmp_bin" --load-only "$file" \
		&> "$glouglou_cache_tags"

	tag_title=$(< "$glouglou_cache_tags" grep "Module name" \
				| awk -F': ' '{print $NF}' | awk '{$1=$1};1')
	tag_system=$(< "$glouglou_cache_tags" grep "Module type" \
				| awk -F': ' '{print $NF}' | awk '{$1=$1};1')

	# Duration
	duration_record=$(< "$glouglou_cache_tags" grep "Duration" \
						| awk -F ":" '{print $2}')
	duration_record="${duration_record//s/}"
	if [[ "$duration_record" == *"min"* ]]; then
		minute=$(echo "$duration_record" | awk -F "min" '{print $1}' \
				| sed 's/^0*//' )
		second=$(echo "$duration_record" | awk -F "min" '{print $2}' \
				| awk '{print int($1+0.5)}' | sed 's/^0*//')
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
|| [[ -n "$publish_tags" ]]; then
	strings -e S "$file" | sed -n '/TAG/,$p' > "$glouglou_cache_tags"

	tag_title=$(< "$glouglou_cache_tags" grep -i -a title= | awk -F'=' '$0=$NF')
	tag_artist=$(< "$glouglou_cache_tags" grep -i -a artist= | awk -F'=' '$0=$NF')
	tag_album=$(< "$glouglou_cache_tags" grep -i -a game= | awk -F'=' '$0=$NF')
	tag_total_duration=$(< "$glouglou_cache_tags" grep -i -a length= | awk -F'=' '$0=$NF' \
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
                          Without option inplace recursively search files.
  -c|--classic            Playlist in alphabetical order
  -e|--exclude "pattern"  Exclude files contain pattern.
  -f|--filter "pattern"   Select only files contain pattern.
  -i|--input <directory>  Target search directory.
  -h|--help               Display this help.
  -r|--repeat_off         No repeat.
  -s|--scrobb             Use ListenBrainz scrobber.
  -p|--publish_tags       Publish tags in $glouglou_tags.
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
local uade_test_result
local vgmstream_test_result

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
			ext="${ext,,}"

			# Play
			if echo "|${ext_multi_filter}|" | grep -i "|${ext}|" &>/dev/null; then
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
						--display-tags=Album,Date,Year,Artist,Artists,Composer,Track,Title,Genre
					listenbrainz_submit "MPV"
				elif [[ -n "$ffplay_bin" ]]; then
					publish_tags "ffplay" "${lst_vgm[i]}"
					"$ffplay_bin" -hide_banner -showmode 0 \
						-autoexit -volume 100 "${lst_vgm[i]}" &
					Player_PID="$!"
					force_quit
					listenbrainz_submit "ffplay"
				fi

			elif echo "|${ext_gba}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_xsf "${lst_vgm[i]}"
				if [[ -n "$gsf2wav_bin" ]]; then
					publish_tags "gsf2wav" "${lst_vgm[i]}"
					echo "gsf2wav"
					echo "Title: $tag_title"
					echo "Artist: $tag_artist"
					echo "Album: $tag_album"
					echo "Duration: ${tag_total_duration}s"
					"$gsf2wav_bin" "${lst_vgm[i]}" /dev/stdout 2>/dev/null \
						| "$aplay_bin" -V stereo --quiet &
					Player_PID="$!"
					force_quit
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

			elif echo "|${ext_snes}|" | grep -i "|${ext}|" &>/dev/null; then
				tag_spc "${lst_vgm[i]}"
				if [[ -n "$spc2wav_bin" ]]; then
					publish_tags "spc2wav" "${lst_vgm[i]}"
					"$spc2wav_bin" "${lst_vgm[i]}" /dev/stdout \
						| "$aplay_bin" -V stereo --quiet &
					Player_PID="$!"
					force_quit
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
				tag_vgm "${lst_vgm[i]}"
				publish_tags "VGMPlay" "${lst_vgm[i]}"
				"$vgmplay_bin" "${lst_vgm[i]}"
				listenbrainz_submit "VGMPlay"

			elif echo "|${ext_xmp}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$xmp_bin" ]]; then
				tag_xmp "${lst_vgm[i]}"
				publish_tags "XMP" "${lst_vgm[i]}"
				"$xmp_bin" "${lst_vgm[i]}"
				listenbrainz_submit "XMP"

			elif echo "|${ext_zxtune}|" | grep -i "|${ext}|" &>/dev/null && [[ -n "$zxtune123_bin" ]]; then
				if echo "|${ext_zxtune_xsf}|" | grep -i "|${ext}|" &>/dev/null; then
					tag_xsf "${lst_vgm[i]}"
				elif [[ "${ext}" = "sap" ]]; then
					tag_sap "${lst_vgm[i]}"
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

# Duration fomarted
time_formated="$((SECONDS/3600))h$((SECONDS%3600/60))m$((SECONDS%60))s"

# Print stats
echo
echo_separator
echo "glouglou was exited."
echo "You have listened ${vgm_counter}/${#lst_vgm[@]} tracks".
echo "The duration of your crazy listening was ${time_formated}".

# Proper exit
rm "$glouglou_cache_tags" &>/dev/null
rm "$glouglou_tags" &>/dev/null
stty sane
exit
}

# Trap
trap 'kill_stat' INT TERM SIGHUP

# Dependencies
player_dependency=(
	'adplay'
	'gsf2wav + aplay'
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

# Covers
cover_name=(
	'cover.jpg'
	'cover.png'
	'folder.jpg'
	'folder.png'
	'front.jpg'
	'front.png'
	'thumb.jpg'
	'thumb.png'
	'AlbumArt.jpg'
	'AlbumArt.png'
	'AlbumArtSmall.jpg'
	'AlbumArtSmall.png'
	)

# Paths
export PATH=$PATH:/home/$USER/.local/bin
glouglou_config_dir="/home/$USER/.config/glouglou"
glouglou_config_file="/home/$USER/.config/glouglou/config"
glouglou_cache_tags="/tmp/glouglou-cache-tags"
glouglou_tags="/tmp/glouglou-tags"

# Type of files allowed by player
ext_adplay="adl|amd|bam|cff|cmf|d00|dfm|ddt|dtm|got|hsc|hsq|imf|laa|ksm|mdi|mtk|rad|rol|sdb|sqx|wlf|xms|xsm"
ext_gba="gsf|minigsf"
ext_common="aac|ac3|aif|aiff|ape|flac|m4a|mp3|mpc|ogg|opus|wav|wv|wma"
ext_sc68="sc68|sndh"
ext_sidplayfp="sid|prg"
ext_snes="spc"
ext_midi="mid"
ext_multi_filter="sfx|snd"
ext_tracker="it|mod|mo3|mptm|s3m|stm|stp|plm|umx|xm"
ext_uade="aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|gmc|hot|fc13|fc14|med|mug|np3|okt|pru2|rk|s7g|smus|soc|p4x|tiny|tw"
ext_vgmstream_0_c="22k|8svx|acb|acm|ads|adp|adpcm|adx|aix|akb|apc|at3|at9|awb|bcstm|bcwav|bfstm|bfwav|brstm|bwav|cfn|ckd|cmp|csb|csmp|cps"
ext_vgmstream_d_n="dsm|dsp|dvi|fsb|gcm|genh|h4m|hca|hps|ifs|imc|isd|ivs|kma|kvs|lac3|lbin|logg|lopus|lstm|lwav|mab|mic|msf|mus|musx|nlsd|nop|npsf"
ext_vgmstream_o_z="ras|rws|sad|scd|sgd|ss2|str|strm|svag|p04|p16|pcm|psb|thp|trk|txtp|ulw|vag|vgmstream|voi|wem|xa|xai|xma|xnb|xwv"
ext_vgmstream="${ext_vgmstream_0_c}|${ext_vgmstream_d_n}|${ext_vgmstream_o_z}"
ext_vgmplay="s98|vgm|vgz"
ext_xmp="669|amf|dbm|digi|dsm|dsym|far|gz|mdl|musx|psm"
ext_zxtune_various="ay|ams|dmf|dtt|hvl|rmt|sap|v2m|xrns|ym"
ext_zxtune_xsf="2sf|dsf|psf|psf2|mini2sf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf"
ext_zxtune_zx_spectrum="asc|psc|pt2|pt3|sqt|stc|stp|tap"
ext_zxtune="${ext_zxtune_various}|${ext_zxtune_xsf}|${ext_zxtune_zx_spectrum}"

# Setup
aplay_bin
adplay_bin
ffplay_bin
fluidsynth_bin
gsf2wav_bin
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
various_bin

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
		-p|--publish_tags)
			publish_tags="1"
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
				 ${ext_gba}| \
				 ${ext_common}| \
				 ${ext_sc68}| \
				 ${ext_sidplayfp}| \
				 ${ext_snes}| \
				 ${ext_midi}| \
				 ${ext_multi_filter}| \
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
# Play
main_loop

exit
