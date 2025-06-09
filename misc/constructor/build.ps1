#miniconda powershell prompt

$Env:pyvers="3.10"

$Env:PSVers="2.2"
$Env:gitbranch="v$Env:PSVers"
$Env:gitoption=""

#for dev branch only
#$Env:PSVers="dev"

#$Env:gitorigin="ssh://peng-srv2.csce.uark.edu/data/project/PowerSynth/git/"
#$Env:gitbranch="dev"

#conda env remove -y -n PowerSynth2-$Env:PSVers
conda create -y -n PowerSynth2-$Env:PSVers python=$Env:pyvers

#May need new solver
#conda install -n base conda-libmamba-solver

conda activate PowerSynth2-$Env:PSVers

#Install from channels: -c anaconda -c conda-forge
#$Env:CONDA_SOLVER="libmamba"
conda install -c anaconda --override-channels -y networkx joblib seaborn numpy=2.1 pandas scipy matplotlib-base pyyaml pyside6 psutil numba
conda install -c anaconda -c conda-forge --override-channels -y deap pydoe2 pykrige fluidfoam numpy-stl

#to support interactive running
if ($PSScriptRoot) {
	$thisdir=$PSScriptRoot
} else {
	$thisdir="H:\git\PowerSynth\pkg\misc\constructor"
}

#post install script require matlab >2022b	
Start-Process -FilePath "$thisdir\post_install.bat" -Wait -NoNewWindow

#Build installer
conda activate base
constructor "$thisdir" --output-dir "$HOME"