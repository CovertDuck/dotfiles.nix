{ config, pkgs, user, ... }:

{
    ##====##
    # HOME #
    ##====##
    home = {
        username = ${user};
        homeDirectory = if builtins.isDarwin then "/Users/${user}" else "/home/${user}";

        packages = with pkgs; [
            zsh
            fastfetch
            eza
            fzf
            bat
            tmux
            screen
            ripgrep
        ];
    };

    home.username = username;
    home.homeDirectory = if builtins.isDarwin then "/Users/${username}" else "/home/${username}";

    ##========##
    # PROGRAMS #
    ##========##
    programs = {
        home-manager.enable = true;
        vscode.enable = true;
        vscode.package = pkgs.vscodium;
    };
}
