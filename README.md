# Ubuntu Desktop Automated Setup

NOTE: These steps were tested on [Ubuntu 20.04 Desktop](https://ubuntu.com/download/desktop).

These steps are an _attempt_ to build the entire Ubuntu Desktop environment from a fresh install. The end state is an environment that uses _suckless software_ and its derivatives.

Base installation version:

* [dwm](https://dwm.suckless.org) - [dwm-6.5](https://dl.suckless.org/dwm/dwm-6.5.tar.gz). **DWM** is a tiling manager built on top of the [**X Window System**](https://en.wikipedia.org/wiki/X_Window_System).
* [dmenu](https://tools.suckless.org/dmenu) - [dmenu-5.3](https://dl.suckless.org/tools/dmenu-5.3.tar.gz)
* [st](https://st.suckless.org) - [st-0.9.2](https://dl.suckless.org/st/st-0.9.2.tar.gz)

## Note

* The Ubuntu Desktop environment was run on [Oracle VirtualBox](https://www.virtualbox.org), using Guest Additions 7.0.12.
* The Ubuntu Desktop comes packaged with the [Gnome Display Manager (GDM3)](https://www.gnome.org) which starts the `X` session by reading `~/.xprofile`, instead of reading `~/.xinitrc` via `startx`. This setup also requires GDM3 as a login manager before switching to X/DWM. **If these steps are performed on other operating systems, expect the entry mechanism to change.**
* There seems to be persistent sound-related issues on Firefox due to `pulseaudio`, `speech-dispatcher` or some combination of these. As a workaround, `speech-dispatcher` has been removed during the setup.
* The Ubuntu Desktop VM seems to be more stable on 4 cores. VM struggles and occasionally freezes with 1-2 cores. Anything above 4 cores causes performance to degrade.

## Usage

### Initial Manual Steps

This section covers the minimal manual work needed to run the script.

If this is run on Ubuntu Server OS, it is highly recommended to add the option `nomodeset` to `/etc/default/grub`:

```bash
sudo su  # use root
cp /etc/default/grub /etc/default/grub.bak

# append nomodeset to the line `GRUB_CMDLINE_LINUX_DEFAULT`.
```

```bash
# git clone this repo
git clone --depth=1 https://github.com/jianyuchenxyz/setup
# clones into dir 'setup'
cd setup
```

### Running `os/setup.sh`

```bash
pwd   # in dir 'setup'
bash os/setup.sh
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

