{ inputs, pkgs, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  security.pam.services.sudo_local.touchIdAuth = true;
  fonts.packages = [ pkgs.nerd-fonts.meslo-lg ];
	
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
    packages = with pkgs; [ tree ];
  };
}
