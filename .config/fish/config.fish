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

    # Nightfox Color Palette
    # Style: nightfox
    # Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_fish.fish
    set -l foreground cdcecf
    set -l selection 2b3b51
    set -l comment 738091
    set -l red c94f6d
    set -l orange f4a261
    set -l yellow dbc074
    set -l green 81b29a
    set -l purple 9d79d6
    set -l cyan 63cdcf
    set -l pink d67ad2

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
end
