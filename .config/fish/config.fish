if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi nvim
    alias vim nvim
    alias g git

    if [ -f $HOME/.config/fish/ssh_alias.fish ]
        source $HOME/.config/fish/ssh_alias.fish
    end

    source $HOME/.config/fish/kanagawa.fish

    if type -q exa
        alias ll "exa -l -g --icons"
        alias lla "ll -a"
    end
    if type -q zoxide
        zoxide init fish | source
    end
    if test (uname) = Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /Users/hep/Library/Python/3.8/bin
    end
    if test (uname) = Linux
        fish_add_path ~/.local/bin
    end
end

# pnpm
set -gx PNPM_HOME /Users/hep/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
