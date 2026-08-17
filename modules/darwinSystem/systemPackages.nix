{ pkgs, ... }:

{
  flake.darwinPackages.systemPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
