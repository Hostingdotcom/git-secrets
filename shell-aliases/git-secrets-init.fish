#Create alias to run git init and git-secrets in one shot
# put in ~/.config/fish/functions
function git-secrets-init
    git init
	git secrets --install
	git secrets --register-aws
end