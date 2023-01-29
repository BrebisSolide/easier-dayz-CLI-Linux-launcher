Easier DayZ Linux Launcher
====

This program has been forked from : https://github.com/bastimeyer/dayz-linux-cli-launcher

Many thanks to bastimeyer.

## About the script :

This is my first ever GitHub Repo. As well as my first time using Bash. So don't blame me !
Even though this is my first bash program, It should work fairly well on any Linux machine capable of running dayZ.
(Has been tested on multiple Linux machines) If you found any bug, please report it. But make sure that the bug really comes from **my** program, so please check if you can join a vanilla server using the official launcher before complaining.

Also don't forget that this is just an "automation script" to make your life easier if you are a beginer **using bastimeyer's program**. If you encounter a problem connecting to your favorite modded dayZ server, please check the original software's github page linked above for further info.

Again, this script is meant to be a more lightweight alternative to VlaanH's GUI fork, Thus making it easier to modify it to your needs.


## Using the program :
To use this software, all you need to do is to download the latest release, and extract it where ever you want on your computer. Just make sure that at least *bashdayz.sh* and *dayz-launcher.sh* are in the same directory.

First, open your terminal in the program's directory.

How to run the launcher on any distribution :
```sh
./bashdayz.sh
```
You will then be prompted to press enter in order to acess the main menu. From there, you can use one of the 3 aviable features :
- Show server list (will crash the script if you didnt register any)
- Add new server to the list
- Direct connect

Finally, please keep in mind that this project was not intended to be published originally, and was for my personal use.

## Install DayZ

[Support for BattlEye anti-cheat for Proton on Linux has been officially announced by Valve on 2021-12-03.][battleye-announcement]

In order to get the game running on Linux, you first have to install the Steam beta client (see Steam's settings menu). Then install `Proton Experimental` and the `Proton BattlEye Runtime` (filter by "tools" in your games library). After that, set the "Steam play compatibility tool" for DayZ to "Proton Experimental" (right-click the game and go to properties).

### Important notes

In order for the game to actually run on Linux via Proton, the [`vm.max_map_count`][vm.max_map_count] kernel parameter needs to be increased, because otherwise the game will freeze while loading the main menu or after playing for a couple of minutes. Some custom kernels like TK-Glitch for example already increase this value from its [default value of `64*1024-6`][vm.max_map_count-default] to [`512*1024`][tkg-kernel-patch], but even this won't work reliably. Increasing it to `1024*1024` seems to work.

```sh
sudo sysctl -w vm.max_map_count=1048576
```

Or apply it permanently:

```sh
​echo 'vm.max_map_count=1048576' | sudo tee /etc/sysctl.d/vm.max_map_count.conf
```


  [battleye-announcement]: https://store.steampowered.com/news/group/4145017/view/3104663180636096966
  [vm.max_map_count]: https://github.com/torvalds/linux/blob/v5.15/Documentation/admin-guide/sysctl/vm.rst#max_map_count
  [vm.max_map_count-default]: https://github.com/torvalds/linux/blob/v5.15/include/linux/mm.h#L185-L202
  [tkg-kernel-patch]: https://github.com/Frogging-Family/linux-tkg/blob/db405096bd7fb52656fc53f7c5ee87e7fe2f99c9/linux-tkg-patches/5.15/0003-glitched-base.patch#L477-L534
