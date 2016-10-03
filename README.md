# node-markdown2pdf

Convert markdown to PDF file.

## Oeverview

This is my gulp project. It reading all the files in a folder recursively and convert markdown file to PDF file.

markdownファイルを、PDFファイルへ一括変換します。markdown(.md)→PDFの変換には[markdown-pdf](https://www.npmjs.com/package/markdown-pdf)と[gulp](https://www.npmjs.com/package/gulp)を使わせて頂いてます。

## Demo

Please see the following.
[https://github.com/tea3/node-markdown2pdf/blob/master/file/pdf/sample-markdown.pdf](https://github.com/tea3/node-markdown2pdf/blob/master/file/pdf/sample-markdown.pdf)

## Install

```
$ git clone https://github.com/tea3/node-markdown2pdf.git
$ cd node-markdown2pdf
$ npm install
```

## Usage

1. Copy your markdown file to the `./file/markdown/`.

2. Please run `gulp` task.

```
$ gulp b
```
