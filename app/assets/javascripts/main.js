// Reader Settings
// event listener to refresh turbolinks


document.addEventListener("turbolinks:load", function(){
	
	let flashPanel = document.querySelector(".flash")
	// flash timeout
	window.setTimeout(() => {
		flashPanel.classList.add("hide")
	  }, 3000);

	// sepia setting
	document.querySelector('#sepia').addEventListener('click', ()=>{
		document.querySelector('body').style.cssText = "background-color: #d8d6bf; color: #000;";
		document.querySelector('.fas.fa-search-plus').style.cssText = "color: #000;";
		document.querySelector('.fas.fa-search-minus').style.cssText = "color: #000;";
		document.querySelector('.far.fa-bookmark').style.cssText = "color: #000;";
	});
	
	
	// black setting
	document.querySelector('#black').addEventListener('click', ()=>{
		document.querySelector('body').style.cssText = "background-color: #000; color: #fff;";
		document.querySelector('.fas.fa-search-plus').style.cssText = "color: #fff;";
		document.querySelector('.fas.fa-search-minus').style.cssText = "color: #fff;";
		document.querySelector('.far.fa-bookmark').style.cssText = "color: #fff;";
	});
	
	// white setting
	document.querySelector('#white').addEventListener('click', ()=>{
		document.querySelector('body').style.cssText = "background-color: #fff; color: #000;";
		document.querySelector('.fas.fa-search-plus').style.cssText = "color: #000;";
		document.querySelector('.fas.fa-search-minus').style.cssText = "color: #000;";
		document.querySelector('.far.fa-bookmark').style.cssText = "color: #000;";
	});

	// font size settings
	// // increase 
	document.querySelector('#zoom').addEventListener('click', ()=>{
		let currentFontSize = window.getComputedStyle(document.querySelector('#textBox')).fontSize;
		let currentSize = parseFloat(currentFontSize) * 1.2;
		document.querySelector('#textBox').style.cssText = `font-size: ${currentSize}px;`;
	});
  
	//  // decrease
	document.querySelector('#minus').addEventListener('click', ()=>{
		let currentFontSize = window.getComputedStyle(document.querySelector('#textBox')).fontSize;
		let currentSize = parseFloat(currentFontSize) * 0.8;
		document.querySelector('#textBox').style.cssText = `font-size: ${currentSize}px;`;
	});


// Notice Timeout



})


function bookProgress(){
	booksRead = parseInt(document.getElementById("books-read").innerHTML);
	userRank = document.getElementById("user-rank");
	progressBar = document.getElementById("progress-bar")
	if(booksRead < 4){
		userRank.innerHTML = "Caterpillar";
		if (booksRead===1){
			progressBar.setAttribute("style",`width:${33}%`)
		}
		else if(booksRead === 2){
			progressBar.setAttribute("style",`width:${66}%`)
		}
		else if (booksRead ===3){

			progressBar.setAttribute("style",`width:${92}%`)
		}
	}
	else if (booksRead > 3 && booksRead < 8){
		userRank.innerHTML = "Cocoon";
		if(booksRead ===4 ){
			progressBar.setAttribute("style",`width:${9}%`)
		}
		else if (booksRead===5){
			progressBar.setAttribute("style",`width:${33}%`)
		}
		else if(booksRead === 6){
			progressBar.setAttribute("style",`width:${66}%`)
		}
		else if (booksRead ===7){

			progressBar.setAttribute("style",`width:${92}%`)
		}
	}
	else if (booksRead > 7){
	  userRank.innerHTML = "Butterfly";
	  elements = document.getElementsByClassName("book-progress-bar");
	  for(let i = 0; i < elements.length; i++){
		  elements[i].classList.add("hidden");
	  }
	}  
}

