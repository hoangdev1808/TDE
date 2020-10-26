import {
	src,
	dest
} from "gulp";
import {
	readFileSync
} from "graceful-fs";

const copyImage = () => {
	return src("src/assets/**/*.{svg,png,jpg,jpeg,gif,mp4,ico}")
		.pipe(dest("_dist/assets"))
};

const copyFonts = () => {
	let glob = JSON.parse(readFileSync("config.json"));
	return src(glob.font, {
			allowEmpty: true
		})
		.pipe(dest("_dist/fonts"));
}

const copyFavicon = () => {
	return src("src/favicon.ico", {
			allowEmpty: true
		})
		.pipe(dest("_dist"));
}

module.exports = {
	copyImage,
	copyFonts,
	copyFavicon
};
