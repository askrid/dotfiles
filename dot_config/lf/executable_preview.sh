#!/bin/zsh

file="$1"
w="$2"
h="$3"
x="$4"
y="$5"

case $(file --mime-type -Lb "$file") in
    text/*|\
    application/json|\
    application/xml|\
    application/javascript) bat --color=always --style=plain --paging=never "$file" ;;
    image/*)                kitten icat --stdin no --transfer-mode memory --place "${w}x${h}@${x}x${y}" "$file" < /dev/null > /dev/tty;;
    application/pdf)        pdftotext "$file" - ;;
    *)                      file -b "$file" ;;
esac

exit 1 # do not cache

