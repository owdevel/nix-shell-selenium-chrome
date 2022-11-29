{pkgs ? import <nixpkgs> {}}:

# Use the selenium-python package from nixos
# https://nixos.wiki/wiki/Python
let 
  my-python = pkgs.python3;
  python-with-my-packages = my-python.withPackages (p: with p; [
    selenium
  ]);
in
pkgs.mkShell {
  packages = [
    python-with-my-packages

    # Chrome driver and google-chrome dependencies
    pkgs.chromedriver
    pkgs.google-chrome

    # Create a script to run google-chrome-stable
    (pkgs.writeShellScriptBin "google-chrome" "exec -a $0 ${pkgs.google-chrome}/bin/google-chrome-stable $@")
  ];
}