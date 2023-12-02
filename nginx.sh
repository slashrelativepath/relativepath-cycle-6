if ( which nginx )
then
  echo "nginx already installed."
else
  echo "Installing nginx."
  sudo apt update
  sudo apt install nginx
fi

# This worked for me on my system, but we should test...
# Then wrap all code, in idempotent code blocks

# Install build dependencies

sudo apt install build-essential libpcre3 libpcre3-dev libssl-dev

# download latest nginx source code

wget http://nginx.org/download/nginx-1.23.3.tar.gz

# Unpack source archive

tar -zxvf nginx-1.23.3.tar.gz

# Enter nginx source directory

cd nginx-1.23.3
