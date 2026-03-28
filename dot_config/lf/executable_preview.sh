#!/bin/zsh

case $(file --mime-type -Lb "$1") in
    text/*)           bat --color=always --style=plain --paging=never "$1" ;;
    application/pdf)  pdftotext "$1" - ;;
    *)                file -b "$1" ;;
esac

