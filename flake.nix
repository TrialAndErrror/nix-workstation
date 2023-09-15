{
  description = "Nix Workstation by Trial and Errror";
  nixConfig.bash-prompt = "\[nix-develop\]$ ";
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
    apps.${system}.default = "pkgs.zellij";
    devShells.${system}.default = pkgs.mkShell {
      inherit basic_devshell nvim_config;
      buildInputs = with pkgs; [
        lazygit
        gh
        gitkraken

        jetbrains.clion
        jetbrains.pycharm-professional

        apostrophe
        vlc
        yt-dlp

        # Like a shell, but better
        nushell

        # Python tools
        python3
        black
        poetry

        # Rust tools
        rustup
        cargo
        bacon # rust debugging

        # Command line tools
        exa # better ls
        du-dust # disk usage
        bat # syntax highlighting on cat

        zellij # better tmux
        mprocs # monitor long running processes

        ripgrep # fast search

        lazydocker
        gitui # lazygit replacement

        # include neovim-flake
        nvim_config.packages.x86_64-linux.default
      ];

      shellHook = ''
        echo "Welcome to Wade's Nix shell!"
        echo "You have access to:

        # VCS
        github cli (gh).
        gitkraken
        lazygit / lazydocker
        gitui

        # Python tools
        python3 (3.10.11)
        black
        poetry

        # Rust tools
        rustup
        cargo
        bacon # rust debugging

        # Editors
        nvim
        Pycharm Pro
        CLion
        sublime
        apostrophe

        # VCS
        git
        github cli (gh).
        gitkraken
        lazygit / lazydocker
        gitui

        # Command line tools
        nushell
        ripgrep
        exa # better ls
        du-dust # disk usage
        bat # syntax highlighting on cat

        zellij # better tmux
        mprocs # monitor long running processes
        "
      '';
    };
  };
}
