#!/data/data/com.termux/files/usr/bin/bash

_ztmexluis_completions() {

  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  COMPREPLY=($(compgen -W "
    run:: run::script:interactive run::script:executeable
    go: go:param go:home go:module run::module:alrc run::module:rapsh" "${COMP_WORDS[1]}")) 


}
complete -F _ztmexluis_completions ztmexluis

