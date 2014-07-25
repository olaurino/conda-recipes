mkdir build
./contrib/download_prerequisites
cd build
../configure --with-pic --disable-libquadmath-support --enable-languages=c,c++,fortran --prefix=$PREFIX
make
make install
