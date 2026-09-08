{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "nix";

  boot.loader.grub = {
    enable = true;
    device = "/dev/mmcblk0";
  };

  boot.loader.timeout = 3;

  hardware.enableRedistributableFirmware = true;
  hardware.graphics.extraPackages = [ pkgs.intel-media-driver ];
  hardware.cpu.intel.updateMicrocode = true;

  system.stateVersion = "26.05";
}
