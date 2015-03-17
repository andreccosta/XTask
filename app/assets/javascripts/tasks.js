$( document ).on("ready page:load", function() {
    $(".progress_value").each(function(i, item) {
    	setPercentage($(".bar").get(i), $(this).text());
    });

    $("#tasks th a, #tasks .pagination a").click(function() {
      $.getScript(this.href);
      return false;
    });

    $("#tasks_search").submit(function() {
      $.get(this.action, $(this).serialize(), null, "script");
      return false;
    });

    $('.task_progress_input').on("change mousemove blur", function() {
      $('.task_progress_input').val($(this).val());
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