{ config, lib, pkgs, nimPackages, ... }:

## Packages and programs go here

{

  environment.systemPackages = with pkgs; [
    # Utils
    wget
    bash
    curl
    git
    stow
    gcc
    clang
    cmake
    ripgrep
    htop
    ispell
    unzip
    bash
    p7zip
    coreutils
    pandoc #emacs

    ## User Programs
    brave
    vim
    ## Programming
    pipenv
    direnv
    python310
    nim
    nimlsp
    podman-compose
    sqlite
    ## Security
    tor
    torsocks
    ## Libs
    libtool
    libvterm

    # Rice
    breeze-icons
    starship
    sxhkd

    ## Services
    dunst
    libvirt
    dmenu
    ## Nixos
    nixos-generators
  ];
  ## Some programs need SUID wrappers, can be configured further or are
  ## started in user sessions.
  # programs.mtr.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.nm-applet.enable = true;


  programs.git = {
    package = pkgs.gitFull;
    enable = true;
  };
  programs.dconf = {
    enable = true;
  };
}
