# How to Install Ubuntu 18.04 LTS on VM
1. Install vm as usual (fixed size)
2. sudo reboot
3. Set proxy in Settings->Network->Proxy->Manual
4. https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-set-the-proxy-for-apt-for-ubuntu-18-04/
5. sudo apt-get update
6. sudo apt-get upgrade
7. sudo reboot
8. Insert the vbox additions disc through the virtualbox GUI and run it to install
9. sudo reboot
10. Add shared folders from manager menus; set acceleration and other parameters like RAM and Video memory, UI
11. Run VM
12. Oracle box menu -> Devices -> share clipboard -> bidirectional
13. Oracle box menu -> Devices -> share drag n drop -> bidirectional
14. To access mounted shared folders
    * sudo adduser rpovelik vboxsf
15. sudo reboot
16. Create links for shared folders
    * sudo ln -s /media/sf_SHARED_FOLDER_NAME /mnt/NAME
17. Install useful SW
    * sudo apt install vim clang git tmux curl cmake gnome-tweak-tool xclip
18. Adapt terminal
    * Turn off terminal bell
    * Make cursor underscore
    * Make font larger : 14
    * Change terminal->Edit->profile preferences->colors
        * Check out Use colors from system theme
        * 3A3A3A - background
        * D7D7D7 - foreground
19. Set git config and clone https://github.com/PovelikinRostislav/lnx.git. Put all configs in ~. Create folder ~/.vim/colors and place zenburn there
20. Install https://github.com/junegunn/vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
21. Update plugins in vim
    * :PlugUpdate
22. Add to .bashrc following lines from the
    * stty -ixon
    * stty erase ^?
23. Change PS in bashrc (\W to show current folder only instead of \w)
24. mkdir ~/bin && curl https://beyondgrep.com/ack-2.24-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
25. sudo apt-get install silversearcher-ag
26. Install conda
    * https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
    * Add to .bashrc
        [ -f ~/miniconda3/etc/profile.d/conda.sh ] && source ~/miniconda3/etc/profile.d/conda.sh
27. Install rg (for vim and grepping) from sources
    * Install rust compiler (default options) - https://www.rust-lang.org/tools/install
        curl https://sh.rustup.rs -sSf | sh
        * Add to bashrc
            export PATH="$HOME/.cargo/bin:$PATH"
    * https://github.com/BurntSushi/ripgrep#installation
    * After compilation of rg
        mkdir ~/rg
        mkdir ~/rg/bin
        cp ./target/release/rg ~/rg/bin
    * Add to .bashrc
        export PATH="$HOME/rg/bin:$PATH"
28. To use vim clang-format plugin - add a clang-format into PATH
