# glouglou
glouglou just play in shuffle and repeat, all the files it found. Nothing else, finally without options...

## Usage
```
                                   Without option inplace recursively search/play files.
  -h|--help                        Display this help.
  -p|--publish_tags                Publish tags in text file > /tmp/glouglou-tags.

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
```

Stop it by true proper command: `ctrl+c`.

## Install & update
`curl https://raw.githubusercontent.com/Jocker666z/glouglou/main/glouglou.sh > /home/$USER/.local/bin/glouglou && chmod +rx /home/$USER/.local/bin/glouglou`

## Notes
* The shortcut "q" allows to go to the next track in almost all cases.
* It is not necessary to have all the dependencies installed, for example if you don't want to install zxtune123 but vgmplay is installed, glouglou will only play the vgmplay files.
* glouglou takes less than 6s to launch a playlist of more than 70000 files on LAN disk.
* Filter & exclude is regex friendly, example: `glouglou -f "PS1|PS2" -e "Final Fantasy|Alundra"`.
* Given the great difference between the types of playback, it is recommended a normalization. Use `easyeffects` with Digitalone1 preset (see: https://github.com/Digitalone1/EasyEffects-Presets).
* `glouglou -p` may be useful to your system monitor (example: conky), so that it can obtain information about the playback in progress. [See the specifications of the file](#publish-tags-specifications).

## Supported Files
The list of players is in the order that glouglou selects for the file. If one is not available, it moves to the next one.

* `adl|amd|bam|cff|cmf|d00|dfm|ddt|dmo|dtm|got|hsc|hsq|imf|laa|ksm|m|mdi|mtk|rad|rol|sdb|sqx|tm|wlf|xms|xsm`
	* adplay

* `gsf|minigsf`
	* gsf2wav
	* zxtune

* `aac|ac3|aif|aiff|ape|flac|m4a|mp2|mp3|mpc|ogg|opus|wav|wv|wma`
	* mpv
	* cvlc
	* ffplay

* `sc68|snd|sndh`
	* sc68

* `sid`
	* sidplayfp
	* zxtune

* `mdx`
	* simple_mdx2wav

* `prg`
	* sidplayfp

* `spc`
	* spc2wav
	* zxtune
	* mpv

* `mid`
	* timidity
	* fluidsynth

* `it|dsm|mod|mo3|mptm|s3m|stm|stp|plm|umx|xm`
	* openmpt123
	* xmp
	* zxtune
	* mpv

* `aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|gmc|hot|fc13|fc14|med|mug|np3|okt|pru2|rk|s7g|sfx|smus|soc|p4x|tiny|tw`
	* uade

* `22k|8svx|aax|acb|acm|ads|adp|adpcm|ad|adx|aix|akb|asf|apc|at3|at9|awb|bcstm|bcwav|bfstm|bfwav|bigrp|bik|brstm|bwav|cfn|ckd|csa|csb|cmp|csmp|cps|dsp|dvi|fsb|gcm|genh|h4m|hca|hps|ifs|imc|int|isd|ivs|kma|ks|kvs|lac3|lbin|lmp3|logg|lopus|lrmh|lstm|lwav|mab|mca|mic|msf|mus|musx|nlsd|nop|npsf|ogv|oma|ras|rsd|rsnd|rws|sad|sap|scd|sfx|sgd|snd|ss2|str|strm|stx|svag|p04|p08|p16|pcm|psb|thp|trk|trs|txtp|ulw|vag|vas|vds|vgmstream|vig|voi|way|wem|xa|xai|xma|xmd|xnb|xvag|xwv`
	* vgmstream

* `s98|vgm|vgz`
	* vgmplay

* `hmi|hmp|xmi`
	* wildmidi

* `669|amf|dbm|digi|dsym|far|gz|mdl|musx|psm`
	* xmp

* `ay|ams|dmf|dtt|hvl|rmt|sap|v2m|vt2|vtx|xrns|ym`
	* zxtune (tracker)

* `2sf|gsf|dsf|psf|psf2|mini2sf|minidsf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf`
	* zxtune (Portable Sound Format & derivate)

* `asc|psc|pt1|pt2|pt3|sqt|stc|stp|tap|zxs`
	* zxtune (ZX Spectrum)

## Tags
### Use VGM Files Database
To use the tags in the vgmfdb database, all you need to do is generate it (https://github.com/Jocker666z/vgm_files_database). If the file being play is not in the database, glouglou extracts the tags.

### Publish tags specifications
Location: `/tmp/glouglou-tags`

Each line corresponds to a tag, like this:
1. TITLE
2. ARTIST
3. ALBUM
4. PLAYER
5. COVER URI
6. TOTAL DURATION (in second)
7. ORIGINAL SYSTEM OR FILE INFO (if available)

### Tags read
By default the tags are taken with the filename and the directory that contains them. For more precision you will have to install the dependencies below.
* `aac|ape|flac|m4a|mp3|ogg|opus|wv|wma`: mutagen-inspect & bc (present in many official repositories as python3-mutagen)
* `sc68|snd|sndh`: info68 https://sourceforge.net/projects/sc68/ (intalled with sc68, see below)
* `sid`: xxd (present in many official repositories)
* `spc`: xxd (present in many official repositories)
* `s98|vgm|vgz`: vgm_tag https://github.com/vgmrips/vgmtools
* vgmstream files: vgmstream-cli (installed with vgmstream123)

## Beets
* With Beets option `-b` `-be`, you must have installed and configured beets, glouglou doesn't check anything on this side (see: https://beets.io/).
* Beets allows you to search in tags, of classic audio files like flac, mp3, etc... This method is more flexible because it includes file path and tags.

## Install help
### adplay
https://adplug.github.io/

adplay is present in many official repositories for most GNU/Linux distributions.

### Beets
https://beets.io/

Beets is present in many official repositories for most GNU/Linux distributions.

### gsf2wav
Build dependencies: `git build-essential`
```
git clone https://github.com/jprjr/gsf2wav && cd gsf2wav
git clone --recursive https://github.com/jprjr/lazygsf/
git clone https://github.com/jprjr/psflib
mkdir build && cd build
cmake .. && make -j"$(nproc)"
cp gsf2wav /home/$USER/.local/bin/
```

### mpv
https://mpv.io/

mpv is present in many official repositories for most GNU/Linux distributions.

### sc68
https://sourceforge.net/projects/sc68/

You also need `aplay` for this player, part of `alsa-utils` package.

Build dependencies: `git build-essential autoconf libtool libtool-bin automake pkg-config libao-dev zlib1g-dev`
```
cd
git clone https://github.com/Jocker666z/sc68 && cd sc68
tools/svn-bootstrap.sh && ./configure LDFLAGS="-static"
make -j"$(nproc)"
su -c "make install" -m "root"
```

### sidplayfp
https://github.com/libsidplayfp/sidplayfp

sidplayfp is present in many official repositories for most GNU/Linux distributions.

The sidplayfp configuration file must be filled properly, otherwise the result will be random (view: https://github.com/libsidplayfp/sidplayfp/wiki/sidplayfp.ini).
These config lines must be filled :
* `Songlength Database =`
* `Default Play Length =`
* `Kernal Rom =`
* `Basic Rom =`
* `Chargen Rom =`

The songlength DB is downloadable here: https://www.hvsc.c64.org/downloads

### simple_mdx2wav
https://github.com/yosshin4004/portable_mdx

```
git clone https://github.com/yosshin4004/portable_mdx
bash -c 'cd portable_mdx/examples/simple_mdx2wav && bash build.sh'
cp portable_mdx/examples/simple_mdx2wav/simple_mdx2wav /home/$USER/.local/bin/
```

### spc2wav
https://github.com/jprjr/spc2wav

```
cd /home/$USER/.local/bin/
wget https://github.com/jprjr/spc2wav/releases/download/v1.0.4/spc2wav-linux.tar.gz
tar -xf spc2wav-linux.tar.gz
```

### TiMidity++
https://timidity.sourceforge.net/

timidity is present in many official repositories for most GNU/Linux distributions. 

### uade
https://gitlab.com/uade-music-player/uade

Build dependencies: `git build-essential sparse`
```
git clone https://gitlab.com/heikkiorsila/bencodetools && cd bencodetools
./configure && make -j"$(nproc)"
su -c "make install" -m "root"
cd ..
git clone https://gitlab.com/hors/libzakalwe && cd libzakalwe
./configure && make -j"$(nproc)"
su -c "make install" -m "root"
cd ..
git clone https://gitlab.com/uade-music-player/uade && cd uade
./configure && make -j"$(nproc)"
su -c "make install" -m "root"
```

### vgmstream123
https://github.com/vgmstream/vgmstream

Build dependencies: `gcc g++ make cmake build-essential git libmpg123-dev libvorbis-dev libspeex-dev libavformat-dev libavcodec-dev libavutil-dev libswresample-dev yasm libopus-dev pkg-config autoconf libtool-bin libao-dev libjansson-dev`
```
git clone https://github.com/vgmstream/vgmstream && cd vgmstream
mkdir build && cd build
cmake .. -DBUILD_AUDACIOUS=OFF
make -j"$(nproc)"
su -c "make install" -m "root"
```

### vgmplay
https://github.com/ValleyBell/vgmplay-libvgm

Build dependencies: `git build-essential cmake zlib1g-dev libao-dev libdbus-1-dev`
```
git clone --recurse-submodules https://github.com/ValleyBell/vgmplay-libvgm && cd vgmplay-libvgm
mkdir build && cd build && cmake .. 
make -j"$(nproc)"
su -c "make install" -m "root"
```

### vgm_tag
Build dependencies: `git build-essential`
```
git clone https://github.com/vgmrips/vgmtools && cd vgmtools
mkdir build && cd build && cmake .. 
make -j"$(nproc)"
cp vgm_tag /home/$USER/.local/bin
```

### WildMIDI
https://github.com/Mindwerks/wildmidi

WildMIDI is present in many official repositories for most GNU/Linux distributions. 

### xmp
https://xmp.sourceforge.net/

xmp is present in many official repositories for most GNU/Linux distributions. 

### zxtune123
Bin here: https://zxtune.bitbucket.io/

## Todo/Idea
* Resume current playlist after exit
* Save playlists; able to see playlists & select one
