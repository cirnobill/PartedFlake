{
  description = "Flake-part fuckery [real description still in the works]";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:denful/import-tree";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # This should point to whichever nixpkgs rev you want.
    nixvim.url = "github:nix-community/nixvim";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; }
      (inputs.import-tree ./modules);
}
