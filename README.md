```
                            ██▓ ▄▄▄██▀▀▀▄████▄      ██▒   █▓ ██▓ ███▄ ▄███▓
                            ▓██▒   ▒██  ▒██▀ ▀█     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
                            ▒██▒   ░██  ▒▓█    ▄     ▓██  █▒░▒██▒▓██    ▓██░
                            ░██░▓██▄██▓ ▒▓▓▄ ▄██▒     ▒██ █░░░██░▒██    ▒██ 
                            ░██░ ▓███▒  ▒ ▓███▀ ░      ▒▀█░  ░██░▒██▒   ░██▒
                            ░▓   ▒▓▒▒░  ░ ░▒ ▒  ░      ░ ▐░  ░▓  ░ ▒░   ░  ░
                             ▒ ░ ▒ ░▒░    ░  ▒         ░ ░░   ▒ ░░  ░    ░ ░
                             ▒ ░ ░ ░ ░  ░                ░░   ▒ ░░      ░   
                             ░   ░   ░  ░ ░               ░   ░         ░   
                                  ░                  ░                  
```
## Deps
- #### nvim
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```
##### If an error occurs:
```
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
```
```
# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm ./nvim.appimage
nvim
```
- #### Packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
- #### ripgrep (for telescope grep search)
```
sudo apt-get install ripgrep
```
- #### lazygit (for toggleterm)
```
sudo apt-get install lazygit
```
- #### unzip   (for lsp)
```
sudo apt-get install unzip
```
- #### npm     (for lsp)
##### Through nvm:
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

```
nvm install node
node --version
npm --version
```

## Installing NVim Config
```
mkdir ~/.config && cd ~/.config
```
```
git clone https://github.com/fabu11/nvim.git
```
```
cd nvim && nvim lua/ijcc/packer.lua
```
#### Skip all of the errors and continue to the file
### inside packer.lua: 
```
:so
```
```
:PackerSync
``` 
```
:qa
```
```
cp /tmp/nvim ~/.config/ && rm -rf /tmp/nvim 
```
```
nvim
```
