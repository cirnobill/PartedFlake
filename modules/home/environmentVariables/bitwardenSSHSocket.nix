{ ... }:

{
  flake.modules.home.environmentVariables.sessionVariables = { ... }: {
   
    config.home.sessionVariables = {
      SSH_AUTH_SOCK = "/home/cirnobill/.bitwarden-ssh-agent.sock";
    };
  };
}
