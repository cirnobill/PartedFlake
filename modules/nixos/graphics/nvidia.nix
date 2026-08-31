{ ... }:

{
  flake.nixosModules.graphics.nvidia = { config, pkgs, ... }: {

    boot.kernelParams = [
      "initcall_blacklist=simpledrm_platform_driver_init" # Disables simpledrm from initiatlising so that NVIDIA DRM can load first
      "nvidia.NVreg_TemporaryFilePath=/var/tmp" # Sets the location for Nvidia GPU temp files to a non-tmpfs location (Useful for hibernation and suspending to RAM)
    ];

    environment.sessionVariables = { 
      LIBVA_DRIVER_NAME = "nvidia";
      NVD_BACKEND = "direct";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";
    };
    
    hardware = {

      graphics = {
	enable = true;
	enable32Bit = true;
	extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      };

      nvidia = {
	open = false;
	package = config.boot.kernelPackages.nvidiaPackages.latest;
	powerManagement.enable = true;
      };
    };

    services.xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
}
