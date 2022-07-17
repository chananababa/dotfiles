function move_to_repo
	cd $(ghq list -p | peco)
end

function fish_user_key_bindings
	bind \cr move_to_repo
end
