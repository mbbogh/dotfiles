# convert a negative hex number (leading 'f' are not needed) to decimal
function nh2d() {
    b=$(( ${#1} * 4 )) # number of hex digits * 4 to get hex size
    echo $(( ((1<<$b) - 16#$1) * -1 ))
}
