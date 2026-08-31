{ inputs, self, ... }:

{
  flake.darwinConfigurations.Osprey = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = { inherit inputs; };
    modules = with self.modules.darwin; [
      ospreyModule
      macosModule
      systemPackages
    ];
  };

  flake.modules.darwin.ospreyModule = { ... }: {

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
