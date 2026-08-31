{ pkgs, ... }:

{
  flake.home.packages = with pkgs; [
    alsa-scarlett-gui
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
}
