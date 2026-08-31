{ ... }:

{
  flake.modules.home.terminalEmulators.kitty = { ... }: {
    
    programs.kitty = {
			
      shellIntegration = {
        enableZshIntegration = true;
        mode = "no-rc";
      };

      settings = {
        confirm_os_window_close = -1;
        scrollback_lines = 10000;
        editor = ".";
        shell = ".";
        sync_to_monitor = "yes";    
      };
    };
  };
}
