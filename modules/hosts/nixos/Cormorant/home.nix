{ ... }:

{
  flake.nixosModules.cormorantHome = { config, self, ... }: {
    imports = with self.modules.home; [
      environmentVariables.sessionVariables
      terminalEmulators.kitty
    ];

    home = {
      username = "cirnobill";
      homeDirectory = "/home/cirnobill";
      stateVersion = "26.11";
    };

    # Declare defaults using the custom options defined in each module category's 'default.nix' module

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    programs = {
    
      firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
      };

      home-manager.enable = true;
    };
  };
}
