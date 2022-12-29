{ config, lib, pkgs, nimPackages, ... }:

## Packages and programs go here
let
  unseen = import <unseen> { config.allowUnfree = true; };

in
{
   nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
    #(import "/etc/nixos/nixos-overlay/overlay.nix")
    (self: super: {
      python3Packages = super.python3Packages.override {
        overrides = pfinal: pprev: {
          dbus-next = pprev.dbus-next.overridePythonAttrs (old: {
            #  temporary fix for https://github.com/NixOS/nixpkgs/issues/197408
            checkPhase = builtins.replaceStrings ["not test_peer_interface"] ["not test_peer_interface and not test_tcp_connection_with_forwarding"] old.checkPhase;
          });
        };
      };
    })
    #(self: super: {
    #  i2p = super.i2p.overrideDerivation (old: rec {
    #    version = "2.0.0";
    #    src = fetchurl {
    #      url = "https://files.i2p-projekt.de/${version}/i2psource_${version}.tar.bz2";
    #      sha256 = "16chvycw4i7nkdl3fj49y5r0sn28r8clqn6m8g63kwd8f8g86l0x";
    #    };
    #  });
    #})

    (self: super:  {
      qtile = super.qtile.unwrapped.override (old: {
        propagatedBuildInputs = (old.propagatedBuildInputs or []) ++ (with self.python3Packages; [
          requests
          pkgs.sxhkd
          pkgs.j4-dmenu-desktop
          pkgs.dmenu
          pkgs.brave
          pkgs.firefox
          pkgs.emacs
          pkgs.nerdfonts
          pkgs.conky
        ]);
      });
    })
    
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
    unzip
    bash
    zsh
    p7zip
    coreutils
    pandoc #emacs
    hunspellDicts.en_US
    xclip
    ispell
    ## Android
    android-tools
    android-studio
    ## User Programs
    ungoogled-chromium
    brave
    thunderbird
    tor-browser-bundle-bin
    vim
    virt-manager
    virtiofsd
    element-desktop
    qbittorrent
    terminator
    lbry ## You should use lbry and other yotube alternatives
    yt-dlp
    libsForQt5.kdeconnect-kde
    ntfy # send notifications
    #mypkgs.nimPackages.puffer
    ## Games
    lutris
    steam-run-native
    wineWowPackages.staging
    winetricks
    faudio
    xboxdrv
    qjoypad
    ##(winetricks.override { wine = wineWowPackages.staging; })

    ## Programming
    pipenv
    direnv
    python310
    nim nimlsp
    podman-compose
    rnix-lsp
    sqlite
    gforth
    racket
    sbcl
    roswell
    ## Security
    keepassxc
    tor
    torsocks
    i2p
    hashcat
    veracrypt
    opensnitch-ui
#    kwalletmanager
    gnome.gnome-keyring

    #mypkgs.maltego
    ## Libs
    libtool
    libvterm
    jdk11

    ((emacsPackagesFor emacsPgtk).emacsWithPackages (epkgs: [
      epkgs.vterm
      epkgs.ac-ispell
      epkgs.direnv
      epkgs.lsp-pyright
      epkgs.pylint
      epkgs.w3m
      epkgs.pandoc
      unseen.nimPackages.nimsuggest
      unseen.nodePackages.bash-language-server
      unseen.roswell
      epkgs.xclip
      pkgs.aspell
      pkgs.aspellDicts.en
      pkgs.libnotify # for alert.el
      pkgs.xdotool # for emacs everywhere
    ]))

    # Rice
    breeze-icons
    starship
    variety
    sxhkd

    ly #login manager
    xorg.xinit
    j4-dmenu-desktop
    pkgs.dmenu
    conky
    ## Services
    dunst
    libvirt
    dmenu
    blueman
    ## Nixos
    nixos-generators

    ## Needed for spice
    spice-vdagent
  ];
 hardware.opengl.extraPackages = with pkgs; [
   rocm-opencl-icd
   rocm-opencl-runtime
   ##amdvlk
];
  ## Some programs need SUID wrappers, can be configured further or are
  ## started in user sessions.
  # programs.mtr.enable = true;

  programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
  };
  programs.adb.enable = true;
  programs.nm-applet.enable = true;


  programs.git = {
    package = pkgs.gitFull;
    enable = true;
  };
  programs.dconf = {
    enable = true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.kdeconnect = {
   enable = true;
  };
}
