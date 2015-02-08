# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$( document ).on("ready page:load", function() {
    $('.bar').each(function(index, element) {
    	setPercentage(element, $(this).find("span").text());
    });
});

var randomPercentage = function(element) {
  var percent = Math.floor((Math.random() * 100) + 1);
  
  setPercentage(element, percent);
}

var setText = function(element, text) {
  $(element).find("span").fadeOut(500, function() {
        $(element).find("span").text(text).fadeIn(500);
    });
}

var setPercentage = function(element, percent) {
  console.log('Called to set ' + percent + '\n');

  if(percent < 25) {
    $(element).css( "background-color", "#f63a0f");
  } else if(percent < 50) {
    $(element).css( "background-color", "#f27011");
  } else if(percent < 75) {
    $(element).css( "background-color", "#f2b01e");
  } else if(percent < 90) {
    $(element).css( "background-color", "#f2d31b");
  } else {
    $(element).css( "background-color", "#86e01e");
  }
  
  if(percent < 15)
    setText(element, "");
  else
    setText(element, percent+' %');
  
  $(element).css( "width", percent+'%' );
}
`