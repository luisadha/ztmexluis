#!/data/data/com.termux/files/usr/bin/bash
# version 1.1
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
  install ./ztmexluis.sh /data/data/com.termux/files/usr/bin/ztmexluis
  chmod +x /data/data/com.termux/files/usr/bin/ztmexluis
  install ./completion/ztmexluis-completion.bash $PREFIX/etc/bash_completion.d/ztmexluis-completion.bash
}
_link() { 
  
  ln -s /data/data/com.termux/files/usr/bin/ztmexluis ~/.shortcuts/ztmexluis; 
  echo "ztmexluis" > ~/.shortcuts/ztmexluis.app #
}

_create_essensial_file() {
set +o noclobber
cat <<- "EOF" > $BASE_DIR/ztmexlouis

#!/data/data/com.termux/files/usr/bin/bash

# Untuk Menginstall skrip bash berbasis modular, Jadikan skrip modular anda dengan nama_script.mod.sh Jalankan melalui `. ztmexluis run::module:nama_module' agar lebih simple

# KISS ALGORITHM (Keep it short and simple)

# sekedar info
# variable $REPLY akan aktif jika digunakan bersama "select do" dll.
# variable $OPTARG akan aktif jika digunakan bersama "getopts"
# karena ini case dinamis maka saya pakai $2 atau $module_name saja lebih tepatnya "case do"
# Jangan pakai ~ karena sudah depcreated gunakan $HOME alih-alih

# set -xv # uncomment this for debug

HOME_DIR="$HOME/@/@t.me/luisadha"

MOD_DIR="$HOME/@/@t.me/luisadha/module"

ztmexlouis() {
local arg=$1
local dist="distfiles"
cd $HOME_DIR
case "$arg" in 
 "install")

# NANTI PAKAI METODE DINAMIS CREATE CASE APA DINAMIS STAR CASE APA STATIC CASE APA DECLARE CASE Dipilih

# DINAMIS DECLARE CASE

   case "$2" in
 "$module_name")
       # pwd
        mkdir -p $dist && cd $dist
        [[ ! -f ./${module_version}.zip ]] && wget $module_sc
      if [ -d ${MOD_DIR}/${module_name}-* ]; then 
# Jika berhasil diekstrak maka gunakan folder yang sudah ada
cd ${MOD_DIR}/${module_name}-*
        . ${module_name}.sh
else
 # Jika belum ada ektraks file sc
unzip -o ${module_version}.zip -d ${MOD_DIR}
         # pwd
        cd ${MOD_DIR}/${module_name}-*
        . ${module_name}.sh; fi;;
  ?)
        echo "unknown $module_name, can't run.";;
    esac
  ;;
 uninstall)
   # BELUM DIPERLUKAN
  ;;
  clean)
   # BELUM DIPERLUKAN
  ;;
  clean-all)
   # BELUM DIPERLUKAN
  ;;
esac
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

git clone https://github.com/luisadha/ztmexluis.git
cd ztmexluis
_download_individual_plugin_installer
_build_dir
_unpack
_create_essensial_file
_move_files
_install
cd -
_link
