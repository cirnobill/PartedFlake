{ pkgs, ... }:

{
  flake.modules.darwin.systemPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
