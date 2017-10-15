<!-- -*- coding: utf-8 -*- -->
# Extract PDFmarkによるPDFファイルサイズ削減

[TeXConf 2017](https://texconf2017.tumblr.com/)一般講演
「Extract PDFmarkによるPDFファイルサイズ削減」
関連資料です。

---

* [アブストラクト](#アブストラクト)
* [発表資料](#発表資料)

---

## アブストラクト

正式な公開版のファイルは [TeXConf 2017](https://texconf2017.tumblr.com/)
からダウンロードしてください。

関連ファイルは[abstract/](./abstract/)以下にあります。

### ソースファイル

* [Makefile
](./abstract/Makefile)

    - 公開用アブストラクト関連ファイルをビルドするための Makefile

* [extractpdfmark-texconf2017-abstract.tex
](./abstract/extractpdfmark-texconf2017-abstract.tex)

    - 公開用アブストラクトのソース

* [la_primavera-core.ly
](./abstract/la_primavera-core.ly)

    - 楽譜「春」LilyPondソースのコア部分

* [invention1-core.ly
](./abstract/invention1-core.ly)

    - 楽譜「インヴェンション第一番」LilyPondソースのコア部分

* [fur_elise-core.ly
](./abstract/fur_elise-core.ly)

    - 楽譜「エリーゼのために」LilyPondソースのコア部分

* [ly-prologue.ly
](./abstract/ly-prologue.ly)

    - 各楽譜コア部分をLilyPondで処理する際に追加するヘッダ部分

* [notation-ja-capture.png
](./abstract/notation-ja-capture.png)

    - LilyPond PDF マニュアル「記譜法リファレンス」日本語版画面キャプチャ

### 出力

### make 環境

* LuaTeX 1.0.4 (TeX Live 2017/Cygwin)
* LilyPond 2.19.65
* Ghostscript 9.22rc2
    + `-dPDFDontUseFontObjectNum` 有効化
* Extract PDFmark 1.0.2
* 源ノ明朝 / 源ノ角ゴシック Super OTC

など

### ファイル

[abstract/output/](./abstract/output/)以下にあります。

* メイン PDF

    + [extractpdfmark-texconf2017-abstract.pdf
](./abstract/output/extractpdfmark-texconf2017-abstract.pdf)  
[extractpdfmark-texconf2017-abstract.txt
](./abstract/output/extractpdfmark-texconf2017-abstract.txt)

        - 公開用アブストラクトの最終 PDF  
        フォント情報

    + [extractpdfmark-texconf2017-abstract-texoutputted.pdf
](./abstract/output/extractpdfmark-texconf2017-abstract-texoutputted.pdf)  
[extractpdfmark-texconf2017-abstract-texoutputted.txt
](./abstract/output/extractpdfmark-texconf2017-abstract-texoutputted.txt)

        - 公開用アブストラクトの TeX 出力 PDF  
        フォント情報

    + [extractpdfmark-texconf2017-abstract.pdfmark.ps
](./abstract/output/extractpdfmark-texconf2017-abstract.pdfmark.ps)

        - TeX 出力 PDF から抽出した PDFmark

* 図 PDF

    + [la_primavera.pdf
](./abstract/output/la_primavera.pdf)  
[la_primavera-subset.pdf
](./abstract/output/la_primavera-subset.pdf)  
[la_primavera-fullset.pdf
](./abstract/output/la_primavera-fullset.pdf)

        - 楽譜の断片「春」、フォント非埋め込み  
        サブセット埋め込み  
        フルセット埋め込み（gs-9.22rc2 生成のため不完全）

    + [la_primavera.txt
](./abstract/output/la_primavera.txt)  
[la_primavera-subset.txt
](./abstract/output/la_primavera-subset.txt)  
[la_primavera-fullset.txt
](./abstract/output/la_primavera-fullset.txt)

        - 「春」フォント情報、フォント非埋め込み  
        サブセット埋め込み  
        フルセット埋め込み（gs-9.22rc2 生成のため不完全）

    + [invention1.pdf
](./abstract/output/invention1.pdf)  
[invention1-subset.pdf
](./abstract/output/invention1-subset.pdf)  
[invention1-fullset.pdf
](./abstract/output/invention1-fullset.pdf)

        - 楽譜の断片「インヴェンション第一番」、フォント非埋め込み  
	      サブセット埋め込み  
        フルセット埋め込み（gs-9.22rc2 生成のため不完全）

    + [invention1.txt
](./abstract/output/invention1.txt)  
[linvention1-subset.txt
](./abstract/output/invention1-subset.txt)  
[invention1-fullset.txt
](./abstract/output/invention1-fullset.txt)

        - 「インヴェンション第一番」フォント情報、フォント非埋め込み  
	      サブセット埋め込み  
        フルセット埋め込み（gs-9.22rc2 生成のため不完全）

    + [fur_elise.pdf
](./abstract/output/fur_elise.pdf)  
[fur_elise-subset.pdf
](./abstract/output/fur_elise-subset.pdf)  
[fur_elise-fullset.pdf
](./abstract/output/fur_elise-fullset.pdf)

        - 楽譜の断片「エリーゼのために」、フォント非埋め込み  
        サブセット埋め込み  
        フルセット埋め込み（gs-9.22rc2 生成のため不完全）

    + [fur_elise.txt
](./abstract/output/fur_elise.txt)  
[fur_elise-subset.txt
](./abstract/output/fur_elise-subset.txt)  
[fur_elise-fullset.txt
](./abstract/output/fur_elise-fullset.txt)

        - 「エリーゼのために」フォント情報、フォント非埋め込み  
        サブセット埋め込み  
        フルセット埋め込み（gs-9.22rc2 生成のため不完全）

* LilyPond でエクスポートした Ghostscript へ渡す
フォントリソースのみ含まれた PostScript ファイル

    + [fonts/Emmentaler-18.font.ps
](./abstract/output/fonts/Emmentaler-18.font.ps)

        - Emmentaler-18 フォント（音符フォント）

    + [fonts/Emmentaler-20.font.ps
](./abstract/output/fonts/Emmentaler-20.font.ps)

        - Emmentaler-20 フォント（音符フォント）

    + [fonts/Emmentaler-Brace.font.ps
](./abstract/output/fonts/Emmentaler-Brace.font.ps)

        - Emmentaler-Brace フォント（音符フォント）

    + [fonts/TeXGyreSchola-Bold.font.ps
](./abstract/output/fonts/TeXGyreSchola-Bold.font.ps)

        - TeXGyreSchola-Bold フォント

    + [fonts/TeXGyreSchola-Regular.font.ps
](./abstract/output/fonts/TeXGyreSchola-Regular.font.ps)

        - TeXGyreSchola-Regular フォント

* 比較用メイン PDF

    + サブセット埋め込み

        - [extractpdfmark-texconf2017-abstract-subset.pdf
](./abstract/output/extractpdfmark-texconf2017-abstract-subset.pdf)  
[extractpdfmark-texconf2017-abstract-subset.txt
](./abstract/output/extractpdfmark-texconf2017-abstract-subset.txt)

    + フルセット埋め込み（不完全）

        - [extractpdfmark-texconf2017-abstract-fullset.pdf
](./abstract/output/extractpdfmark-texconf2017-abstract-fullset.pdf)  
[extractpdfmark-texconf2017-abstract-fullset.txt
](./abstract/output/extractpdfmark-texconf2017-abstract-fullset.txt)

        - [extractpdfmark-texconf2017-abstract-fullset-texoutputted.pdf
](./abstract/output/extractpdfmark-texconf2017-abstract-fullset-texoutputted.pdf)  
[extractpdfmark-texconf2017-abstract-fullset-texoutputted.txt
](./abstract/output/extractpdfmark-texconf2017-abstract-fullset-texoutputted.txt)

        - [extractpdfmark-texconf2017-abstract-fullset.pdfmark.ps
](./abstract/output/extractpdfmark-texconf2017-abstract-fullset.pdfmark.ps)

---

## 発表資料

[SlideShare](https://www.slideshare.net/trueroad_jp/extract-pdfmarkpdf)
にあります。

ソースファイルや中間ファイルなどは
[slide/](./slide/)以下にあります。

## License

Copyright (C) 2017 Masamichi Hosoda.

License: CC BY-SA 4.0

[LICENSE](./LICENSE) をご覧ください。
