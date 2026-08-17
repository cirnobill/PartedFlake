{ pkgs, ... }:

{
  flake.darwinFonts.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.meslo-lg
    ];
  };
}
