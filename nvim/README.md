# How to install NeoVim (+ baseline plugins)

1. Install NeoVim:
```sudo apt-get install neovim```

2. Install [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

3. Create the `~/.config/nvim/` directory at your user's home directory.
```
mkdir -p ~/.config/nvim/
```

4. Clone this repository and copy `init.vim` into `~/.config/nvim/`.
```
git clone https://github.com/jianyuchenxyz/setup_p
cp setup/nvim/init.vim ~/.config/nvim/
```

5. Open up NeoVim and execute `:PlugInstall`. If the command fails to run due to the error `Unknown function: mkdp#util#install`, run the following command:
```
:call mkdp#util#install()
```

6. Create an alias for the `vi` command to point to `nvim`. The file change might need to be made in `~/.bashrc` or `~/.bash_profile`, depending on the OS.
```
which nvim  # /usr/bin/nvim
export EDITOR="nvim"
alias vi="/usr/bin/nvim"
'''

