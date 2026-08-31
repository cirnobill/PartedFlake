{ 
  flake.nixosModules.cormorantConfig = { config, lib, pkgs, modulesPath, ... }:

  {		
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/44556b5c-6a73-45eb-8240-4171b1e7f678";
        fsType = "btrfs";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/A7DA-B91F";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/23e6cc8e-3bdc-429f-a970-0b0453f9877b"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
