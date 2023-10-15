# glouglou
Bad bash script for no brain, also play audio/vgm/chiptune.

glouglou just play in shuffle and repeat, all the files it found. Nothing else, finally without options...

## Use
Enter :
* `glouglou`for inplace recursively search files.
* `glouglou -i /dir -i /dir...` for select one or several directories.
* `glouglou -e "pattern filter"` for exclude files/dir contain pattern.
* `glouglou -f "pattern filter"` for select only files/dir contain pattern.
* `glouglou -c` for playlist in alphabetical order.
* `glouglou -r` for no repeat playlist.
* `glouglou -s` for use ListenBrainz scrobber.
* `glouglou -p` for publish tags in /tmp/glouglou-tags.
* `glouglou -t <token>` for register your ListenBrainz token.

Stop it by true proper command: `ctrl+c`.

## Install & update
`curl https://raw.githubusercontent.com/Jocker666z/glouglou/main/glouglou.sh > /home/$USER/.local/bin/glouglou && chmod +rx /home/$USER/.local/bin/glouglou`

## Notes
* The shortcut "q" allows to go to the next track in almost all cases.
* It is not necessary to have all the dependencies installed, for example if you don't want to install zxtune123 but vgmplay is installed, glouglou will only read the vgmplay files.
* glouglou takes less than 6s to launch a playlist of more than 70000 files on LAN disk.
* Filter & exclude is extended-regexp friendly, example: `glouglou -f "PS1|PS2" -e "Final Fantasy|Alundra"`.
* Given the great difference between the types of playback, it is recommended to apply a normalization to the audio output (see: https://github.com/Digitalone1/EasyEffects-Presets)
* `glouglou -p` can be useful to get the glouglou informations from your system monitor (example: conky). See below the specifications of the file.

## Supported Files
The list of players is in the order that glouglou selects for the file. If one is not available, it moves to the next one.

* `adl|amd|bam|cff|cmf|d00|dfm|ddt|dtm|got|hsc|hsq|imf|laa|ksm|mdi|mtk|rad|rol|sdb|sqx|wlf|xms|xsm`
	* adplay

* `gsf|minigsf`
	* gsf2wav
	* zxtune
	
* `aac|ac3|aif|aiff|ape|flac|m4a|mp3|mpc|ogg|opus|wav|wv|wma`
	* mpv
	* ffplay
	
* `sc68|snd|sndh`
	* sc68

* `sid`
	* sidplayfp
	* zxtune

* `prg`
	* sidplayfp

* `spc`
	* spc2wav
	* zxtune
	* mpv

* `mid`
	* timidity
	* fluidsynth

* `it|mod|mo3|mptm|s3m|stm|stp|plm|umx|xm`
	* openmpt123
	* xmp
	* zxtune
	* mpv

* `aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|gmc|hot|fc13|fc14|med|mug|np3|okt|pru2|rk|s7g|sfx|smus|soc|p4x|tiny|tw`
	* uade

* `22k|8svx|acb|acm|ads|adp|adpcm|adx|aix|akb|apc|at3|at9|awb|bcstm|bcwav|bfstm|bfwav|brstm|bwav|cfn|ckd|csb|cmp|csmp|cps|dsm|dsp|dvi|fsb|gcm|genh|h4m|hca|hps|ifs|imc|isd|ivs|kma|kvs|lac3|lbin|logg|lopus|lstm|lwav|mab|mic|msf|mus|musx|nlsd|nop|npsf|ras|rws|sad|scd|sfx|sgd|snd|ss2|str|strm|svag|p04|p16|pcm|psb|thp|trk|txtp|ulw|vag|vgmstream|voi|wem|xa|xai|xma|xnb|xwv`
	* vgmstream

* `s98|vgm|vgz`
	* vgmplay

* `669|amf|dbm|digi|dsm|dsym|far|gz|mdl|musx|psm`
	* xmp

* `ay|ams|dmf|dtt|hvl|rmt|sap|v2m|xrns|ym`
	* zxtune

* `2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf`
	* zxtune

* `asc|psc|pt2|pt3|sqt|stc|stp|tap`
	* zxtune

## Tags
### Tags read
By default the tags are taken with the filename and the directory that contains them. For more precision you will have to install the dependencies below.
* `aac|ape|flac|m4a|mp3|ogg|opus|wv|wma`: mutagen-inspect & bc (present in many official repositories as python3-mutagen)
* `sc68|sndh`: info68 https://sourceforge.net/projects/sc68/ (intalled with sc68, see below)
* `sid`: xxd (present in many official repositories)
* `spc`: xxd (present in many official repositories)
* `s98|vgm|vgz`: vgm_tag https://github.com/vgmrips/vgmtools
* vgmstream files: vgmstream-cli (installed with vgmstream123)

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

## Install help:
### adplay
https://adplug.github.io/

adplay is present in many official repositories for most GNU/Linux distributions.

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

### xmp
https://xmp.sourceforge.net/

xmp is present in many official repositories for most GNU/Linux distributions. 

### zxtune123
https://zxtune.bitbucket.io/

x86_64:
```
cd /home/$USER/.local/bin/
wget https://github.com/Jocker666z/vgm2flac-dep/raw/main/zxtune123_r5052_x86_64.tar.bz2
tar -xf zxtune123_r5052_x86_64.tar.bz2 && rm zxtune123_r5052_x86_64.tar.bz2
```
armhf:
```
cd /home/$USER/.local/bin/
wget https://github.com/Jocker666z/vgm2flac-dep/raw/main/zxtune123_r5052_armhf.tar.bz2
tar -xf zxtune123_r5052_armhf.tar.bz2 && rm zxtune123_r5052_armhf.tar.bz2
```
