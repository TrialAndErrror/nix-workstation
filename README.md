# nix-devshell
This is a repo that hosts a nix flake for my current full Workstation. It is subject to change, so be sure to tag to a commit if you want stable features

## Usage
Currently it's only available in `develop` mode, as it only sets up a default devshell.
It also doesn't have inherent support for unfree packages, so you need to have allow_unfree = true in your nix configuration or use the included environment variable declarations.

### If you have a Nix Config file that allows unfree packages:
```
nix develop --impure 'github:TrialAndErrror/nix-workstation'
```

### If you don't have a Nix Config file:
```
NIXPKGS_ALLOW_UNFREE=1 NIXPKGS_ALLOW_UNSTABLE=1 nix develop --impure 'github:TrialAndErrror/nix-workstation'
```

### If you don't have flakes enabled in your nix configuration (or you're unsure why the above ones didn't work:
```
NIXPKGS_ALLOW_UNFREE=1 NIXPKGS_ALLOW_UNSTABLE=1 nix --experimental-features 'nix-command flakes' develop --impure 'github:TrialAndErrror/nix-workstation'
```
