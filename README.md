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
#### Developed and maintained for WSL2 - Ubuntu 22.04 on aarm64
## Dependencies
<details><summary>nvim</summary>

#### app image: 
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
/nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm ./nvim.appimage
nvim
```
#### Or,
[link to nvim install](https://github.com/neovim/neovim/blob/master/INSTALL.md)
</details>

<details>
<summary> npm+node </summary>

#### Through nvm:
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
</details>

<details>
<summary>plugin dependencies</summary>

- [LuaRocks](https://github.com/luarocks/luarocks/wiki/Download)
- [Rust & Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
    - Ubuntu:
        ```
        curl https://sh.rustup.rs -sSf | sh
        ```
- [Ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
    - Ubuntu:
        ```
        sudo apt install ripgrep
        ```
- [LazyGit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
- clangd-21
    - Ubuntu: 
        ```
        cd /tmp
        wget https://github.com/llvm/llvm-project/releases/download/llvmorg-21.1.5/LLVM-21.1.5-Linux-ARM64.tar.xz
        sudo tar -xf LLVM-21.1.5-Linux-ARM64.tar.xz -C /opt/
        sudo ln -s /opt/LLVM-21.1.5-Linux-ARM64/bin/clangd /usr/local/bin/clangd-21
        ```
</details>

