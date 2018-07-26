{ buildFHSUserEnv }:

buildFHSUserEnv {
  name = "unreal-dev";
  targetPkgs = pkgs: (
    with pkgs;
    [ bash
      curl
      gnumake
      libglvnd
      mono
      which
      strace
      xdg-user-dirs
      xdg_utils
      zlib
    ]
  );
  runScript = "bash";
}
