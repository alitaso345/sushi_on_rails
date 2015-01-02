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
  $('#rotate_all').on('click', function(){
    $('#sushis').rotate({
      angle: 0,
      animateTo:360,
      duration: 3000
    })
  });
}); 
