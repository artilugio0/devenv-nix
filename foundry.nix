{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
  ];

  home.file.".foundry".source = builtins.fetchZip {
    url = "https://github.com/foundry-rs/foundry/releases/download/nightly-fd878884eda640c2cc59a7fa66aef9288846ef0e/foundry_nightly_linux_amd64.tar.gz";
    hash = "";
  };
  /*
  home.file.".config/nvim.original".onChange = ''
    $DRY_RUN_CMD test -d $HOME/.config/nvim && rm -fr $HOME/.config/nvim
    $DRY_RUN_CMD cp -rp $HOME/.config/nvim.original/ $HOME/.config/nvim
    $DRY_RUN_CMD find $HOME/.config/nvim -type d -exec chmod 755 {} \;
    $DRY_RUN_CMD chmod 755 $HOME/.config/nvim
  '';
  */
}
