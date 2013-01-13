$(function(){
  var reload = function(){
    $.getJSON('/reload', function(json){
      $.each(json, function(i, table_name){
        circles[table_name].attr({'fill': '#f00'}).animate({fill:'#fff'}, 50);
      });
      setTimeout(reload, 100);
    });
  };
  reload();
});

