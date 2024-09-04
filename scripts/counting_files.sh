ls *.submit > all_submit
for file in `cat all_submit`
  do
    ntot=`sed -n '$=' $file`
    line=`expr $ntot - 18`
    echo $file $line

  done
