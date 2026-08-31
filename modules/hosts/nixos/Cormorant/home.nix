{ config, inputs, nixpkgs, pkgs, ... }:

{
  flake.homeConfigurations.cirnobill = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    modules = with inputs.self.homeModules; [
      environmentVariables.sessionVariables
      terminalEmulators.kitty
      textEditors.nixvim
      {
	home = {
	  username = "cirnobill";
	  homeDirectory = "/home/cirnobill";
	  stateVersion = "26.11";
	};
      }
    ];

    home.programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };

    home.packages = with pkgs; [
      alsa-scarlett-gui
      bitwarden-desktop
      cider-2
      gimp
      handbrake
      imv
      mpv
      pcsx2
      pwvucontrol
      qpwgraph
      thunderbird
    ];
  };
}
