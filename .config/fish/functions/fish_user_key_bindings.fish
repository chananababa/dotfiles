function move_to_repo
	set selected_repository (ghq list -p | peco --query "$LBUFFER")
	if [ -n "$selected_repository" ]
		cd $selected_repository
		echo $selected_repository
		commandline -f repaint
	end
end

function fish_user_key_bindings
	bind \cr move_to_repo
end
