#Create alias to run git init and git-secrets in one shot
# put in ~/.config/fish/functions
# Creates a dot file in the repo root to indicate that git-secrets was run on this repo; this can be used in other automation checks
function git-secrets-init
    git init
	touch .git-secrets-init
	set date (date)
	echo -e "#This file indicates that aws git-secrets commit protection was enabled on [ $date ]\n#https://github.com/awslabs/git-secrets" > .git-secrets-init
	git secrets --install | tee -a .git-secrets-init
	git secrets --register-aws | tee -a .git-secrets-init
end