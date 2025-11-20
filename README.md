# Ice Shelf Pressure Gradient testing in MOM6

This repo contains the model configurations and plotting notebooks for
Yung, C.K., Hallberg, R.W., Adcroft, A. and Morrison, A.K. "Assessment of a finite volume discretization of the horizontal pressure gradient force beneath sloping ice shelves" in prep., 2025

We modified the [seamount test case in MOM6-examples](https://github.com/NOAA-GFDL/MOM6-examples/tree/dev/gfdl/ocean_only/seamount), to test initialisation and spurious currents in a simple, 2D set-up.

The seamount case from MOM6-examples is modified to have a smaller minimum thickness, and a "roof" so that the icemount is symmetric with it. The icemount has a thickness presribed to get a symmetric geometry.

Key testing things were the use of `MASS_WEIGHT_IN_PRESSURE_GRADIENT` and correcting the surface pressure integrals/resetting it in the interior:
```
#override MASS_WEIGHT_IN_PRESSURE_GRADIENT = True ! Turns on MWIPG algorithm for bottom 
#override MASS_WEIGHT_IN_PRESSURE_GRADIENT_TOP = Truen! Turns on MWIPG algorithm for top
#override RESET_INTXPA_INTEGRAL = True ! Reset integral at an interior ref interface
#override MASS_WEIGHT_IN_PGF_VANISHED_ONLY = True ! Only apply MWIPG to cells partially vanished
#override RESET_INTXPA_INTEGRAL_FLATTEST = True ! If no ideal, ref interface where not contacting vanished layers, then use flattest interface
!CORRECTION_INTXPA ! Just corrects surface, doesn't reset to an interior layer, so not ideal when there are vanished layers.
```

Also ran 2D triangular ice shelf cases (`iceshelf`) and z-coordinate ISOMIP+ cases (`z-ISOMIP-quiet` without melt, `MOM6-examples-z` and `MOM6-examples-z-noMWIPG` with melt)

MOM6 version used is here: https://github.com/claireyung/MOM6/releases/tag/CYPGv2. Some small modifications from main to add perfect sigma initialisation (only required near grounded ice), add diagnostics for the manuscript plots and fix a small bug.

To run, a compiled version of MOM6 is required. Since the model domain is mostly 2D (and a few short 3D idealised runs), I ran on on a MacBook using the instructions in https://github.com/NOAA-GFDL/MOM6-examples/wiki/Compiling-on-MacBook-M1-chip-using-conda-environment. I saved this folder in [`MOM6-examples/ocean-only/ISOMIP` ](https://github.com/NOAA-GFDL/MOM6-examples) so to run I use 
```
mpirun  -host localhost ../../../../build/ocean_only/MOM6
```

Plots of the model results (quiet cases) are in `plotting.ipynb` and `compare-mwipg.ipynb`. Plots of the PG algorithm presented earlier in the paper are in `mom-pg-minimise-combined-func.ipynb`.
