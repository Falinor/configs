if [ `uname -s` == 'Darwin' ]; then
  echo 'Installing for macOS';
  sh ./macOS/install.sh
else
  echo 'Cannot understand your OS. Exiting.' && exit 1
fi
