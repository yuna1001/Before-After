// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .

//Topページのスクロール機能
function scrollabout(){
  $('html, body').animate({scrollTop:778});
}

function scrollhowto(){
  $('html, body').animate({scrollTop:1176});
}

//投稿詳細ページのクリック動作
function changeAfter(){
	var before = document.getElementById('posts-before');
	var after = document.getElementById('posts-after');
  var beforeimage = document.getElementById('posts-image-before');
  var afterimage = document.getElementById('posts-image-after');
  before.style.display = "none";
  after.style.display = "block";
  beforeimage.style.display = "none";
  afterimage.style.display = "block";
  console.log(before);
}

function changeBefore(){
	var after = document.getElementById('posts-after');
	var before = document.getElementById('posts-before');
  var afterimage = document.getElementById('posts-image-after');
  var beforeimage = document.getElementById('posts-image-before');
  after.style.display = "none";
  before.style.display = "block";
  afterimage.style.display = "none";
  beforeimage.style.display = "block";
}

$(function(){
  //fileが選択された時に発火するイベント
  $('input#preview-before').change(function(){
    $('img#before').remove();
    //選択したfileのオブジェクトをpropで取得
    var file = $('input#preview-before').prop('files')[0];
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<img src="${src}" width="114" height="80" id="before">`
      //before-imageの前にhtmlを差し込む
      $('#before-image').before(html);
    }
    fileReader.readAsDataURL(file);
  });
});

$(function(){
  //fileが選択された時に発火するイベント
  $('#preview-after').change(function(){
    $('img#after').remove();
    //選択したfileのオブジェクトをpropで取得
    var file = $('input#preview-after').prop('files')[0];
    console.log(file);
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<img src="${src}" width="114" height="80" id="after">`
      //after-image要素の前にhtmlを差し込む
      $('#after-image').before(html);
    }
    fileReader.readAsDataURL(file);
  });
});



