#!/bin/tcsh
#script used to build pacakge on E3DA server

set pyvers=3.10
set mlrel=2022b
setenv PSVers 2.2
setenv gitbranch "v$PSVers"
setenv gitoption ""

#for mostcool only
setenv PSVers mostcool
setenv gitorigin https://github.com/yrpeng/PS2MostCOOL-
setenv gitbranch dev

ml dist/miniconda
ml e3da/ialrazi/$PSVers

#conda env remove -y -n PowerSynth2
conda create -y -n PowerSynth2 python=$pyvers

#May need new solver
#conda install -n base conda-libmamba-solver

conda activate PowerSynth2

#Install from channels: -c anaconda -c conda-forge
#setenv CONDA_SOLVER libmamba
conda install -c anaconda --override-channels -y networkx joblib seaborn numpy=2.1 pandas scipy matplotlib-base pyyaml pyside6 psutil numba
conda install -c anaconda -c conda-forge --override-channels -y deap pydoe2 pykrige fluidfoam numpy-stl

#post install script require matlab >2022b
setenv MatlabRoot "/e3da/dev/sdk/linux/matlab/R$mlrel"
set thisdir=$HOME/git/PS2MostCOOL/yrpeng/PS2MostCOOL-pkg/misc/constructor
$thisdir/post_install.sh

####used for building Installer####
conda activate base
constructor "$thisdir" --output-dir "$HOME"

####Used for Testing on E3DA Server####
ml e3da/ialrazi/$PSVers

cp -r $e3da_ialrazi/PowerSynth2/pkg/work/Sample_Designs .

#run with macrofile for CLI, without it for GUI
PS2MostCool 