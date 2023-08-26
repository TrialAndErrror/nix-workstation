{
  description = "Nix Workstation by Trial and Errror";

  # Links to import more basic flakes by default
  inputs = {
    basic_devshell = {
      url = "github:TrialAndErrror/nix-devshell";
      flake = true;
    };
    nvim_config = {
      url = "github:TrialAndErrror/neovim-flake";
      flake = true;
    };
  };

  outputs = {
    self,
    nixpkgs,
    basic_devshell,
    nvim_config,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        git
        lazygit
        gh
        gitkraken

        python3
        rustup
        cargo

        jetbrains.clion
        jetbrains.pycharm-professional

        ripgrep

        apostrophe
        vlc
        yt-dlp

        basic_devshell.devShells.x86_64-linux.default
        nvim_config.devShells.x86_64-linux.default
      ];

      shellHook = ''
        echo "Welcome to Wade's Nix shell!"
        echo "You have access to:

        git
        github cli (gh).
        gitkraken
        lazygit

        python3 (3.10.11)

        rustup
        cargo

        sublime
        CLion
        Pycharm Pro

        ripgrep

        apostrophe
        vlc
        yt-dlp

        "
      '';
    };
  };
}
