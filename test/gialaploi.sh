result=0
if [ $result -ne 0 ]; then
  printf "WARNING - can't get deployments"
  exit 0
fi
printf "1"