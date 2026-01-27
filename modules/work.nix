{ config, ... }:

{
  programs.git = {
    includes = [
      {
        condition = "gitdir:~/projects/";
        contents = {
          user = {
            name = "Florence Wolfe";
            email = "florence@oscilar.com";
          };

          # Optional but recommended: enforce SSH usage
          core.sshCommand = "ssh -i ~/.ssh/id_ed25519_oscilar";
        };
      }
    ];
  };

  programs.ssh.matchBlocks = {
    "github.com" = {
      identityFile = "~/.ssh/id_ed25519_oscilar";
      extraOptions = {
        AddKeysToAgent = "yes";
        UseKeychain = "yes";
        IdentitiesOnly = "yes";
      };
    };
  };
}
