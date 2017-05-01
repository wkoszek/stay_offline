O=$1
shift
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$O `/bin/ls -1rt $* | xargs`
