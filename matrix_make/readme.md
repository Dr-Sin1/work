#ファイル一覧
| 名前 | 説明 |
|:--|:--|
|make_matrix_Rand.c        | ランダム行列生成Cコード |  
|make_matrix_Band.c        | 帯行列生成Cコード |  
|make_matrix_SingleBand.c  | 片帯行列生成Cコード |  
|compile.sh                | コンパイル用シェル |  
|exe.sh                    | 実行用シェル |  
|all_compile.sh            | 3種コンパイル用シェル |  
|all_exe.sh                | N=100000,nnz/row=30の行列を3種生成する |  

#使い方
行列サイズと１行あたりの非零要素数を指定してMM形式の疎行列を生成  

1. all_compile.shで全てコンパイル
2. exe.shで実行
sh ./exe.sh ${name} ${N} ${nnz/row}  
${name}  行列の種類の選択：Rand , Band or SingleBand  
${N}  行数  
${nnz/row}  1行あたりの非零要素数  
