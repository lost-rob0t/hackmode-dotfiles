{ config, lib, pkgs, ... }:
let
  name = "N545PY";
  email = "nsaspy@airmail.cc";
  
in
{
  imports = [ ./programs.nix ];
  home.username = "unseen";
  home.homeDirectory = "/home/unseen";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
      git = {
        enable = true;
        userName = "N545PY";
        userEmail = "nsaspy@airmail.cc";
      };
  emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
};
  };

}
