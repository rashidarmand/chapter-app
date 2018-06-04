// Reader Settings
// event listener to refresh turbolinks

document.addEventListener("turbolinks:load", function(){

    // sepia setting
    $(document).ready(function(){
        $("#sepia").click(function(){
            $("#textBox").css({"background-color": "#d8d6bf", "color": "#000"});
        });
    });
    
    // black setting
    $(document).ready(function(){
        $("#black").click(function(){
            $("#textBox").css({"background-color": "#000", "color": "#fff"});
        });
    });
    
    // white setting
    $(document).ready(function(){
        $("#white").click(function(){
            $("#textBox").css({"background-color": "#fff", "color": "#000"});
        });
    });

    // font size settings
    $(document).ready(function(){
        var originalSize = $('#textBox').css('font-size');

    // increase 
        $("#zoom").click(function(){
         var currentSize = $('#textBox').css('font-size');
         var currentSize = parseFloat(currentSize)*1.2;
         $('#textBox').css('font-size', currentSize);
  
        return false;
     });
  
     // decrease
     $("#minus").click(function(){
        var currentFontSize = $('#textBox').css('font-size');
        var currentSize = $('#textBox').css('font-size');
        var currentSize = parseFloat(currentSize)*0.8;
        $('#textBox').css('font-size', currentSize);
  
        return false;
     });
  });

// Notice Timeout



})


function bookProgress(){
    booksRead = parseInt(document.getElementById("books-read").innerHTML);
    userRank = document.getElementById("user-rank");
    if(booksRead < 4){
        userRank.innerHTML = "Caterpillar";
    }
    else if (booksRead > 4 && booksRead < 8){
        userRank.innerHTML = "Cocoon";
    }
    else if (booksRead > 7){
        userRank.innerHTML = "Butterfly"
      elements = document.getElementsByClassName("book-progress-bar");
      for(let i = 0; i < elements.length; i++){
          elements[i].classList.add("hidden");
      }
    }  
}

