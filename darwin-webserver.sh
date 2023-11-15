# A scipt to install homebrew

if (which brew)
then
echo "brew is installed"
else
echo "installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# A script to install htop 

if (which htop)
then
echo "htop is installed"
else
echo "installing htop"
brew install htop
fi

# A script to install nano

if (which nano)
then 
 echo "nano is installed"
else
 echo "installing nano"
brew install nano
fi
