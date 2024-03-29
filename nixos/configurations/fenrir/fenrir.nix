{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nix_2_7
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
  nixpkgs.config.allowUnfree = true;


  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
      ./networking.nix
      ./security.nix
      ./misc.nix
    ];

  # Boot config
  boot.initrd.luks.devices = {
  crypted = {
    device = "/dev/disk/by-uuid/fe6c691d-c7bc-4a06-b65f-8b4e32ad8242";
    allowDiscards = true; # Used if primary device is a SSD
    preLVM = true;
    bypassWorkqueues = true;
  };
 };
  boot.loader.systemd-boot.enable = true;
 # Set your time zone.
  time.timeZone = "America/New_York";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.unseen = {
    isNormalUser = true;
    subUidRanges = [{ startUid = 100000; count = 65536; }];
    subGidRanges = [{ startGid = 100000; count = 65536; }];
    extraGroups = [ "wheel" # Sudo
                    "libvirtd"
                    "adbusers"
                  ];
  };



  environment.pathsToLink = [ "/share/hunspell" "/share/myspell" "/share/hyphen" ];

  environment.variables.DICPATH = "/run/current-system/sw/share/hunspell:/run/current-system/sw/share/hyphen";
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  #systemd.extraConfig = "DefaultLimitNOFILE=8096:524288";
  #
}
