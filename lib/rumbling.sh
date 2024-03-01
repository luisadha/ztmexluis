[ -z "$PS1" ] && return 

function main() {
for p in $PWD/script/executeable; do
        [[ -d $p/. ]] || continue
        [[ :$PATH: = *:$p:* ]] || PATH=$p:$PATH
done

unset p

echo "Script below already to call from terminal" >&2;

busybox ls $PWD/script/executeable
chmod +x $PWD/script/executeable/* >&2;

}

# kode ini akan melooping yang mana outputnya disembunyikan efek ini akan terjadi jika anda memanggil dengan bash nama_script.sh yang seharusnya source nama_script.sh 
source $0 > /dev/null 2>&1 && until false; do sleep 1; done; main; unset -f main
