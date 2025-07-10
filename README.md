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
- 手順
  1. [市区町村役場データ](https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-P34.html)より一括DLを選択しチェックを入れて一括ダウンロードを押下
     <img width="1607" height="454" alt="image" src="https://github.com/user-attachments/assets/0e2abf4d-7c5f-4a2e-a791-a6fa8ad9dfce" />
  2. 
