{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    lazygit
    gh
    gitkraken

    python3
    rustup
    cargo

    sublime
    neovim

    jetbrains.clion
    jetbrains.pycharm-professional

    ripgrep

    apostrophe
  ];

  shellHook = ''
    echo "Welcome to Wade's Nix shell!"
    echo "You have access to:
    
    git
    github cli (gh).
    gitkraken
    lazygit
    
    python3 (3.10.11)
    
    sublime
    neovim (nvim)
    CLion
    Pycharm Pro
    
    ripgrep
    
    apostrophe
    "
  '';
}
