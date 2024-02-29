document.addEventListener("DOMContentLoaded", function() {
	let categoryItems = document.querySelectorAll(".category li");
	categoryItems.forEach(function(item) {
		item.addEventListener("click", function() {
			categoryItems.forEach(function(item) {
				item.classList.remove("on");
			});
			this.classList.add("on");
		})
	})
})
