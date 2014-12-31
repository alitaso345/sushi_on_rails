$(function(){
  $(".sushi_img").rotate({ 
    bind: 
    { 
      click: function(){
        $(this).rotate({
          angle: 0,
          animateTo: 360,
          easing: $.easing.easeInOutExpo
        })
      }
    } 
  });
});
