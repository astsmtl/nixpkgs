{ lib, stdenv, fetchurl}:

stdenv.mkDerivation rec {
  pname = "qm-vamp-plugins";
  version = "1.8.0";

  src = fetchurl {
    url = "https://code.soundsoftware.ac.uk/attachments/download/2624/qm-vamp-plugins-${version}.tar.gz";
    hash = "sha256-h1xeNSR7nkST4W/3BMVHLhPzOfj7nFmiZ1lSIbi0xmw=";
  };

  makefile = "build/linux/Makefile.linux64";

  installPhase = ''
    vamp_dir="$out/lib/vamp"
    mkdir -p "$vamp_dir"
    cp qm-vamp-plugins.{so,cat,n3} "$vamp_dir"
  '';

  meta = with lib; {
    description = "A library of Vamp audio feature extraction plugins";
    homepage = "https://code.soundsoftware.ac.uk/projects/qm-vamp-plugins";
    license = licenses.gpl2Plus;
    maintainers = [ maintainers.astsmtl ];
    platforms = platforms.unix;
  };
}
