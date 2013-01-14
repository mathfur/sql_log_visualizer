$(function(){
  var circle = null;
  var reload = function(){
    $.getJSON('/reload', function(json){
      $.each(json, function(i, table_name){
        circle = circles[table_name]
        if(circle != undefined){
          circles[table_name].attr({'fill': '#f00'}).animate({fill:'#fff'}, 50);
        }else{
          console.log(table_name + 'is not defined in config/graph.yaml.');
        }
      });
      setTimeout(reload, 100);
    });
  };
  reload();
});

