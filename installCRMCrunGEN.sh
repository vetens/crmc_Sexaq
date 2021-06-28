#!/bin/bash
echo "This is job number $1"

echo "Installing HepMC"
cd ..
mkdir HepMC
cd HepMC
git clone https://gitlab.cern.ch/hepmc/HepMC.git
cd HepMC
git checkout HEPMC_02_06_08
mkdir ../hepmc_install
mkdir ../hepmc_install/hepmc_build
mkdir ../hepmc_install/install
cd ../hepmc_install/hepmc_build/
cmake -DCMAKE_INSTALL_PREFIX=../install/ -Dmomentum=GEV -Dlength=CM ../../HepMC/  
make
make install

cd ../../../
WORKDIR=${PWD}
cd crmc_Sexaq
sed -i "s&HEPMCPREFIX&${WORKDIR}/HepMC/hepmc_install/install&g" CMakeLists.txt
echo "Installing crmc"
cd ..
mkdir crmc_Sexaq_incl_installed
cd crmc_Sexaq_incl_installed/
cmake ../crmc_Sexaq/
make install
