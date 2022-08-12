if status is-interactive
    # Commands to run in interactive sessions can go here

    alias vi nvim
    alias vim nvim
    alias g git
    if type -q exa
        alias ll "exa -l -g --icons"
        alias lla "ll -a"
    end
    if type -q zoxide
        zoxide init fish | source
    end
    if test (uname) = Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path ~/Library/Python/3.8/bin
    end
    if test (uname) = Linux
        fish_add_path ~/.local/bin
    end
end
