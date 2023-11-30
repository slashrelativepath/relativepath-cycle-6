if ( which nginx )
then
  echo "nginx already installed."
else
  echo "Installing nginx."
  sudo apt update
  sudo apt install nginx
fi


