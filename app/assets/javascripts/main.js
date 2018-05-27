$('.toggleMenu').click(function(){
    $('.sidemenu').addClass("showmenu");
    $('.toggleMenu').addClass("changeopacity");
});

$('.cross').click(function(){
    $('.sidemenu').removeClass("showmenu");
    $('.toggleMenu').removeClass("changeopacity");
});