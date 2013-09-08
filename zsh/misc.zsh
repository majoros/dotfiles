

function hr () {
    typeset -F val=$1

	post=(B KB MB GB TB PB)

    i=1
	echo $post[2]

    while (( $val > 1024 )) {
        let "val = $val / 1024";
		let "i++"
    }

    printf "%.2f %s\n" $val $post[$i]
}

function epoch2date () {
        date -d "1970-01-01 $1 sec" +"%Y-%m-%d %T"
}

function calc () {
    echo "$*" | bc
}
