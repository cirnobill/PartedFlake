{ inputs, ... }:

{
  config = lib.mkIf config.homebrew.enable {

    homebrew = {
      enableZshIntegration = true;

      onActivation.cleanup = "uninstall";

      casks = [
        "discord"
        "handbrake-app"
        "obs"
        "steam"
        "vlc"
      ];

      masApps =
        {
          Bitwarden = 1352778147;
          CrystalFetch = 6454431289;
          "UTM Virtual Machines" = 1538878817;
          "Logic Pro" = 634148309;
          "Steam Link" = 1246969117;
          "WiFi Explorer: Scanner" = 494803304;
        };
    };
  }; 
}

