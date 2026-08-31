{ ... }:

{
  flake.modules.darwin.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.meslo-lg
    ];
  };
}
