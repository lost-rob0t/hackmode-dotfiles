{ config, lib, pkgs, ... }:

# BUG this really doesnt work in nyxt yet
#let
#  nyxt = pkgs.nyxt.overrideAttrs (oldAttrs: {
#    postFixup = ''
#      wrapProgram $out/bin/nyxt \
#        --set-default WEBKIT_FORCE_SANDBOX 0
#    '';
#  });
#  in
#
{

  home.packages = with pkgs; [
    # Development
    gitRepo
    sqlitebrowser
    zeal
    vim
    lorri
    direnv
    # Multimedia
    vlc
    obs-studio
    gimp
    feh
    kdenlive
    mpv
    qbittorrent
    yt-dlp

    # System Tools
    gparted
    filezilla
    terminator
    remmina
    freerdp
    rpi-imager
    ark
    virt-manager
    virtiofsd

    # Productivity
    nerdfonts
    w3m
    cht-sh
    kleopatra
    gimp
    feh
    mindustry
    tlp
    # BUG nyxt
    webkitgtk
    remmina
    freerdp
    sqlitebrowser
    tdesktop
    rpi-imager
    ark
    kdenlive
    virt-viewer
    monero-gui
    gitRepo
    vscodium-fhs # FHS
    librewolf
    bookworm
    libsForQt5.kdeconnect-kde
    ntfy # send notifications

    # Security
    keepassxc
    hcxtools
    hashcat-utils
    hashcat

    # Web Browsers
    librewolf
    brave
    firefox
    # Communication
    discord
    obsidian
    element-desktop
    thunderbird
    # Misc
    monero-gui
    # GUI Toolkit
    webkitgtk

    # rice
    starship
    emojione # wttr widget emojis
    noto-fonts-emoji
    grc # colourize output
    sxhkd
    conky
    j4-dmenu-desktop
    fetchmail
    #
  ];
  programs = {
      gpg = {
          enable = true;
      };
 emacs = {
  enable = true;
  extraPackages = epkgs: [
      epkgs.vterm
      epkgs.direnv
      epkgs.lsp-pyright
      epkgs.pylint
      epkgs.w3m
      epkgs.pandoc
      pkgs.nodePackages.bash-language-server
      pkgs.roswell
      epkgs.xclip
      pkgs.aspell
      pkgs.aspellDicts.en
      pkgs.libnotify # for alert.el
      pkgs.xdotool # for emacs everywhere
      pkgs.ffmpegthumbnailer # Video thumbnails
      pkgs.imagemagick #photo thumbnails
      pkgs.mediainfo #audio previews
      pkgs.mpv # for bongo
      pkgs.pyright
      pkgs.python310
      pkgs.pylint
      pkgs.python310Packages.flake8
      pkgs.mu # Email for mu4e
      pkgs.isync
      pkgs.fetchmail

                         ];
};
  };
}
