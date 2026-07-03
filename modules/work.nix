{ config, ... }:

{
  programs.git = {
    includes =
      let
        workSsh = "ssh -i ~/.ssh/id_ed25519_oscilar";

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

          core.sshCommand = workSsh;

          # Pin the gh credential helper to the work account in work dirs,
          # so a personal gh account can be the active one everywhere else.
          credential."https://github.com".username = "florence-oscilar";
        };
      in
      # Work identity and credentials apply only inside the work
      # directories. gitdir matches the resolved .git dir, so linked
      # worktrees of ~/projects/frontend (frontend.osc-1234-*) resolve to
      # ~/projects/frontend/.git/worktrees/* and are covered by the
      # frontend/ pattern; frontend.*/ additionally catches standalone
      # clones named like a worktree. A trailing / means "and everything
      # under it".
      map
        (dir: {
          condition = "gitdir:${dir}";
          contents = oscilar;
        })
        [
          "~/projects/apis/"
          "~/projects/backend/"
          "~/projects/frontend/"
          "~/projects/frontend.*/"
        ]
      # pnpm clones the @oscilar/apis git dep (git@github.com:oscilar/apis.git)
      # into its own cache outside the work dirs, so the work SSH key — and
      # only the key, no identity — stays scoped by remote URL. hasconfig
      # matching is case-sensitive and literal, so both org spellings and
      # all URL schemes must be listed.
      ++ map
        (url: {
          condition = "hasconfig:remote.*.url:${url}";
          contents.core.sshCommand = workSsh;
        })
        [
          "https://github.com/Oscilar/**"
          "https://github.com/oscilar/**"
          "git@github.com:Oscilar/**"
          "git@github.com:oscilar/**"
          "ssh://git@github.com/Oscilar/**"
          "ssh://git@github.com/oscilar/**"
        ];
  };
}
