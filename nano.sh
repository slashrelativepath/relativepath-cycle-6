# A script to install nano

if (which brew)
then
 echo "brew is installed"
else
 echo "installing brew"
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if (which nano)
then
 echo "nano is installed"
else
 echo "installing nano"
 brew install nano
fi
