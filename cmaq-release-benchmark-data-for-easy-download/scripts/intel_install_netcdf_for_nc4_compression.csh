#!/bin/csh -f
set echo

#
#  Install used tcsh and intel and openmpi
 module load intel/18.2  openmpi_3.1.4/intel_18.2
#

   /bin/tcsh --version
   ifort --version
   icc --version
   module list | grep openmpi
   which mpirun

# compilers
 setenv SERIAL_FC ifort
 setenv SERIAL_F77 ifort
 setenv SERIAL_CC icc
 setenv SERIAL_CXX icpc
 setenv MPI_FC mpifort
 setenv MPI_F77 mpifort
 setenv MPI_CC mpicc
 setenv MPI_CXX mpic++
 setenv CC $SERIAL_CC
 setenv CXX $SERIAL_CXX
 setenv F77 $SERIAL_F77
 setenv FC $SERIAL_FC
 unsetenv F90  # This seems to be set by default on NCAR's Cheyenne and is problematic
 unsetenv F90FLAGS
#

#
#  unset envioronment variables that would conflict with this installation
#

   unsetenv LDFLAGS
   unsetenv CPPFLAGS

#  --------------------
#  Set directory for CMAQ Libraries 
#  -------------------

   mkdir -p $cwd/LIBRARIES_intel
   setenv INSTDIR $cwd/LIBRARIES_intel

# ----------------------
# Build and install curl
# ---------------------

 cd ${INSTDIR}
 wget https://curl.se/download/curl-8.11.1.tar.gz
 tar -xzvf curl-8.11.1.tar.gz
 cd curl-8.11.1
 ./configure --prefix=${INSTDIR} --without-ssl --without-libpsl
 make |& tee make.curl.log
 make install |& tee make.install.curl.log

#  ----------------------
# Build and install zlib
#  ---------------------

  cd ${INSTDIR}
  wget https://github.com/madler/zlib/releases/download/v1.3/zlib-1.3.tar.gz
  tar -xzvf zlib-1.3.tar.gz
  cd zlib-1.3
  ./configure --prefix=${INSTDIR}
  make test |& tee make.test.log
  make install |& tee make.install.log

#  -----------------------
#  Download and build HDF5
#  -----------------------
   cd ${INSTDIR}
   wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.5/src/hdf5-1.10.5.tar.gz
   tar xvf hdf5-1.10.5.tar.gz
   rm -f hdf5-1.10.5.tar.gz
   cd hdf5-1.10.5
   setenv CFLAGS "-O3"
   setenv FFLAGS "-O3"
   setenv CXXFLAGS "-O3"
   setenv FCFLAGS "-O3"
   setenv LDFLAGS "-L${INSTDIR}/lib"
   setenv CPPFLAGS "-I${INSTDIR}/include"
   setenv LIBS "-lz -ldl -lm"
   ./configure --prefix=${INSTDIR} --enable-fortran --enable-cxx --with-zlib=${INSTDIR}/include,${INSTDIR}/lib -enable-shared --enable-hl
   make -j 4 |& tee make.intel.log 
#  make check > make.intel.check
   make install |& tee make.intel.log
#  ---------------------------
#  Download and build netCDF-C
#  ---------------------------
   cd  ${INSTDIR}
   wget https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.8.1.tar.gz
   tar xvf v4.8.1.tar.gz
   cd netcdf-c-4.8.1
   setenv CPPFLAGS "-I${INSTDIR}/include"
   setenv LDFLAGS "-L${INSTDIR}/lib"
   ./configure --with-pic --enable-netcdf-4 --enable-shared --prefix=${INSTDIR}
   make -j 4 |& tee  make.intel.log
   make install
#  ---------------------------------
#  Download and build netCDF-Fortran
#  ---------------------------------
   cd ${INSTDIR}
   wget https://github.com/Unidata/netcdf-fortran/archive/refs/tags/v4.5.3.tar.gz
   # installation instructions
   tar xvf v4.5.3.tar.gz
   cd netcdf-fortran-4.5.3
   ## Note, if non-standard locaions are used for the following compilers, you may need to specify their locations here: 
   setenv LIBS " -L ${INSTDIR}/lib -lnetcdf -lhdf5_hl -lhdf5 -lhdf5-fortran -lhdf5-fortran_hl -lm -ldl -lz -lcurl "
   setenv NCDIR ${INSTDIR}
   # setenv LIBS "-lnetcdf"
   setenv CPPFLAGS "-I${INSTDIR}/include"
   setenv LDFLAGS "-L${INSTDIR}/lib"
   setenv LD_LIBRARY_PATH ${INSTDIR}/lib:${LD_LIBRARY_PATH}
   ./configure --with-pic  --enable-shared --prefix=${INSTDIR}
   make -j 4 |& tee make.intel.log 
   make install

#  check versions that have been installed
   cd $INSTDIR/bin
   ls h5diff
   whereis h5diff
   nc-config --version
   nf-config --version
