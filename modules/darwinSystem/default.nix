{ lib, ... }:

{
  imports = [
    # ./homebrew.nix
    ./systemPackages.nix
    ./fonts
  ];

  #homebrew.enable = lib.mkDefault true;
}
