if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi nvim
    alias vim nvim
    alias g git

    alias dev2="ssh hep@192.168.20.41"
    alias dev3="ssh hep@192.168.20.35"
    alias rel="ssh -p 22022 release_bot@192.168.10.40"
    alias demo="ssh hep@192.168.50.5"
    alias res="ssh hep@172.31.10.42"

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
