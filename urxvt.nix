{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rxvt-unicode
  ];

  home.file = {
    ".Xresources".source = urxvt/Xresources;
    ".Xresources".onChange = "
      $DRY_RUN_CMD nix-shell -p xorg.xrdb --command 'xrdb ~/.Xresources'
    ";
  };
}
