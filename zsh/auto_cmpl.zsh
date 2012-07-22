
function ml_cmpl () {
        local a
        read -cA a

        #reply=(`cat ~/tmp/ml_cmpl.cash.bad |grep "^$a" |tr "\n" " "`)
        reply=(`cat ~/.zsh/auto_compleat/ml.cash`)
}

function mu_cmpl () {
        lm="${LOADEDMODULES//:/ }"
        reply=( $lm )
}

man_cmpl () {
        local a
        read -cA a
        if [[ $a[2] = -s ]] then
                reply=( ${^manpath}/man$a[3]/$1*$2(N:t:r) )
        else
                reply=( ${^manpath}/man*/$1*$2(N:t:r) )
        fi
}

compctl -K man_cmpl -x 'C[-1,-P]' -m - 'R[-*l*,;]' -g '*.(man|[0-9nlpo](|[a-z]))' + -g '*(-/)' -- man
compctl -K ml_cmpl -x 'C[-1,-P]' -m - 'R[-*l*,;]' -g '*(-/)' -- ml
compctl -K mu_cmpl -x 'C[-1,-P]' -m - 'R[-*l*,;]' -g '*(-/)' -- mu


