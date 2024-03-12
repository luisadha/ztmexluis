#!/data/data/com.termux/files/usr/bin/bash
#set -xv
#HOME=
#USER=
res="8d9facba8e4bb3bb88883a5b3ba5de4d"
res2="fe850be6dfc7bf5424082e0456cea386"
BASE_DIR="$HOME/@/@t.me/luisadha"
PREFIX='/data/data/com.termux/files/usr'

_build_dir() {
  if [ ! -d "$BASE_DIR" ]; then
    echo "Tidak ada, mari buat!"
 mkdir -p $HOME/@/@t.me/luisadha
 mkdir -p $HOME/@/@t.me/luisadha/script/interactive
 mkdir -p $HOME/@/@t.me/luisadha/script/executeable
 mkdir -p $HOME/@/@t.me/luisadha/script/parameter
 mkdir -p $HOME/@/@t.me/luisadha/module/ 
 mkdir -p $HOME/@/@t.me/luisadha/dotfiles
  fi
  return 1
}
_install() {
  install ./ztmexluis.sh ~/.local/bin/ztmexluis
  chmod +x ~/.local/bin/ztmexluis
  install ./completion/ztmexluis-completion.bash $PREFIX/etc/bash_completion.d/ztmexluis-completion.bash
}
_link() { 
  
  ln -s ~/.local/bin/ztmexluis ~/.shortcuts/ztmexluis; 
  cp -f ~/.shortcuts/ztmexluis ~/.shortcuts/ztmexluis.app #
}

_create_essensial_file() {
set +o noclobber
cat <<- "EOF" > $BASE_DIR/.start
require() {
cd $1
}
import() {
  . $1
}
EOF

}
_move_files() {
 chmod +x ./lib/luis-toolbox.sh
 cp -f ./lib/rumbling.sh $BASE_DIR/rumbling.sh
 cp -f ./lib/luis-toolbox.sh $BASE_DIR/luis-toolbox.sh
}
_download_individual_plugin_installer() {
 cd $PWD
echo -e "Downloading plugins installer..."
  git clone "https://gist.github.com/luisadha/$res"
echo -e "Complete!"
sleep 1
echo -e "Downloading dotfiles"
git clone "https://gist.github.com/luisadha/$res2"
echo -e "Complete!"
}

_unpack() {
mv $res/*.mod.sh $BASE_DIR/
rm -rf $res/
mv $res2/* $BASE_DIR/dotfiles
rm -rf $res2/
cd -
}

_download_individual_plugin_installer
_build_dir
_unpack
_create_essensial_file
_move_files
_install
_link
