#!/bin/tcsh
#script used to build pacakge on E3DA server

setenv PYVers 3.10
#for mostcool only
setenv PSVers mostcool

setenv gitbranch "dev"
setenv gitoption ""

setenv gitorigin https://github.com/yrpeng/PS2MostCOOL-

ml dist/miniconda
ml e3da/ialrazi/$PSVers

#conda env remove -y -n PowerSynth2
conda create -y --override-channels -c main -n PowerSynth2 python=$PYVers networkx joblib seaborn numpy=2.1 pandas scipy matplotlib-base psutil numba pyyaml

conda activate PowerSynth2

conda install -y --override-channels -c conda-forge pyside6=6.5 deap pydoe2 pykrige fluidfoam numpy-stl

#Allow interactive shell 
if($?prompt) setenv MatlabRoot `ls /e3da/dev/sdk/linux/matlab/R202[2-9]*/ -1d |& tail -1` && set ThisDir=$HOME/git/PS2MostCOOL/yrpeng/PS2MostCOOL-pkg/misc/constructor
if(! $?prompt) set ThisDir=`dirname $0`

#post install script require matlab >2022b
$ThisDir/post_install.sh

#for e3da lab
if($?prompt) sed -i "s#/usr/local/MATLAB/[^/]\+/#$MatlabRoot#" $e3da_ialrazi/PowerSynth2/lib/python$PYVers/site-packages/matlab/engine/_arch.txt

####used for building Installer####
conda activate base
constructor "$ThisDir" --output-dir "$HOME"

####Used for Testing on E3DA Server####
ml e3da/ialrazi/$PSVers

cp -r $e3da_ialrazi/PowerSynth2/pkg/work/Sample_Designs .

#run with yaml file for CLI, without it for GUI
PS2MostCool Sample_Designs/S2U2CPU4GPU/S2U2CPU4GPU.yaml