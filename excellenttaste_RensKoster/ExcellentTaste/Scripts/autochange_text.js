//Loni Gojani
//04 Januari 2019
//PVB I6AO Excellent Taste

"use strict";
var counter = 0;
const elem = document.getElementById("changing");

function startChangingText(textList, textDuration = 3){
	
	textDuration *= 1000
	elem.innerHTML = textList[0];
	const inst = setInterval(function() {change(textList);}, textDuration);
	}

function change(textList) {

    $("#changing").fadeOut('slow');
    $("#changing").promise().done(function(){
        elem.innerHTML = textList[counter];
        $("#changing").fadeIn('slow');
    });
	counter++;
	if (counter >= textList.length) {
		counter = 0;
	}
}