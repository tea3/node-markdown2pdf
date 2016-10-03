var markdownpdf = require("markdown-pdf");
var fs          = require("fs");
var path 		= require("path");
var mkdirp      = require("mkdirp");
var fl			= require("node-filelist");
var log 		= require("log-util");
var _filelist	= [];

function createDistDir(){
	mkdirp('./file/pdf',function(err){
		readDir();
	});
}

function readDir(){
	fl.read( ["./file/markdown"] , {"ext":"md"} , function(results){
		_filelist = results;
		doTask();
	});
}

function doTask(){
	if(_filelist && _filelist.length > 0 ){
		var filePath = _filelist.shift();
		var pdfPath  = ("file/pdf/" + path.basename(filePath.path)).replace( path.extname(filePath.path) , ".pdf" )
		convertPDF( filePath.path , pdfPath );
	}
}

function convertPDF(markdownPath , pdfPath){
  	markdownpdf({cssPath : "src/dist/style.css" , paperFormat:"A4" , renderDelay: 5000 , paperBorder:"2cm" }).from(markdownPath).to(pdfPath , function () {
  	  log.info(" -> " + pdfPath);
	  doTask();
	});
}

function main(){
	createDistDir();
}

main();