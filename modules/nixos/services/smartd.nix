{ ... }:

{
  flake.nixosModules.services.smartd = { ... }: {

    services.smartd = {
      enable = true;
      devices = [ { device = "dev/disk/by-id/nvme-Samsung_SSD_970_EVO_1TB_S5H9NS0N438833N"; } ];
    };
  };
}

