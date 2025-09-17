#!/bin/bash
find icemount* -maxdepth 0 -mindepth 0 -type d  -exec bash -c "cd {}; 
pwd; 
ln -s ../INPUT ;
mpirun  -host localhost ../../../../build/ocean_only/MOM6 -n 8;
echo 'finished' " \;

#ln -s ../common/input.nml
#ln -s ../common/MOM_input
#ln -s ../common/diag_table

find seamount* -maxdepth 0 -mindepth 0 -type d  -exec bash -c "cd {}; 
pwd; 
ln -s ../INPUT ;
mpirun  -host localhost ../../../../build/ocean_only/MOM6 -n 8;
echo 'finished' " \;

find iceshelf* -maxdepth 0 -mindepth 0 -type d  -exec bash -c "cd {}; 
pwd; 
ln -s ../INPUT ;
mpirun  -host localhost ../../../../build/ocean_only/MOM6 -n 8;
echo 'finished' " \;

