{pkgs ? import <nixpkgs> {}}:

let 
  my-python = pkgs.python3;
  python-with-my-packages = my-python.withPackages (p: with p; [
    selenium
  ]);
in
pkgs.mkShell {
  packages = [
    python-with-my-packages
    pkgs.chromedriver
    pkgs.google-chrome
    (pkgs.writeShellScriptBin "google-chrome" "exec -a $0 ${pkgs.google-chrome}/bin/google-chrome-stable $@")
  ];
}