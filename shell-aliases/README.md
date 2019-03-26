## Aliases for local repo initialization of Git-Secrets

Recommend using some variant of this to protect against accidently committing AWS secrets to any repo.

NOTE: Optionally you can create one alias that does a `git init` and `git-secrets` in one command.  There are examples of this configuration in this directory as well.

### Usage
```
git init
git-secrets
```

### Install

#### Fish shell https://github.com/fish-shell/fish-shell
```
# This is equivalent to entering the following function:
function git-secrets
	git secrets --install
	git secrets --register-aws
end

# Then, to save it across terminal sessions (saves it in ~/.config/fish/functions)
funcsave git-secrets
```
OR
```
cp git-secrets.fish ~/config/fish/functions/
```

#### Bash
```
cat git-secrets.bash >> ~/.bashrc 
```

If you are using `zsh` I think you can use the bash convention.


#### Example response on detecting a secret (AWS )
```
 ~/r/p/test-git-secrets <master> git add *
 ~/r/p/test-git-secrets <master> git commit -m "test commit a secret..oops"
somefile-with-secrets.txt:2:AKIAJANYWZSV2EXDFHG

[ERROR] Matched one or more prohibited patterns

Possible mitigations:
- Mark false positives as allowed using: git config --add secrets.allowed ...
- Mark false positives as allowed by adding regular expressions to .gitallowed at repository's root directory
- List your configured patterns: git config --get-all secrets.patterns
- List your configured allowed patterns: git config --get-all secrets.allowed
- List your configured allowed patterns in .gitallowed at repository's root directory
- Use --no-verify if this is a one-time false positive
```

`Which is worst committing a secret or committing directly to 'master'?` ;)
