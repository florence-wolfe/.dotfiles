{ config, ... }:

{
  programs.git = {
    includes =
      let
        oscilar = {
          user = {
            name = "Florence Wolfe";
            email = "florence@oscilar.com";
            # GPG signing key for work commits (florence@oscilar.com)
            signingKey = "509B3FF8A291199D";
          };

          # Sign commits and tags by default in work repos
          commit.gpgSign = true;
          tag.gpgSign = true;

          core.sshCommand = "ssh -i ~/.ssh/id_ed25519_oscilar";
        };
      in
      # Scoped by remote URL rather than directory: applies to any clone or
      # worktree of an Oscilar repo, and never to personal repos, wherever
      # they live on disk.
      [
        {
          condition = "hasconfig:remote.*.url:https://github.com/Oscilar/**";
          contents = oscilar;
        }
        {
          condition = "hasconfig:remote.*.url:git@github.com:Oscilar/**";
          contents = oscilar;
        }
      ];
  };
}
