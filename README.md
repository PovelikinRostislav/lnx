# Pure installation in Ubuntu
- Install [alacritty](https://github.com/alacritty/alacritty) and configure [tender theme](https://github.com/huyvohcmc/tender-alacritty), copy `alacritty.yml` to `$HOME/.config/alacritty/alacritty.yml` or `%APPDATA%\alacritty`
- Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH), copy `.zshrc` into `$HOME` and comment all unworking, change home path
- Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- Install [fonts](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- Install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
- Install [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh) coloring of ZSH and configure it on your own by `p10k configure` or by re-logging into shell
- Install [LS_COLORS](https://github.com/trapd00r/LS_COLORS)
- Install tmux from apt and put `.tmux.conf` into `$HOME`
- Install [ripgrep](https://github.com/BurntSushi/ripgrep/#installation), copy `.ripgreprc` into `$HOME`
- Install [bat](https://github.com/sharkdp/bat)
- Install [fd](https://github.com/sharkdp/fd)
- Install vim, copy `vimrc` into `~/.vim/` folder and open vim - it will install everything on its own. Change tender theme here .vim/plugged/tender.vim/colors/tender.vim:
```
-hi Search guifg=#ffffff ctermfg=15 guibg=NONE ctermbg=NONE gui=underline,Bold cterm=underline,Bold
+hi Search guifg=#ffffff ctermfg=15 guibg=NONE ctermbg=243 gui=underline,Bold cterm=underline,Bold
```
- Put `htoprc` into .config/htop/htoprc
