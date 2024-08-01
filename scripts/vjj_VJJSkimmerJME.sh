#! /bin/bash

#export schedd=bigbird13.cern.ch
#
#apptainer -s exec /cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-cat/cmssw-lxplus/cmssw-el7-lxplus:latest/ sh -c "source /app/setupCondor.sh && export _condor_SCHEDD_HOST=$schedd && export _condor_SCHEDD_NAME=$schedd && export _condor_CREDD_HOST=$schedd && /bin/bash  "
#
#export APPTAINER_BINDPATH=/afs,/cvmfs,/cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security,/cvmfs/grid.cern.ch/etc/grid-security/vomses:/etc/vomses,/eos,/etc/pki/ca-trust,/etc/tnsnames.ora,/run/user,/tmp,/var/run/user,/etc/sysconfig,/etc:/orig/etc
#
#source /cvmfs/cms.cern.ch/cmsset_default.sh

export workingdirectory=$(pwd) #Write temporary output on HTcondor workingdir #Then moved to outdir defined in wrapper code by haddnano.py tool
echo $workingdirectory
echo "$(dirname "$0")"
cd "$(dirname "$0")"
kernel_release=`uname -r`

case ${kernel_release} in

  *"el7"*)
	export SCRAM_ARCH=slc7_amd64_gcc700
    ;;
  *"el6"*)
	export SCRAM_ARCH=slc6_amd64_gcc700
    ;;
esac

echo ${kernel_release}
echo ${SCRAM_ARCH}
uname -a

eval `scramv1 runtime -sh`;
echo "directory: "${workingdirectory}
cd ${workingdirectory};
ls -lart
pwd;
ls -lart ${workingdirectory}
echo "[--> Output dir: ${10}]"
echo "0: $0"
echo "1: $1"
echo "2: $2"
echo "3: $3"
echo "4: $4"
echo "5: $5"
echo "6: $6"
echo "7: $7"
echo "8: $8"
echo "9: $9"
echo "10: ${10}"
echo "11: ${11}"
/afs/cern.ch/user/y/yian/work/ewk_ajj/CMSSW_10_6_29/src/UserCode/VJJSkimmer/python/postprocessing/vjj_VJJSkimmerJME_postproc.py $@ --workingdir ${workingdirectory};
ls -lart ${workingdirectory}
mv ${workingdirectory}/out*_Skim.root ${workingdirectory}/out.root 
ls -lart ${workingdirectory}
#mv ${workingdirectory}/out.root ${workingdirectory}/${10} 
echo "directory ${10}"
ls -lart ${workingdirectory}/${10}
