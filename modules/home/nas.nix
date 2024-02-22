{ pkgs, config, ... }: {
  imports = [ ../linux ];
  home = rec {
    username = "frank.robert";
    homeDirectory = "/volume1/homes/frank.robert";
    sessionVariables = {
      LC_ALL = "en_US.utf-8";
      LOCALE_ARCHIVE = "/usr/lib/locale/locale-archive";
      LANG = "en_US.utf-8";
      LC_CTYPE = "en_US.utf-8";
      TMPDIR = "/tmp-nix";
    };
    packages = [
      pkgs.netcat
      pkgs.unzip
      pkgs.gcc48
      pkgs.cmake
      pkgs.glibcLocalesUtf8
      pkgs.glibc
      pkgs.procps
      pkgs.libclang
    ];
  };
  programs.zsh.initExtra = ''
    ${builtins.readFile ../../system/extras.rc}
  '';
  systemd = {
    user = {
      # TODO: symlink LDD to /usr/bin/ldd
      # TODO: symlink GCC to /usr/bin/gcc
      tmpfiles = {
        rules = [
          "L+ /lib/${
            builtins.baseNameOf pkgs.stdenv.cc.bintools.dynamicLinker
          } - - - - ${pkgs.stdenv.cc.bintools.dynamicLinker}"
          "L+ /lib64 - - - - /lib"
        ];
      };
    };
  };
}
