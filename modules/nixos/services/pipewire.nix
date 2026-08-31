{ ... }:

{
  flake.nixosModules.services.pipewire = { ... }: {
    
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      audio.enable = true;
      jack.enable = true;
      pulse.enable = true;

      extraConfig = {
      
        pipewire."92-low-latency" = {

	  "context.properties" = {
	    "default.clock.rate" = 48000;
	    "default.clock.quantum" = 128;
	    "default.clock.min-quantum" = 128;
	    "default.clock.max-quantum" = 128;
	  };
	};

	pipewire-pulse."92-low-latency" = {
	  
	  "context.properties" = [
	    {
	      name = "libpipewire-module-protocol-pulse";
	      args = { };
	    }
	  ];

	  "pulse.properties" = {
	    "pulse.min.req" = "128/48000";
	    "pulse.default.req" = "128/48000";
	    "pulse.max.req" = "128/48000";
	    "pulse.min.quantum" = "128/48000";
	    "pulse.max.quantum" = "128/48000";
	  };

	  "stream.properties" = {
	    "node.latency" = "128/48000";
	    "resample.quality" = 1;
	  };
	};
      };

      wireplumber.extraConfig = {
        
        "99-disable-suspend" = {

          "monitor.alsa.rules" = [
            {
              matches = [
		{
		  "node.name" = "~alsa_input.*";
		}
        	{
        	  "node.name" = "~alsa_output.*";
        	}
              ];
              
              actions.update-props."session.suspend-timeout-seconds" = 0;
            }
          ];
        };
      };
    };
  };
}
