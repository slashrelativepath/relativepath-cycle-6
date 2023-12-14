if ( which nginx )
then
  echo "nginx already installed."
else
  echo "Installing nginx."
  sudo apt update
  sudo apt install -y nginx
fi

if ( curl localhost | grep relativepath )
then
  echo "Website already deployed."
else
  echo "Deploying website."
  sudo cp index.html styles.css /var/www/html/
  sudo rm /var/www/html/index.nginx-debian.html
fi
