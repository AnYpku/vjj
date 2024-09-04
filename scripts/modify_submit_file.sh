#!/bin/bash
ls *.resubmit > files_resubmit
for file in `cat files_resubmit`
do
#  sed -i '6a MY.SingularityImage = "/cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-cat/cmssw-lxplus/cmssw-el7-lxplus:latest/"' $file
   sed -i '$d' $file
done
