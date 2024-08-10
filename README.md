# Ubuntu Server Automated Setup

NOTE: These steps were tested on [Ubuntu 20.04 Server](https://ubuntu.com/download/server).

These steps are an _attempt_ to build the entire Ubuntu Server environment from a fresh install. The end state is an environment that uses _suckless software_ and its derivatives.

Base installation version:

* [dwm](https://dwm.suckless.org) - [dwm-6.5](https://dl.suckless.org/dwm/dwm-6.5.tar.gz). **DWM** is a tiling manager built on top of the [**X Window System**](https://en.wikipedia.org/wiki/X_Window_System).
* [dmenu](https://tools.suckless.org/dmenu) - [dmenu-5.3](https://dl.suckless.org/tools/dmenu-5.3.tar.gz)
* [st](https://st.suckless.org) - [st-0.9.2](https://dl.suckless.org/st/st-0.9.2.tar.gz)

## Note

* The Ubuntu Server environment was run on [Oracle VirtualBox](https://www.virtualbox.org), using Guest Additions 7.0.12.
* Mechanism of entry: login -> .profile (startx) -> .xinitrc (exec dwm)
* There seems to be persistent sound-related issues on Firefox due to `pulseaudio`, `speech-dispatcher` or some combination of these. As a workaround, `speech-dispatcher` has been removed during the setup.
* The Ubuntu Server VM seems to be stable on 4 cores. VM struggles and occasionally freezes with 1-2 cores. Anything above 4 cores causes performance to degrade.
* Baseline resources granted to VM:
  * 4096 RAM
  * 4 CPUs
  * 256 VRAM (on host, do 'VBoxManage.exe modifyvm "<VM_NAME>" --vram 256)
* The VM hangs from time to time upon startup, without reaching the login screen. The only way onward is to do a VM reset. The root cause has not been found.

## Usage

### Initial Manual Steps

This section covers the minimal manual work needed to run the script.

It is highly recommended to add the option `nomodeset` to `/etc/default/grub`:

```bash
sudo su  # use root
cp /etc/default/grub /etc/default/grub.bak

# append nomodeset to the line `GRUB_CMDLINE_LINUX_DEFAULT`.
```

```bash
# git clone this repo
git clone --depth=1 https://github.com/jianyuchenxyz/setup_p
# clones into dir 'setup_p'
cd setup_p
```

### Running `setup.sh`

```bash
pwd   # in dir 'setup_p'
./setup.sh
```

Reboot the instance.

```
sudo reboot now
```

After choosing the user, click the cog on the lower right corner and select `DWM`.

### Post-script manual setups

Use `ALSA` to ensure audio volume is set correctly (it seems to be set lower than the host OS). Apparently, decreasing and increasing the column labeled `PCM` would increase the overall volume slightly.

```
alsamixer
```

### Suckless Patches

#### dwm

* [**fullgaps**](https://dwm.suckless.org/patches/fullgaps) - [fullgaps_6.4.diff](suckless/dwm-0.6.5/patches/fullgaps_6.4.diff)

#### dmenu

* [**lineheight**](https://tools.suckless.org/dmenu/patches/line-height) - [lineheight_5.2.diff](suckless/dmenu-5.3/patches/lineheight_5.2.diff)
* [**border**](https://tools.suckless.org/dmenu/patches/border) - [border_20230512.diff](suckless/dmenu-5.3/patches/border_20230512.diff)
* [**numbers**](https://tools.suckless.org/dmenu/patches/numbers) - [numbers_20220512.diff](suckless/dmenu-5.3/patches/numbers_20220512.diff)
* [**center**](https://tools.suckless.org/dmenu/patches/center) - [center_5.2.diff](suckless/dmenu-5.3/patches/center_5.2.diff)

#### st

* [**scrollback**](https://st.suckless.org/patches/scrollback) - [scrollback.diff](suckless/st-0.9.2/patches/scrollback.diff)
* [**scrollback_mouse**](https://st.suckless.org/patches/scrollback) - [scrollback_mouse.diff](suckless/st-0.9.2/patches/scrollback_mouse.diff)

