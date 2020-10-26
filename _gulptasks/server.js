import {
	watch,
	series,
	parallel
} from "gulp"
import bSync from "browser-sync";

import jsCore from "./core-js"
import jsTask from "./script"
import pugTask from "./html"
import cssCore from "./core-css"
import sassTask from "./css"
import {
	copyImage
} from "./copy";
import {
	copyFavicon
} from "./copy";
import {
	cleanImage
} from "./clean";

export const server = () => {
	bSync.init({
		notify: true,
		server: {
			baseDir: "_dist",
		},
		port: 8000
	})

	watch([
		"src/js/*.js"
	], series(jsTask));

	watch([
		"src/**/**.pug"
	], series(pugTask));

	watch([
		"src/_components/_abstracts/**.sass",
		"src/_components/_globals/**.sass",
		"src/_components/**/**.sass"
	], series(sassTask));

	watch([
		"src/assets/**/**.{svg,png,jpg,speg,gif,jpge,PNG,JPGE,JPG,SVG,GIF,SPEG, ico}",
		"src/favicon.ico"
	], series(cleanImage, copyImage, copyFavicon));

	watch([
		"config.json"
	], parallel(jsCore, cssCore));

	watch([
		"_dist"
	]).on("change", bSync.reload);
}

module.exports = server;
