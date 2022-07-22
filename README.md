## Nvim
Requirement: v0.7.0 이상
### nvim-treesitter
```sh
:TSInstall javascript typescript tsx python
```

### nvim-tree
https://www.nerdfonts.com/ 에서 Hack 폰트를 설치하고 iterm2에 등록한다.

### telescope
live grep 기능을 사용하기 위해 ripgrep을 설치해야 한다.  
https://github.com/BurntSushi/ripgrep
```sh
brew install ripgrep
```


## Tmux
### Tmux pakage manager
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```sh
tmux source ~/.tmux.conf
```

패키지 설치: `prefix` + `I`

## Fish
### Installation (OSX)
```sh
$ brew install fish
$ fish
$ fish_add_path /opt/homebrew/bin
$ echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
$ chsh -s /opt/homebrew/bin/fish
```

### Fisher
https://github.com/jorgebucaran/fisher
```sh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

### Theme
```sh
fisher install oh-my-fish/theme-agnoster
```

### z
```sh
fisher install jethrokuan/z
```

### exa
https://the.exa.website/
```sh
brew install exa # OSX
apt-get install exa # linux
```

### peco
https://github.com/peco/peco
```sh
brew install peco # OSX
apt-get install peco # linux
```

### ghq
https://github.com/x-motemen/ghq
```sh
brew install ghq
```

## ITerm2
https://github.com/mbadolato/iTerm2-Color-Schemes 을 clone한 후, schemes 폴더를 iterm2에서 import한다.

