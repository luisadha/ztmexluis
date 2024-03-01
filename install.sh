#!/data/data/com.termux/files/usr/bin/bash
#set -xv
#HOME=
#USER=
res="8d9facba8e4bb3bb88883a5b3ba5de4d"
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
  git clone "https://gist.github.com/luisadha/$res"
echo -e "Downloading plugins installer..."
}

_unpack() {
mv $res/*.mod.sh $BASE_DIR/
rm -rf $res/
cd -
}

_download_individual_plugin_installer
_build_dir
_unpack
_create_essensial_file
_move_files
_install
_link
