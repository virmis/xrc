function head-sort() {
  in=`cat`
  echo $in | head -n1 && echo $in | tail -n +2 | sort $@
}
