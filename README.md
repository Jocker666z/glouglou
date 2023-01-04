# glouglou
Bad bash script for no brain, also play vgm in shuffle.

glouglou just play in shuffle and repeat, all the vgm files it found. Nothing else.

## Use
Enter : `glouglou /dir` or just `glouglou` (it will recursively search files).

Stop it by true proper command: `ctrl+c`.

## Install & update
### Glouglou :
`curl https://raw.githubusercontent.com/Jocker666z/glouglou/main/glouglou.sh > /home/$USER/.local/bin/glouglou && chmod +rx /home/$USER/.local/bin/glouglou`

### vgmplay
https://github.com/ValleyBell/vgmplay-libvgm
```
git clone --recurse-submodules https://github.com/ValleyBell/vgmplay-libvgm && cd vgmplay-libvgm
mkdir build && cd build && cmake .. 
make -j"$(nproc)"
su -c "make install" -m "root"
cd ..
cd ..
rm -R vgmplay-libvgm
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
* Nintendo DS: 2sf, mini2sf, ncsf, minincsf
* Nintendo GBA: gsf, minigsf
* Nintendo N64: usf, miniusf
* Nintendo SNES: spc
* Sega Saturn: minissf, ssf
* Sega Dreamcast: dsf
* Sony Playstation: psf, minipsf
* Sony Playstation 2: psf2, minipsf2
