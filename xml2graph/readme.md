#�t�@�C���ꗗ
�Ereadme.md  
�Exml2dot.xsl  
�Einstall_list.csv  
sample  
�Evar-replace-simple.xml (XML�f�[�^)  
�Evar-replace-simple.dot (���ԃf�[�^)  
�Evar-replace-simple.png (�摜�f�[�^)  


#xml�t�@�C������O���t��`�ʂ��闬��
1. xml�t�@�C����xls�t�@�C����p����dot�t�@�C���ɕϊ�  
	�Elibxml���K�v  
2. dot�t�@�C����png�t�@�C���ɕ`�ʁipng�ȊO���\�j  
	�EGraphviz���K�v  


#�C���X�g�[���ɂ��āiWindows7 64bit�j
1. libxml�̃C���X�g�[��  
	�Einstall_list��URL����e��t�@�C��(.7z)���_�E�����[�h  
	�E�W�J��C C:\Program Files �ֈړ�  
2. Graphviz�̃C���X�g�[��  
	�Einstall_list��URL����graphviz-2.38���_�E�����[�h  
	�Egraphviz-2.38.msi�����s  
3. ���ϐ��̏�������  
	�E���L��2�̃V�X�e�����ϐ���p�ӂ���path��ʂ�  

�ϐ��FPath  
�l�@�F&XML2GRAPH_HOME%;(����Path)  

�ϐ��FXML2GRAPH_HOME  
�l�@�FC:\Program Files\xml2dot\iconv-1.14-win32-x86_64\bin;C:\Program Files\xml2dot\libtool-2.4.2-win32-x86_64\bin;C:\Program Files\xml2dot\libxml2-2.9.1-win32-x86_64\bin;C:\Program Files\xml2dot\libxslt-1.1.28-win32-x86_64\bin;C:\Program Files\xml2dot\mingwrt-4.8.1-win32-x86_64\mingwrt\bin;C:\Program Files\xml2dot;C:\Program Files\xml2dot\openssl-1.0.1e-win32-x86_64\bin;C:\Program Files\xml2dot\xmlsec1-1.2.19-win32-x86_64\bin;C:\Program Files\xml2dot\zlib-1.2.8-win32-x86_64\bin;C:\Program Files (x86)\Graphviz2.38\bin;  



#���s���@�̗�  
�itest.xml �� test.dot �� test.png �ւ̕ϊ��j  
1. test.xml��xml2dot.xsl�𓯂��f�B���N�g���ɗp��  
2. �R�}���h�v�����v�g���J���C1�̃f�B���N�g���ֈړ�  
3. test.xml �� test.dot  
	xsltproc -o test.dot xml2dot.xsl test.xml  
4. test.dot �� test.png  
	dot -Tpng test.dot -o test.png  
�Ȃ��C4��graphviz��GUI�c�[����p���Ă��ǂ��D  



#�Q�lURL  
Graphviz	http://graphviz.org/  
libxml  	http://xmlsoft.org/sources/win32/64bit/  
