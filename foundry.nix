{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unzip
  ];

  home.file.".foundry/bin" = {
    source = pkgs.fetchzip {
      url = "https://github.com/foundry-rs/foundry/releases/download/nightly-fd878884eda640c2cc59a7fa66aef9288846ef0e/foundry_nightly_linux_amd64.tar.gz";
      hash = "sha256-59lJFQ0Ew1Y5jdPv4dtacm6WQJ7GSai0WcIsDXgz9v8=";
      stripRoot = false;
    };

    onChange = ''
    $DRY_RUN_CMD test -d $HOME/bin || mkdir $HOME/bin
    $DRY_RUN_CMD find $HOME/.foundry/bin/ -exec ln -sf {} $HOME/bin/ \;
    '';
  };
}
