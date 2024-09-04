for i in 18
do
  echo ${i}
  for file in `cat sample_20${i}`
  do
  echo "python vjj_VJJSkimmerJME.submit.py -c myCampaign_fake_gap/$1_all  --baseoutdir ./ -o TEST -d $file -y 20$i"
  python vjj_VJJSkimmerJME.submit.py -c myCampaign_fake_gap/$1_all  --baseoutdir ./ -o TEST -d $file -y 20$i
#     echo "python vjj_VJJSkimmerJME.submit.py -c myCampaign_gap/$1_all  --baseoutdir ./ -o TEST -d $file -y 20$i"
#     python vjj_VJJSkimmerJME.submit.py -c myCampaign_gap/$1_all  --baseoutdir ./ -o TEST -d $file -y 20$i
  done
done
