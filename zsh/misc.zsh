

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

function squirt () {
    module use /ms/dist/iedinfra/modules
    module load iedinfra/tools/prod
    command squirt $*
}

function get_incr_tcms () {
    module load ecm/tcm2cli
    /ms/dist/ecm/PROJ/tcm2cli/qa/bin/tcm2 lr -type active -user lonstein -filter ReusableTcm=Yes -full 2>/dev/null| egrep -e 'Metaproject|Release|TcmId' |sort -u |sed 's/^\s*//'|while read ARG VAL
    do
        export $ARG=$VAL
    done
    export $(echo ${Metaproject}_INCR_TCM | tr "[:lower:]" "[:upper:]" )=$TcmId

    /ms/dist/ecm/PROJ/tcm2cli/qa/bin/tcm2 lr -type active -user balusuv  -filter ReusableTcm=Yes -full 2>/dev/null| egrep -e 'Metaproject|Release|TcmId' |sort -u |sed 's/^\s*//'|while read ARG VAL
    do
        export $ARG=$VAL
    done
    export $(echo ${Metaproject}_INCR_TCM | tr "[:lower:]" "[:upper:]" )=$TcmId

    unset TcmId
    unset Metaproject
    unset Release
    unset _INCR_TCM
    module unload ecm/tcm2cli
}
