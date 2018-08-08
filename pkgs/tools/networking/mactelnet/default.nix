{ lib, stdenv, fetchFromGitHub, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "mactelnet-${version}";
  version = "0.4.4";

  src = fetchFromGitHub {
    owner = "haakonnessjoen";
    repo = "MAC-Telnet";
    rev = "v${version}";
    sha256 = "1z63dz22crrvrm0sh2cwpyqb7wqd9m45m6f2641mwmyp6hcpf4k4";
  };

  patchPhase = ''
    substituteInPlace config/Makefile.am --replace chown true
  '';

  buildInputs = [ autoreconfHook ];

  meta = with lib; {
    description = "Client and server implementation of MikroTik MAC-Telnet protocol";
    homepage = https://github.com/haakonnessjoen/MAC-Telnet;
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ astsmtl ];
    platforms = platforms.linux;
  };
}
