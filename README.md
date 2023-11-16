# ijcVIM

## deps (ie packages that did not come natural with wsl (ubuntu 20.0.4))
- nvim (ofc)
- ripgrep (for telescope grep search)
- lazygit (for toggleterm)
- unzip   (for lsp)
- npm     (for lsp)
- nerdfont (developed using SauceCodePro)

# temp install (until i get to implementing a bash script)
```
$ cd /tmp/
```
```
$ git clone https://github.com/fabu11/nvim.git
```
```
$ cd nvim && nvim lua/ijcc/packer.lua
```
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
$ cp /tmp/nvim ~/.config/ && rm -rf /tmp/nvim 
```
```
$ nvim
```
