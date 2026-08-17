{ inputs, self, ... }:

{
  flake.darwinConfigurations.Osprey = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = { inherit inputs; };
    modules = [
      self.darwinModules.ospreyModule
    ];
  };

  flake.darwinModules.ospreyModule = { pkgs, ... }: {
  
    environment.systemPackages = with pkgs; [ tree ];
    nix.settings.experimental-features = "nix-command flakes";
    security.pam.services.sudo_local.touchIdAuth = true;
    fonts.packages = with pkgs; [ nerd-fonts.meslo-lg ];

    networking = {
      computerName = "Osprey";
      hostName = "Osprey";
    };

    system = {
      primaryUser = "cirnobill";
      configurationRevision = inputs.self.rev or inputs.self.dirtRev or null;
      stateVersion = 6;
    };

    users.users.cirnobill = {
      name = "cirnobill";
      home = "/Users/cirnobill";
    };
  };
}
