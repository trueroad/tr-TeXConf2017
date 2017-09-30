# -*- coding: utf-8; -*-

.PHONY: all clean dist-clean nonembed subset lilypond-targets

# 使用するコマンド類の定義
LATEXMK = latexmk -lualatex
LILYPOND = lilypond
GS = gs
EXTRACTPDFMARK = extractpdfmark
PDFFONTS = pdffonts
WGET = wget
SED = sed
RM = rm -f

# ターゲットのファイル名（拡張子なし）
TARGET = extractpdfmark-texconf2017-abstract

# LilyPond がフォントをエクスポートするディレクトリ
FONT_EXPORT_DIR = fonts

all: nonembed

clean:
	$(RM) *.aux *.log *.out *.fls *.fdb_latexmk *.pdfmark.ps *~

dist-clean: clean
	$(RM) *.pdf *.txt $(TARGET)-subset.tex $(TARGET)-fullset.tex
	$(RM) -r fonts/

# 非埋め込み版（デフォルト）
nonembed: $(TARGET).pdf $(TARGET).txt \
	$(TARGET)-texoutputted.pdf $(TARGET)-texoutputted.txt \
	$(TARGET).pdfmark.ps

# サブセット埋め込み版（比較用）
subset: $(TARGET)-subset.pdf $(TARGET)-subset.txt

# フルセット埋め込み版（比較用）
fullset: $(TARGET)-fullset.pdf $(TARGET)-fullset.txt \
	$(TARGET)-fullset-texoutputted.pdf \
	$(TARGET)-fullset-texoutputted.txt \
	$(TARGET)-fullset.pdfmark.ps

# LilyPond で生成するファイル群
lilypond-depends: \
	la_primavera.pdf la_primavera.txt \
	la_primavera-subset.pdf la_primavera-subset.txt \
	la_primavera-fullset.pdf la_primavera-fullset.txt \
	fur_elise.pdf fur_elise.txt \
	fur_elise-subset.pdf fur_elise-subset.txt \
	fur_elise-fullset.pdf fur_elise-fullset.txt \
	invention1.pdf invention1.txt \
	invention1-subset.pdf invention1-subset.txt \
	invention1-fullset.pdf invention1-fullset.txt

# 非埋め込み版（デフォルト版）の依存ファイル
$(TARGET)-texoutputted.pdf: \
	$(TARGET).tex \
	by-sa.pdf \
	lilypond-depends

# サブセット埋め込み版（比較用）の依存ファイル
$(TARGET)-subset-texoutputted.pdf: \
	$(TARGET)-subset.tex \
	by-sa.pdf \
	lilypond-depends

# フルセット埋め込み版（比較用）の依存ファイル
$(TARGET)-fullset-texoutputted.pdf: \
	$(TARGET)-fullset.tex \
	by-sa.pdf \
	lilypond-depends

# サブセット埋め込み版 LaTeX ソース生成
%-subset.tex: %.tex
	$(SED) -r 's/\\includegraphics(.*)\{(.+)\.pdf\}/\\includegraphics\1\{\2-subset\.pdf\}/g' $< > $@

# フルセット埋め込み版 LaTeX ソース生成
%-fullset.tex: %.tex
	$(SED) -r 's/\\includegraphics(.*)\{(.+)\.pdf\}/\\includegraphics\1\{\2-fullset\.pdf\}/g' $< > $@

# LilyPond ソース (*.ly) から図 PDF へ：非埋め込み用
# 本文貼り付け用
#   --bigpdfs: 後で音楽フォントを統合するためのエンコーディングを利用する
#              （今後変更される可能性あり）
#   -dgs-never-embed-fonts: フォント非埋め込み PDF を出力
#   -dfont-export-dir: 後で gs で埋め込むためのフォントをエクスポート
%.pdf: %.ly
	$(LILYPOND) --bigpdfs -dgs-never-embed-fonts \
		-dfont-export-dir=$(FONT_EXPORT_DIR) \
		$<
	$(RM) $*-1.eps $*-1.pdf \
		$*-systems.count $*-systems.tex $*-systems.texi

# LilyPond ソース (*.ly) から図 PDF へ：サブセット埋め込み用
# オプション無指定、サブセット埋め込み
%-subset.pdf: %.ly
	$(LILYPOND) -o $(basename $@) $<
	$(RM) $(basename $@)-1.eps $(basename $@)-1.pdf \
		$(basename $@)-systems.count $(basename $@)-systems.tex \
		$(basename $@)-systems.texi

# LilyPond ソース (*.ly) から図 PDF へ：フルセット埋め込み用
#   --bigpdfs: 後で音楽フォントを統合するためのエンコーディングを利用する
#              あわせてフルセットでフォントを埋め込む（まともに動作しない）
#              （今後変更される可能性あり）
%-fullset.pdf: %.ly
	$(LILYPOND) --bigpdfs -o $(basename $@) $<
	$(RM) $(basename $@)-1.eps $(basename $@)-1.pdf \
		$(basename $@)-systems.count $(basename $@)-systems.tex \
		$(basename $@)-systems.texi

# LaTeX ソースから TeX 出力 PDF へ
%-texoutputted.pdf: %.tex
	$(LATEXMK) $<
	mv $*.pdf $@

# TeX 出力 PDF から PDFmark を抽出
%.pdfmark.ps: %-texoutputted.pdf
	$(EXTRACTPDFMARK) $< > $@

# TeX 出力 PDF にフォントを埋め込み、抽出した PDFmark も利用
%.pdf: %.pdfmark.ps %-texoutputted.pdf
	$(GS) -dBATCH -dNOPAUSE -sDEVICE=pdfwrite \
		-sOutputFile=$@ \
		-c .setpdfwrite \
		-f $*.pdfmark.ps $(FONT_EXPORT_DIR)/*.font.ps \
		$*-texoutputted.pdf

# TeX 出力 PDF から重複フォント削除、抽出した PDFmark も利用
# （まともに動作しない）
%-fullset.pdf: %-fullset.pdfmark.ps %-fullset-texoutputted.pdf
	$(GS) -dBATCH -dNOPAUSE -sDEVICE=pdfwrite \
		-dPDFDontUseFontObjectNum \
		-sOutputFile=$@ \
		-c .setpdfwrite \
		-f $*-fullset.pdfmark.ps $*-fullset-texoutputted.pdf

# とくに処理しないでスルー
%-subset.pdf: %-subset-texoutputted.pdf
	cp $< $@

# LilyPond ファイルを生成（冒頭部分＋本文部分）
%.ly: %-core.ly
	cp ly-prologue.ly $@
	cat $< >> $@

# PDF 中のフォント情報を出力
%.txt: %.pdf
	$(PDFFONTS) $< > $@

# EPS から PDF を生成（CC BY-SA のロゴ用）
%.pdf: %.eps
	$(GS) -dBATCH -dNOPAUSE -sDEVICE=pdfwrite \
		-dEPSCrop \
		-sOutputFile=$@ \
		-c .setpdfwrite \
		-f $<

# CC BY-SA のロゴ EPS を取得
by-sa.eps:
	$(WGET) "http://mirrors.creativecommons.org/presskit/buttons/88x31/eps/by-sa.eps"
