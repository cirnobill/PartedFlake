{ inputs, self, ... }: {

  flake.darwinConfigurations.Osprey = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.ospreyModule
      self.darwinModules.darwinModule
    ];
  }

  flake.darwinModules.ospreyModule = { pkgs, ... }: {
    fonts.packages = with pkgs; [ nerd-fonts.meslo-lg ];

    networking = {
      computerName = "Osprey";
      hostName = "Osprey";
    };

    system = {
      primaryUser = "cirnobill";
      confirugationRevision = inputs.self.rev or inputs.self.dirtRev or null;
      stateVersion = 6;
    };

    users.users.cirnobill = {
      name = "cirnobill";
      home = "/Users/cirnobill";
    };
  };
}
