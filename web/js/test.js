
$(function(){
	alert('dsa');
	var cat1=Cat.createNew();
	cat1.makeSound();
});


var Cat = {
	createNew : function() {
		var cat = {};
		cat.name = "大猫";
		cat.makeSound = function() {
			alert('喵喵喵');
			return cat;
		}
	}
}