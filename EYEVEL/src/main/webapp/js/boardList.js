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

/*let category = document.querySelectorAll(".board_category");
let board_main = document.querySelectorAll(".board_main");

category.forEach((e, i) => {
	e.addEventListener("click", () => {
		if (i == 0) {
			for (let j = 0; j < board_main.length; j++) {
				board_main[j].classList.add("on");
			}
		} else if (i == 1) {
			for (let j = 0; j < board_main.length; j++) {
				if (board_main[j].classList.item(1) == 0) {
					board_main[j].classList.add("on");
				} else {
					board_main[j].classList.remove("on");
				}
			}
		} else if (i == 2) {
			for (let j = 0; j < board_main.length; j++) {
				if (board_main[j].classList.item(1) == 1) {
					board_main[j].classList.add("on");
				} else {
					board_main[j].classList.remove("on");
				}
			}
		}
	})
})*/