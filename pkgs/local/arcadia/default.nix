{ buildFHSUserEnv }:

buildFHSUserEnv {
  name = "arcadia";
  targetPkgs = pkgs: (with pkgs;
    [ glibc glibc.dev
      openssh
      perl
      python
      strace
      zlib zlib.static
    ]);
  runScript = "bash";
}
