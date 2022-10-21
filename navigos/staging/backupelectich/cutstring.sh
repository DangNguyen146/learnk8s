STR='dangnguyen-*'
SUB='-*'
if [[ "$STR" == *"$SUB"* ]]; then
  echo "It's there."
fi