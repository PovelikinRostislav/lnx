1. Install vm as usual (fixed size)
2. Reboot
3. Set proxy in Settings->Network->Proxy->Manual
4. Reboot
5. https://askubuntu.com/questions/257290/configure-proxy-for-apt
6. Sudo apt-get update
7. Sudo apt-get upgrade
8. Reboot
9. Sudo apt-get update
10. Insert the vbox additions disc through the virtualbox GUI and run it
11. Shutdown
12. Add shared folders from manager menus; set acceleration and other parameters like RAM and Video memory
13. Run VM
14. sudo adduser rpovelik vboxsf
15. reboot
16. Access shared folders in /media/<shared_folder_name>
17. Oracle box menu -> Devices -> share clipboard -> bidirectional
18. Oracle box menu -> Devices -> share drag n drop -> bidirectional
19. Change shortcut for maximize window's size to Super+up (settings -> keyboard)
20. Change wallpaper from host drive
21. Remove redundant SW
    a. sudo apt --auto-remove purge libreoffice-* firefox thunderbird
22. Install useful SW
    a. sudo apt install vim clang git tmux curl cmake
23. Adapt terminal
    a. Turn off terminal bell
    b. Make cursor underscore
    c. Make font larger : 12
    d. Change terminal->Edit->profile preferences->colors
        i. Check out Use colors from system theme
        ii. Build-in schemes to solarized dark
        iii. 3A3A3A - background
        iv. D7D7D7 - foreground
    OR
        i. Check out Use colors from system theme
        ii. FFFFFF - background
        iii. 657B83 - foreground
24. Create links for shared folders
    a. sudo ln -s /media/sf_SHARED_FOLDER_NAME /mnt/NAME
25. Set git config and clone https://github.com/PovelikinRostislav/lnx.git. Put all configs in ~. Create folder ~/.vim/colors and place zenburn there
26. Install https://github.com/junegunn/vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
27. Update pliguns in vim :PlugUpdate
28. Add to .bashrc source of .profile.USERNAME config from the repo and add to the .bashrc thw following lines from the .profile.USERNAME (delete it from .profile.USERNAME)
    a. stty -ixon
    b. stty erase ^?
29. mkdir ~/bin && curl https://beyondgrep.com/ack-2.24-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
30. sudo apt-get install silversearcher-ag
