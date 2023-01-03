# glouglou
Bad bash script for no brain, also play vgm in shuffle.

glouglou just play in shuffle, all the vgm files it found. Nothing else.

## Use
Ender : `glouglou /dir` or just `glouglou` (it will recursively search the files)

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

### zxtune123
https://zxtune.bitbucket.io/
```
cd /home/$USER/.local/bin/
wget https://github.com/Jocker666z/vgm2flac-dep/raw/main/zxtune123_r5020.tar.bz2
tar -xf zxtune123_r5020.tar.bz2 && rm zxtune123_r5020.tar.bz2
```
