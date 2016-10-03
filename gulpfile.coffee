"use strict"

gulp        = require 'gulp'
glob        = require 'glob'                  #パターンマッチでパスを見つけ出す
stylus      = require 'gulp-stylus'           #stylusコンパイル
nib         = require 'nib'                   #stylus nib
del         = require 'del'                   #指定ファイル削除
exec        = require("child_process").exec   #内部でコマンドラインプロセスを実行
runSequence = require 'run-sequence'          #タスクの逐次処理
plumber     = require 'gulp-plumber'          #エラー時のgulp停止を防ぐ
notify      = require 'gulp-notify'           #エラー時に通知を発行


# ファイルの削除
gulp.task "clean-dist" , ->
  return del './src/dist/'

gulp.task "clean-pdf" , ->
  return del './file/pdf/'


# STYLUSのコンパイル
gulp.task "stylus", ->
  gulp.src([
    "./src/css/style.styl"
  ]).pipe(plumber(errorHandler: notify.onError("<%= error.message %>")))
  .pipe(stylus({
      use: [nib()],
      compress: false,
      linenos: false
    }))
  .pipe gulp.dest("./src/dist/")


# node.jsを実行する。
gulp.task "makePDF", (cb) ->
  exec "node index.js", (err) ->
    return cb(err)  if err  # return error
    cb()                    # finished task
    return
  return


# --------------------------------
# PDF生成
# src/css/style.stylをコンパイル後、file/markdown/にあるマークダウン・ファイルをPDFに変換する
# --------------------------------
gulp.task "b", ->
  runSequence "clean-dist",
  "clean-pdf",
  "stylus",
  "makePDF"