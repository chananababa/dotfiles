## Nvim
### LSP
```sh
:CocInstall coc-tsserver coc-json coc-pyright
```

### nvim-treesitter
```sh
:TSInstall javascript typescript tsx python
```

### nvim-tree
https://www.nerdfonts.com/ 에서 Hack 폰트를 설치하고 iterm2에 등록한다.

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

### Oh My Fish
```sh
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### Theme
```sh
omf install agnoster
omf theme agnoster
```


### exa
https://the.exa.website/
```sh
brew install exa
```

### peco
https://github.com/peco/peco
```sh
brew install peco
```

### z
```sh
omf install z
```

## ITerm2
https://github.com/mbadolato/iTerm2-Color-Schemes 을 clone한 후, schemes 폴더를 iterm2에서 import한다.

