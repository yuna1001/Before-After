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

function changeAfter(){
	var before = document.getElementById('posts-before');
	var after = document.getElementById('posts-after');
  var beforeimage = document.getElementById('posts-image-before');
  var afterimage = document.getElementById('posts-image-after');
  before.style.display = "none";
  after.style.display = "block";
  beforeimage.style.display = "none";
  afterimage.style.display = "block";
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

function scrollabout(){
  var speed = 400;
  var position = offset('about-scroll');
  animate({scrollTop:position}, speed, 'swing');
}
