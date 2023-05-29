{ pkgs ? import <nixpkgs> {}}:
  pkgs.mkShell {
    buildInputs = with pkgs; [ 
      git
      python3
      sublime
      firefox
      neovim
      ripgrep
      lazygit
      apostrophe
      gh
    ]; 

    shellHook = ''
      echo "Welcome to Wade's Nix shell!"
      echo "You have access to: 
      git
      python3 (3.10.11)
      sublime
      firefox
      neovim (nvim)
      ripgrep
      lazygit
      apostrophe
      github cli (gh)."
    '';
}
