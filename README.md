# seamount-icemount-PGtest

For MOM6, modified from the seamount test case in MOM6-examples, to test initialisation and spurious currents in a simple, 2D set up.

The seamount case from MOM6-examples is modified to have a smaller minimum thickness, and a "roof" so that the icemount is symmetric with it. The icemount has a thickness presribed to get a symmetric geometry.

Key testing things were the use of `MASS_WEIGHT_IN_PRESSURE_GRADIENT` and correcting the surface pressure integrals/resetting it in the interior.

For sigma coordinates, `MASS_WEIGHT_IN_PRESSURE_GRADIENT` is not recommended. This option is best for when you have vanishing layers, i.e. z coordinates.

For z coordinate ice shelf, we need both `MASS_WEIGHT_IN_PRESSURE_GRADIENT` and to reset the integral. Just correcting the surface pressure is not good enough as vanished layers have instability (see `icemount-z-surfcorrect`)

For sigma coordinate ice shelf, we need either to set the surface pressure correctly, or to reset the integral (which has inbuilt pressure correction) therefore there are two options that work.

MOM6 version used for testing is from https://github.com/Hallberg-NOAA/MOM6/blob/Yung_PGF_fixes
