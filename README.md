# glouglou
Bad bash script for no brain, also play vgm/chiptune in shuffle.

glouglou just play in shuffle and repeat, all the files it found. Nothing else.

## Use
Enter : `glouglou /dir` or just `glouglou` (it will recursively search files).

Stop it by true proper command: `ctrl+c`.

It is not necessary to have all the dependencies installed, for example if you don't want to install zxtune123 but vgmplay is installed, glouglou will only read the vgmplay files.

## Install & update
`curl https://raw.githubusercontent.com/Jocker666z/glouglou/main/glouglou.sh > /home/$USER/.local/bin/glouglou && chmod +rx /home/$USER/.local/bin/glouglou`

## Dependencies install help:
### adplay
https://adplug.github.io/

adplay is present in many official repositories for most GNU/Linux distributions.

For:
* PC AdLib (OPL2/3): adl, amd, d00, got, hsc, hsq, imf, ksm, mdi, rad, rol, sdb, sqx, wlf

### openmpt123
https://lib.openmpt.org/

openmpt123 is present in many official repositories for most GNU/Linux distributions.

For:
* Music tracker files: it, mo3, mod, s3m, xm

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
For .sc68

### TiMidity++
https://timidity.sourceforge.net/

timidity is present in many official repositories for most GNU/Linux distributions. 

For .mid

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
For:
* Music tracker files: abk, ahx, bp, fc13, fc14

### vgmstream-cli
https://github.com/vgmstream/vgmstream

Build dependencies: `git build-essential cmake audacious-dev libsvtav1enc1 libao-dev libopus-dev libmpg123-dev libgtk-3-dev`
```
git clone https://github.com/vgmstream/vgmstream && cd vgmstream
mkdir build && cd build && cmake .. 
make -j"$(nproc)"
su -c "make install" -m "root"
```
For:
* Various machines: ads, adp, adx, at3, cps, genh, ss2, thp, xa

### vgmplay
https://github.com/ValleyBell/vgmplay-libvgm

Build dependencies: `git build-essential cmake zlib1g-dev libao-dev libdbus-1-dev`
```
git clone --recurse-submodules https://github.com/ValleyBell/vgmplay-libvgm && cd vgmplay-libvgm
mkdir build && cd build && cmake .. 
make -j"$(nproc)"
su -c "make install" -m "root"
```
For:
* NEC PC-Engine, Sharp X1, Fujitsu FM: s98
* Various machines: vgm, vgz

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
For:
* Atari XL/XE: sap
* C64: sid
* Nintendo DS: 2sf, mini2sf, ncsf, minincsf
* Nintendo GBA: gsf, minigsf
* Nintendo N64: usf, miniusf
* Nintendo SNES: spc
* Sega Saturn: minissf, ssf
* Sega Dreamcast: dsf
* Sony Playstation: psf, minipsf
* Sony Playstation 2: psf2, minipsf2
* PC: hvl, v2m, ym
