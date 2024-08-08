#!/data/data/com.termux/files/usr/bin/bash
prefix="$HOME"
username="luisadha"
home="$prefix/@/@t.me/$username"
args="$1"
export MODPLUGIN='.mod'
export ZTMEXLUIS_HOME="${home}"
export ZTMEXLUIS_MOD="$ZTMEXLUIS_HOME/module"
export PREFIX='/data/data/com.termux/files/usr/'

# VERSION: 1.3
#
#
# set -o history
shopt -s extglob
#shopt -s progcomp

if [ -z "$args" ]; then
#  ./$0 run::script:interactive
cd `eval dirname $home/luis-toolbox.sh`
bash luis-toolbox.sh
elif [ "$args" == '--import' ]; then
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
ln -sv ${MOD_DIR}/${module_name}-* ~/.alrc.sandbox
        . ${module_name}.sh
else
 # Jika belum ada ektraks file sc
unzip -o ${module_version}.zip -d ${MOD_DIR}
         # pwd
        cd ${MOD_DIR}/${module_name}-*
        ln -sv ${MOD_DIR}/${module_name}-* ~/.alrc.sandbox
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


elif [ "$args" == 'run::script:interactive' ]; then 
# execute the interactive program under ~/@/@t.me/luisadha/script/interactive/
cd `eval dirname $home/luis-toolbox.sh`
bash `eval basename $home/luis-toolbox.sh`
elif [ "$args" == 'run::script:executeable' ]; then
#complete -W "${array[*]}" dosomething
 # if [[ ! $- =~ i ]]; then
  #  echo "this option request interactive shell mode" 1>&2;
#    exit 1
#  fi
 # set -xv
  set +o noclobber
  cd `eval dirname $home/rumbling.sh`
  source rumbling.sh &> ztme.out
  command cat ztme.out
  rm -f ztme.out &>/dev/null
  cd - &>/dev/null
elif [ "$args" == 'go:param' ]; then
#  if [[ ! $- =~ i ]]; then
#    echo "this option request interactive shell mode" 1>&2;
#    exit 1;
#  fi
  echo "cd into $home/script/parameter"
  cd $home/script/parameter
  ls
elif [ "$args" == 'go:home' ]; then
#  if [[ ! $- =~ i ]]; then
#    echo "this option request interactive shell mode" 1>&2;
#    exit 1
#  fi
  cdying=true
  echo "cd into $home"
  cd $home
  ls 
elif [ "$args" == 'go:module' ]; then
#  if [[ ! $- =~ i ]]; then
#    echo "this option request interactive shell mode" 1>&2;
#    exit 1
#  fi
  cdying=true
  cd $home/module
  ls
elif [ "$args" == 'run::module:rapsh' ]; then
# if [[ ! $- =~ i ]]; then
#    echo "this option request interactive shell mode" 1>&2;
#    exit 1;
# fi
 cdying=false
 #export OLDPWD="$prefix/.shortcuts"
 cd $home
 source rapsh$MODPLUGIN.sh
  cd - &>/dev/null;
elif [ "$args" == 'run::module:alrc' ]; then
#cd ~/.shortcuts/
#  if [[ ! $- =~ i ]]; then
#    echo "this option request interactive shell mode" 1>&2;
#    exit 1;
#  fi
  cdying=false
  cd $home
  source alrc$MODPLUGIN.sh
  #  cd - &>/dev/null;
  elif [ "$args" == "--help" ] || [ "$args" == "-h" ]; then
    echo "ztmeXluis --help | ./$0 | . ./$0 OPTIONS

 Usage:

  --help, -h                  print this help messages.
  go:module                   jump into directory \$home/module
  go:param                    jump into directory \$home/script/parameter.
  go:home                     jump into directory user home (that called \$home).
  run::script:interactive     run script named luis-toolbox.sh.
  run::script:executeable     run script named rumbling.sh.
  run::module:alrc            run module named alrc in directory module.
  run::module:rapsh           run module named rapsh in directory module."

else echo "Error: invalid argument -- $args"; exit 1; fi

if [ "$cdying" == "false" ]; then
  :
fi

