#!/data/data/com.termux/files/usr/bin/bash
prefix="$HOME"
username="luisadha"
home="$prefix/@/@t.me/$username"
export OLDPWD="$prefix/.shortcuts"
args="$1"
#echo $OLDPWD
MODPLUGIN='.mod'
ZTMEXLUIS_HOME="${home}"



#
#
# set -o history
shopt -s extglob
#shopt -s progcomp

if [ -z "$args" ]; then
#  ./$0 run::script:interactive
cd `eval dirname $home/luis-toolbox.sh`
bash luis-toolbox.sh
elif [ "$args" == 'run::script:interactive' ]; then 
# execute the interactive program under ~/@/@t.me/luisadha/script/interactive/
cd `eval dirname $home/luis-toolbox.sh`
bash `eval basename $home/luis-toolbox.sh`
elif [ "$args" == 'run::script:executeable' ]; then
#complete -W "${array[*]}" dosomething
  if [[ ! $- =~ i ]]; then
    echo "this option request interactive shell mode" 1>&2;
    exit 1
  fi
 # set -xv
  set +o noclobber
  cd `eval dirname $home/rumbling.sh`
  source rumbling.sh &> ztme.out
  command cat ztme.out
  rm -f ztme.out &>/dev/null
  cd - &>/dev/null
elif [ "$args" == 'go:param' ]; then
  if [[ ! $- =~ i ]]; then
    echo "this option request interactive shell mode" 1>&2;
    exit 1;
  fi
  echo "cd into $home/script/parameter"
  cd $home/script/parameter
  ls
elif [ "$args" == 'go:home' ]; then
  if [[ ! $- =~ i ]]; then
    echo "this option request interactive shell mode" 1>&2;
    exit 1
  fi
  cdying=true
  echo "cd into $home"
  cd $home
  ls 
elif [ "$args" == 'go:module' ]; then
  if [[ ! $- =~ i ]]; then
    echo "this option request interactive shell mode" 1>&2;
    exit 1
  fi
  cdying=true
  cd $home/module
  ls
elif [ "$args" == 'run::module:rapsh' ]; then
 if [[ ! $- =~ i ]]; then
    echo "this option request interactive shell mode" 1>&2;
    exit 1;
 fi
 cdying=false
 #export OLDPWD="$prefix/.shortcuts"
 cd $home
 export OLDPWD="$prefix/.shortcuts"
 source rapsh$MODPLUGIN.sh
  cd - &>/dev/null;
elif [ "$args" == 'run::module:alrc' ]; then
#cd ~/.shortcuts/
  if [[ ! $- =~ i ]]; then
    echo "this option request interactive shell mode" 1>&2;
    exit 1;
  fi
  cdying=false
  export OLDPWD="$prefix/.shortcuts"
  cd $home
  export OLDPWD="$prefix/.shortcuts"
  source alrc$MODPLUGIN.sh
  cd - &>/dev/null;
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
  cd ~/.shortcuts/
fi

