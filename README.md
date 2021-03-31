# dotfiles
## For Windows
- AutoHotKey
  - Execute ahk.exe
  - Move ahk.exe to shell:startup
- Caps2lock.reg
  - execute Caps2lock.reg
- WindowsTerminal
  - Install WindowsTerminal
  - Move json file
- Font
  - Install from `https://github.com/miiton/Cica`

## For WSL
- ripgrep
  - Install from apt
```
https://github.com/BurntSushi/ripgrep#installation
If you're an Ubuntu Cosmic (18.10) (or newer) user, ripgrep is available using the same packaging as Debian:
$ sudo apt-get install ripgrep
```
- fzf
  - Install from apt
```
https://github.com/junegunn/fzf#using-linux-package-managers
Debian 9+/Ubuntu 19.10+ $sudo apt-get install fzf
```
- go
  - Install from bin
```
Download from https://golang.org/dl/
ex)
$curl -O https://storage.googleapis.com/golang/go1.13.5.linux-amd64.tar.gz
Install ↓
`https://golang.org/doc/install`
```
か､verが12以降だったらapt install golang-goでもよさそう。ghqしか使わないのであれば。
  - ghq
    - Install from go get
    - `https://github.com/x-motemen/ghq`
```
$go get github.com/x-motemen/ghq
```

- .tmux.conf
  - Move .tmux.conf to rootdir
- .bashrc
  - メモを読んでやる
- .vimrc
  - Move .vimrc to rootdir
  - vimplugインストールしてからvim開いてPlugInstall
 `https://github.com/junegunn/vim-plug#installation`

