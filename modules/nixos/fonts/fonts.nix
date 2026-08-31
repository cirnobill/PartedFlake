{ ... }:

{
  flake.nixosModules.fonts = { pkgs, ... }: {

    fonts.packages = with pkgs; [
      font-awesome
      nerd-fonts.meslo-lg
      nerd-fonts.symbols-only
    ];
  };
}
