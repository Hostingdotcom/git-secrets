#Create alias to setup 'git-secrets' in the current repo
# put in ~/.config/fish/functions
function git-secrets
	git secrets --install
	git secrets --register-aws
end