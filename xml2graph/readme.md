#ファイル一覧
・readme.md  
・xml2dot.xsl  
・install_list.csv  
sample  
・var-replace-simple.xml (XMLデータ)  
・var-replace-simple.dot (中間データ)  
・var-replace-simple.png (画像データ)  


#xmlファイルからグラフを描写する流れ
1. xmlファイルをxlsファイルを用いてdotファイルに変換  
	・libxmlが必要  
2. dotファイルをpngファイルに描写（png以外も可能）  
	・Graphvizが必要  


#インストールについて（Windows7 64bit）
1. libxmlのインストール  
	・install_listのURLから各種ファイル(.7z)をダウンロード  
	・展開後， C:\Program Files へ移動  
2. Graphvizのインストール  
	・install_listのURLからgraphviz-2.38をダウンロード  
	・graphviz-2.38.msiを実行  
3. 環境変数の書き換え  
	・下記の2つのシステム環境変数を用意してpathを通す  

変数：Path  
値　：&XML2GRAPH_HOME%;(元のPath)  

変数：XML2GRAPH_HOME  
値　：C:\Program Files\xml2dot\iconv-1.14-win32-x86_64\bin;C:\Program Files\xml2dot\libtool-2.4.2-win32-x86_64\bin;C:\Program Files\xml2dot\libxml2-2.9.1-win32-x86_64\bin;C:\Program Files\xml2dot\libxslt-1.1.28-win32-x86_64\bin;C:\Program Files\xml2dot\mingwrt-4.8.1-win32-x86_64\mingwrt\bin;C:\Program Files\xml2dot;C:\Program Files\xml2dot\openssl-1.0.1e-win32-x86_64\bin;C:\Program Files\xml2dot\xmlsec1-1.2.19-win32-x86_64\bin;C:\Program Files\xml2dot\zlib-1.2.8-win32-x86_64\bin;C:\Program Files (x86)\Graphviz2.38\bin;  



#実行方法の例  
（test.xml → test.dot → test.png への変換）  
1. test.xmlとxml2dot.xslを同じディレクトリに用意  
2. コマンドプロンプトを開き，1のディレクトリへ移動  
3. test.xml → test.dot  
	xsltproc -o test.dot xml2dot.xsl test.xml  
4. test.dot → test.png  
	dot -Tpng test.dot -o test.png  
なお，4はgraphvizのGUIツールを用いても良い．  



#参考URL  
Graphviz	http://graphviz.org/  
libxml  	http://xmlsoft.org/sources/win32/64bit/  
