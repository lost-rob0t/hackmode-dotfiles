{ config, lib, pkgs, ... }:

## Packages and programs go here
let
  mypkgs = import <personal> {};

in
{
   nixpkgs.config.allowUnfree = true;
   nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
    (import "/etc/nixos/nixos-overlay/overlay.nix")
    ];
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
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
    atop
    clinfo
    ispell
    unzip
    bash
    zsh
    p7zip
    coreutils
    pandoc #emacs
    hunspellDicts.en_US

    ## User Programs
    ungoogled-chromium
    brave
    thunderbird
    tor-browser-bundle-bin
    vim
    virt-manager
    element-desktop
    qbittorrent

    lbry ## You should use lbry and other yotube alternatives
    yt-dlp
    mypkgs.puffer
    ## Games
    steam-run-native

    ## Programming
    pipenv
    direnv
    python310
    nim nimlsp
    podman-compose
    rnix-lsp
    sqlite
    ## Security
    keepassxc
    tor
    torsocks
    hashcat
    veracrypt
    ## Libs
    libtool
    libvterm
    jdk11
    ((emacsPackagesFor emacsNativeComp).emacsWithPackages (epkgs: [
      epkgs.vterm
      epkgs.ac-ispell
      epkgs.direnv
      epkgs.lsp-pyright
      epkgs.pylint
      epkgs.w3m
      epkgs.pandoc
    ]))

    # Rice
    breeze-icons
    starship
    variety
    sxhkd
    ## Services
    dunst
    libvirt
    dmenu
    ## Nixos
    nixos-generators
  ];
 hardware.opengl.extraPackages = with pkgs; [
   rocm-opencl-icd
   rocm-opencl-runtime
   amdvlk
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
