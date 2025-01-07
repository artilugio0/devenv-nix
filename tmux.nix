{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xclip
    tmux
  ];

  home.file.".tmux.conf".source = ./tmux/tmux.conf;
  home.file."./scripts/,devmux".source = ./tmux/devmux.sh;
  home.file."./scripts/,devmux".executable = true;
}
