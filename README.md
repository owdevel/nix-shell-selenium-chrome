# Nix-shell Selenium with Google Chrome Binary

Simple example of using `nix-shell` to create a development environment for `selenium` in python using `chromedriver` and the `google-chrome` binary.

The nixpkgs version of [google-chrome](https://github.com/NixOS/nixpkgs/blob/nixos-22.05/pkgs/applications/networking/browsers/google-chrome/default.nix#L163) appends the channel (stable/beta/dev) to the binary name which causes selenium to not be able to find the correct binary as it is looking for the binary name `google-chrome` not `google-chrome-stable`.

This repo uses `writeShellScriptBin` to create a `google-chrome` script which exectues the correct binary.
Credit goes to this [reddit post](https://www.reddit.com/r/NixOS/comments/nur5zv/simple_way_to_rename_symlink_or_wrap_a_system/) for the idea.

Tested on nix-os 22.05.

## TLDR
Add this to your `shell.nix` packages.
```
(pkgs.writeShellScriptBin "google-chrome" "exec -a $0 ${pkgs.google-chrome}/bin/google-chrome-stable $@")
```

## Author's Note
As of writing this I'm still new to Nix-OS and the related ecosystem.
If there is a better way of doing this please let me know :).