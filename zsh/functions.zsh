function head-sort() {
  in=`cat`
  echo $in | head -n1 && echo $in | tail -n +2 | sort $@
}

function awsume_wrap() {
  if [[ $1 =~ ^-.+ ]]
  then
    . awsume
  else
    . awsume $1; export VIRTUAL_ENV=$1
  fi
}
