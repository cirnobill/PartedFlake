{ ... }:

{
  flake.homeModules.textEditors.nixvim = { inputs, pkgs, ... }: {
    imports = [ inputs.nixvim.homeModules.default ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.catppuccin.enable = true;
       
      plugins = {

        lualine.enable = true;
	telescope.enable = true;
        web-devicons.enable = true;
       
	lsp = {
       	  enable = true;
       	 
       	  servers = {
	    hyprls.enable = true;
       	    nixd.enable = true;
	    lua_ls.enable = true;
       	  };
       	};

        treesitter = {
          enable = true;
         
          grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [  
            bash
            css
            html
            http
            hyprlang
            json
            lua
            make
            markdown
            nix
            regex
            toml
            vim
            vimdoc
            xml
            yaml 
          ];

          settings = {
            highlight.enable = true;
            incremental_selection.enable = true;
            indent.enable = true;
          };
        };
      };
    };
  };
}
