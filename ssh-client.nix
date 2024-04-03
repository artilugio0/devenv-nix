{ config, pkgs, ... } :

{
  home.file.".ssh/config.original".source = ./ssh-client/config;
  home.file.".ssh/config.original".onChange = ''
    $DRY_RUN_CMD chmod 700 $HOME/.ssh
    $DRY_RUN_CMD rm -f $HOME/.ssh/config
    $DRY_RUN_CMD cp $HOME/.ssh/config.original $HOME/.ssh/config
    $DRY_RUN_CMD chmod 400 $HOME/.ssh/config
  '';
}
