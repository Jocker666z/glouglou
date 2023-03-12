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


## Supported Files
The list of players is in the order that glouglou selects for the file. If one is not available, it moves to the next one.

* `adl|amd|bam|cff|cmf|d00|dfm|ddt|dtm|got|hsc|hsq|imf|laa|ksm|mdi|mtk|rad|rol|sdb|sqx|wlf|xms|xsm`
	* adplay

* `aac|ac3|aif|aiff|ape|flac|m4a|mp3|mpc|ogg|opus|wav|wv|wma`
	* mpv
	* vgmstream
	* ffplay
	
* `sc68|sndh`
	* sc68

* `sid`
	* sidplayfp
	* zxtune

* `spc`
	* zxtune
	* spc2wav
	* mpv

* `mid`
	* timidity
	* fluidsynth

* `it|mod|s3m|xm`
	* openmpt123
	* xmp
	* zxtune
	* mpv

* `aam|abk|ahx|amc|aon|ast|bss|bp|bp3|cm|cus|dm|dm2|dmu|dss|dw|ea|ex|hot|fc13|fc14|med|mug|np3|sfx|smus|soc|p4x|tiny`
	* uade

* `8svx|ads|adp|adpcm|adx|aix|apc|at3|bcstm|bcwav|bfstm|bfwav|brstm|cfn|csb|csmp|cps|dsm|dsp|fsb|genh|hca|hps|ifs|imc|kma|lwav|mic|mus|musx|nlsd|npsf|sad|ss2|strm|p04|p16|thp|vag|vgmstream|xa|xnb|xwv`
	* vgmstream

* `s98|vgm|vgz`
	* vgmplay

* `669|amf|dbm|digi|dsm|dsym|far|gz|mdl|musx|psm`
	* xmp

* `ay|ams|dmf|dtt|hvl|sap|v2m|ym`
	* zxtune

* `2sf|gsf|dsf|psf|psf2|mini2sf|minigsf|minipsf|minipsf2|minissf|miniusf|minincsf|ncsf|ssf|usf`
	* zxtune

* `asc|psc|pt2|pt3|sqt|stc|stp`
	* zxtune

## Dependencies install help:
### adplay
https://adplug.github.io/

adplay is present in many official repositories for most GNU/Linux distributions.

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

The sidplayfp configuration file must be filled in correctly, otherwise the result will be random (view: https://github.com/libsidplayfp/sidplayfp/wiki/sidplayfp.ini).

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

Build dependencies: `git build-essential sparse audacious-dev libao-dev libvorbis-dev libmpg123-dev`
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

### vgmstream-cli
https://github.com/vgmstream/vgmstream

Build dependencies: `git build-essential cmake audacious-dev libsvtav1enc1 libao-dev libopus-dev libmpg123-dev libgtk-3-dev`
```
git clone https://github.com/vgmstream/vgmstream && cd vgmstream
mkdir build && cd build && cmake .. 
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
wget https://github.com/Jocker666z/vgm2flac-dep/raw/main/zxtune123_r5020_x86_64.tar.bz2
tar -xf zxtune123_r5020_x86_64.tar.bz2 && rm zxtune123_r5020_x86_64.tar.bz2
```
armhf:
```
cd /home/$USER/.local/bin/
wget https://github.com/Jocker666z/vgm2flac-dep/raw/main/zxtune123_r5020_armhf.tar.bz2
tar -xf zxtune123_r5020_armhf.tar.bz2 && rm zxtune123_r5020_armhf.tar.bz2
```
