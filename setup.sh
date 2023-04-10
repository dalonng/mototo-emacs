#!/sur/bin/env bash

if command -v ros > /dev/null ; then
    echo "roswell installed"
else
  brew install roswell
  echo "roswell installing..."
fi

# lisp lint
ros install cxxxr/sblint
