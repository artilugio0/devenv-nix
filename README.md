# Installation

As root:
```
# nix-shell -p git
# git clone https://github.com/artilugio0/devenv-nix
# cd devenv-nix
# nixos-rebuild switch --flake .#my-config
# passwd user
# cd ..
# chown -R user devenv-nix
# mv devenv-nix /home/user/
# reboot
```

As user:
```
$ mkdir workspace
$ mv devenv-nix workspace/
$ cd workspace/devenv-nix
$ rm -fr /home/user/.config/i3
$ nix-shell -p git home-manager
$ home-manager switch --flake .#my-home-config
```

Resolution:
```
bash ./workspace/devenv-nix/virtmanager/resolution.sh
```

Or custom config:
```
$ xrandr -q
$ gtf 1680 970 60
$ xrandr --newmode "1680x970_60.00"  134.94  1680 1784 1960 2240  970 971 974 1004  -HSync +Vsync
$ xrandr --addmode Virtual-1 1680x970_60.00
$ xrandr --output Virtual-1 --mode 1680x970_60.00
```

Virtmanager configuration:
```
Memory: Enable shared memory
Video: VGA
```
