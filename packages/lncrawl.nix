{
  python312Packages,
  fetchPypi,
  lib,
  stdenv,
  nodejs,
  calibre
}: let
  PyExecJS = python312Packages.buildPythonPackage rec {
    pname = "PyExecJS";
    version = "1.5.1";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-NMwdBwl2kYGD/3vcCtcfgVeokcknCMAMX7v/enafUFw=";
    };

    dependencies = with python312Packages; [ six nodejs ];
    build-system = with python312Packages; [ setuptools ];
  };
  pyease-grpc = python312Packages.buildPythonPackage rec {
    pname = "pyease-grpc";
    version = "1.7.1";
    format = "wheel";

    src = fetchPypi {
      pname = "pyease_grpc";
      inherit version format;
      dist = "py3";
      python = "py3";
      hash = "sha256-JfB89uiLUBo57cZ3nrHwh5jb8H+SoSiAfBf84IT+rUc=";
    };

    dependencies = with python312Packages; [ protobuf grpcio ];
  };
in python312Packages.buildPythonApplication rec {
  pname = "lightnovel-crawler";
  version = "3.10.1";
  format = "wheel";

  src = fetchPypi {
    pname = "lightnovel_crawler";
    inherit version format;
    dist = "py3";
    python = "py3";
    hash = "sha256-asSfY7Pah5IxVIdAxjMWqErLlaPmFzAySf3XJRO/xO8=";
  };

  dependencies = with python312Packages; [
    colorama
    python-box
    questionary
    beautifulsoup4
    requests
    packaging
    cloudscraper
    pillow
    tenacity
    tqdm
    readability-lxml
    python-slugify
    selenium
    six
    nodejs
    PyExecJS
    regex
    protobuf
    grpcio
    pyease-grpc
    ebooklib
  ] ++ lib.optionals (!stdenv.isDarwin) [
    calibre
  ];
}