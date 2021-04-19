# convert a negative hex number (leading 'f' are not needed) to decimal
function nh2d() {
    b=$(( ${#1} * 4 )) # number of hex digits * 4 to get hex size
    echo $(( ((1<<$b) - 16#$1) * -1 ))
}

# this is for macOS
# should I add the multiple file handling?
function md5sum() {
    md5 "$1" | sed 's/^MD5 (\(.*\)) = \(.*\)/\2  \1/'
}
