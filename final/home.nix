{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.git
    pkgs.git-crypt
    pkgs.gnupg
    pkgs.pass
  ];

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "user1";
    userEmail = "user1@bodenko.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
