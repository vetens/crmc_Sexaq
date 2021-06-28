#!/bin/bash
echo "This is job number $1"
echo "SET(HEPMC_PREFIX /afs/cern.ch/sw/lcg/external/HepMC/2.06.08/x86_64-slc6-gcc48-opt/)" >> CMakeLists.txt

echo "Installing HepMC"
git clone https://gitlab.cern.ch/hepmc/HepMC.git
cd HepMC
git checkout HEPMC_02_06_08
mkdir hepmc_build
mkdir hepmc_install
cd hepmc_build/
cmake -DCMAKE_INSTALL_PREFIX=../install/ -Dmomentum=GEV -Dlength=CM ../HepMC/  
make
make install
cd ../..

echo "Installing crmc"
echo "Installing crmc"
cd ..
mkdir crmc_Sexaq_incl_installed
cd crmc_Sexaq_incl_installed/
cmake ../crmc_Sexaq/
make install
