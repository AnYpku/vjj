for file in `cat file_tmp`
do
echo $file
condor_submit $file

done
