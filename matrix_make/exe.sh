#./make_matrix_<matrix_type:Band,Rnad or SingleBand>.o <N> <nnz/row> > X${1}_<number>.mtx
./make_matrix_${1}.o ${2} ${3} > X${1}_${4}.mtx
chmod 755 X${1}_${4}.mtx
