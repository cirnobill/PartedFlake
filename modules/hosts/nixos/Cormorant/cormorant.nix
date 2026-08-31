{ inputs, self, ... }:

{
  flake.nixosConfigurations.Cormorant = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = with self.nixosModules; [
      cormorantConfig
      nvidia
    ];
  };

  flake.nixosModules.cormorantConfig = { config, pkgs, ... }: {

    boot = {
      extraModulePackages = with config.boot.kernelPackages; [ nct6687d ];
      kernelPackages = pkgs.linuxPackages_latest; # Uses latest kernel release instead of defaulting to latest LTS kernel
      kernelModules = [ "nct6687" ];
      loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
      };
    };

    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
      flatpak.enable = true;
    };

    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      kate
      konsole
      plasma-browser-integration
    ];

    networking = {
      hostName = "Cormorant";
      useNetworkd = true;
    };

    nixpkgs.config.allowUnfree = true;

    users.users.cirnobill = {
      isNormalUser = true;
      extraGroups = [ "wheel" "gamemode" "input" ];
      packages = with pkgs; [ tree ];
    };

    time = {
      hardwareClockInLocalTime = false;
      timeZone = "Australia/Perth";
    };

    system.stateVersion = "25.05";
  };
}
