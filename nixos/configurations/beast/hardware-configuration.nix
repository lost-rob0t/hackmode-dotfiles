# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "dm-raid" ];
  boot.kernelModules = [ "kvm-amd" "amdgpu" "dm-raid" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/dfced3b1-91f1-445a-ab83-2345f4a45440";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-partuuid/e3b65262-076c-40e5-9686-7c3717a9fc0a";
      fsType = "vfat";
    };
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/50c6fc4b-c3ef-49ae-9779-d0b586849eb5";
    fsType = "ext4";
  };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/a13703b7-ce75-453f-8d67-474523e051f8"; }
    ];

  hardware = {
    bluetooth = {
      enable = true;
    };
    cpu.amd = {
      updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };
}
