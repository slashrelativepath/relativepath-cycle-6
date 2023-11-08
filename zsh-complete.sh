if ( stat ~/.zshrc )
then
  echo "~/.zshrc already exists"
else
  touch ~/.zshrc
fi

if ( test -d ~/.zsh )
then
  echo "~/.zsh already exists"
else
  mkdir -p ~/.zsh
fi

curl -s -o ~/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

if ( grep "fpath=(~/.zsh $fpath)" ~/.zshrc )
then
  echo "fpath already added"
else
  echo "fpath=(~/.zsh $fpath)" >> ~/.zshrc
fi

curl -s -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.zshrc

