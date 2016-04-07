$(document).ready(function(){
    $("#button1").click(function(){
    	setTimeout(function(){
    		$(".unit1").parent().children().removeClass("visible")
    	}, 0);
    	setTimeout(function(){
    		$(".unit1").addClass("visible")
    	}, 800);
    });
    $("#button2").click(function(){
    	setTimeout(function(){
    		$(".unit2").parent().children().removeClass("visible")
    	}, 0);
    	setTimeout(function(){
    		$(".unit2").addClass("visible")
    	}, 800);
    });
    $("#button3").click(function(){
    	setTimeout(function(){
    		$(".unit3").parent().children().removeClass("visible")
    	}, 0);
    	setTimeout(function(){
    		$(".unit3").addClass("visible")
    	}, 800);
    });
    $("#button4").click(function(){
    	setTimeout(function(){
    		$(".unit4").parent().children().removeClass("visible")
    	}, 0);
    	setTimeout(function(){
    		$(".unit4").addClass("visible")
    	}, 800);
    });
});