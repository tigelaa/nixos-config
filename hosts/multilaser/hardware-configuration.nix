{ ... }:

{
  boot.initrd.availableKernelModules = [
    "mmc_block"
    "sdhci"
    "sdhci_acpi"
    "sdhci_pci"
    "xhci_pci"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
