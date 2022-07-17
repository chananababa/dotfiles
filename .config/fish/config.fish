if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vi=nvim
    alias vim=nvim
	if type -q exa
		alias ll "exa -l -g --icons"
		alias lla "ll -a"
	end
end

