{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "N545PY";
    userEmail = "nsaspy@airmail.cc";
  };
  programs.emacs = {
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

                         ];
};
}