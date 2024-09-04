for file in `cat file_resub`
do
echo $file
condor_submit $file

done
