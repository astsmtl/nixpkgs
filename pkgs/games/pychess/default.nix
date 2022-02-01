{ lib, python3, fetchFromGitHub }:

python3.pkgs.buildPythonApplication rec {
  pname = "pychess";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "pychess";
    repo = "pychess";
    rev = "${version}";
    hash = "sha256:A18Ott//2TDuYXEHgFNCVZ4SwyOyOQ+ZFt/1XMuKNUM=";
  };

  propagatedBuildInputs = with python3.pkgs;
    [ pexpect pygobject3 sqlalchemy ];
}
