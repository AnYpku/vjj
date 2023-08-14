# id total_number
dir=/eos/user/y/yian/AJJ_analysis/DYJetsToLL_M-50_TuneCP5_myCampaign_mm_syst/DYJetsNLO_18_2018_6879014
script=DYJetsToLL_M-50_TuneCP5_myCampaign_mm_syst_DYJetsNLO_182018_vjj_VJJSkimmerJME
ls ${dir}/Skim*.root >file_$1
cp ${script}.submit ${script}.resubmit
job="${script}.resubmit"

if [[ -f tmp ]];then
   rm tmp
fi

sed -n '1,17p' ${script}.resubmit >> tmp
for((i=0;i<=${2};i++ ))
do
  file=Skim_$1_${i}.root
  if [[ ! -f ${dir}/${file} ]];then
     line=`expr $i + 18`
     echo "$i $line"
     sed -n "$line p" $job >> tmp
  fi
done
sed -n '$p' ${script}.resubmit >>tmp
mv tmp $job
