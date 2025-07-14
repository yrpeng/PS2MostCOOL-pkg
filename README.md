# PowerSynth 2 Release Series Package Repository
## Repository Overview
This is the pkg repository for PS2MostCOOL. Refer to the [PowerSynth2-core](https://github.com/yrpeng/PS2MostCOOL-core) and other related repos for the latest source code. 
This repository contains additional data files, materials, pre-build models, test cases, and manuals used to prepare the release package. 

## PowerSynth 2 Installation Instructions
This instruction is for the latest version of PowerSynth. For older version, please refer to the README.md in the provided package. 

The package bundles local and online installer. The provided package will install python and several basic packages. Then a post installation script will automatically run and git-clone the source code from github and pip-install non-anaconda packages from pypi. This requires you have Internet connection to github and pypi during installation. Otherwise, you will manually need to download these packages or run the post install script yourself. See pkg/misc/constructor/post_install scripts for details. 

PowerSynth 2 requires Matlab to run [ParaPower](https://github.com/USArmyResearchLab/ParaPower) thermal model. The package uses Python3.10 and assumes Matlab 2022b or higher installed at default location. For non-default matlab install location, you need to manually download the install matlabengine using the bundled pip, and edit the site-packages/matlab/engine/_arch.txt file within Lib or lib/python3.10 folder after installation. 
See [MathWorks](https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html) for details about compatibility. 

The following commands assumes you are running under the PowerSynth2 installation folder. 

### For Linux:
Run the provided excutable shell script.
Note, in case matlab engine install failed, follow instructions from mathworks, then reinstall the required matlabengine using bundled pip. 
```
bin/pip install matlabengine --upgrade -t PowerSynth2/lib/python3.10/site-packages/
```
To run PowerSynth, set the path to include the bin folder
```
export PATH=`realpath bin`:$PATH
PS2MostCool
```

## PowerSynth 2 In-place Upgrade and Development
The source code are cloned git repositories under lib/{python3.*}/site-packages/{core,gui}/ and other necessary files are located under pkg/. You can use git clone to perform an in-place upgrade. A automatic script pkg/misc/utils/PullFromGithub.sh can run in git bash to sync code with its origin on github. Therefore, you can easily contribute to the PowerSynth 2 source code after applying patches and submit a pull request. 

By default, all code is tracking the main branch, however, lateste development may occur on other (public or internal) branches. Candidates for the next release will be applied first to dev branch before merged to main as stable release. For a brief changelog, refer to the release website. 

## PowerSynth 2 Usage Information
The installation folder is a self-contained conda python envinronment with essential packages to run PowerSynth. To start the GUI, use PS2MostCool command without any arguments. To use CLI, type PS2MostCool followed by the yaml script. 

The pkg/work/Sample_Designs folder contains a series of design examples. The pkg/man folder contains a manual at the time of release. However, it will be constantly revised and published on the release website. 

# PowerSynth 2 for MOSTCOOL Project Overview
This project is part of the [MOSTCOOL](https://arpa-e.energy.gov/programs-and-initiatives/search-all-projects/multi-objective-optimization-software-coolerchips) (Multi-Objective Optimization Software for COOLERCHIPS) project, supported by ARPA-E. The target is to support thermal and reliability analysis for data center applications. 

The PowerSynth 2 for MOSTCOOL project is co-directed by [Prof. Yarui Peng](https://engineering.uark.edu/directory/index/uid/yrpeng/name/Yarui+Peng/) and [Prof. David Huitink](https://engineering.uark.edu/mechanical-engineering/faculty/uid/dhuitin/name/David+Huitink/). 
