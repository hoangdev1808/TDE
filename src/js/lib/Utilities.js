module.exports = {
	sAll(...args) {
		if (args.length === 2) {
			return Array.from(args[0].querySelectorAll(args[1]));
		} else {
			return Array.from(document.querySelectorAll(args[0]));
		}
	},

	s(...args) {
		if (args.length === 2) {
			return args[0].querySelector(args[1]);
		} else {
			return document.querySelector(args[0]);
		}
	},

	gId(...args) {
		if (args.length === 2) {
			return args[0].getElementById(args[1]);
		} else {
			return document.getElementById(args[0]);
		}
	}
}