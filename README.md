# P34CSVConvert
国土数値情報市区町村役場データの変換
## このプロジェクトについて
市町村の位置情報に関する空間インデックスについて調べるにあたり、各市町村の役場の位置情報を知りたかった。   
国土数値情報ダウンロードサイトから
[市区町村役場データ](https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-P34.html)
が利用できることを知ったが、  
このページファイルフォーマットがXMLであったため、Excelで利用開始するには少し工夫がいった。  
その時使用したXMLからCSVへ変換に使用したツールはフリーソフトとして公開しておくことにする。

## 前提
- OS
  1. WSL2 ubuntu または Ubuntu
- 必要なパッケージ
  1. XML2
     ```sh
     sudo apt install xml2
     ```
  2. unzip
     ```sh
     sudo apt install unzip
     ```
## 手順
- 変換
  1. [市区町村役場データ](https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-P34.html)より一括DLを選択しチェックを入れて一括ダウンロードを押下
     <img width="1607" height="454" alt="image" src="https://github.com/user-attachments/assets/0e2abf4d-7c5f-4a2e-a791-a6fa8ad9dfce" />
  2. 変換用AWKスクリプト取得
     ```sh
     curl https://raw.githubusercontent.com/mixgrill/P34CSVConvert/refs/heads/main/gmlzip2csv.awk -o gmlzip2csv.awk
     ```
  3. 変換コマンド実施
     ```sh
     find /mnt/c/Users/userName/Downloads/ -name P34\*.zip | xargs -I {} -n 1 sh  -c 'unzip -p {} $(echo {} | sed -e "s/.*\///" -e "s/_GML\.zip/\.xml/") | xml2 | awk -f gmlzip2csv.awk ' | iconv -f utf-8 -t cp932 > 役場一覧.csv
     ```
- 確認  
  <img width="913" height="291" alt="image" src="https://github.com/user-attachments/assets/4fbdc2e6-249a-4e69-8ba1-b4e17beae177" />
## まとめ  
上記の手段でXMLファイルから役所の位置情報や役場名、役場住所を抜き出すことができた。  
プログラミングのダミーデータとして使うのもいいのではないかと思う。  
以上
