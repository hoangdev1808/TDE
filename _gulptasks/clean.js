import del from "del";

const cleanDist = () => {
	return del("_dist")
}

const cleanImage = () => {
	return del("_dist/assets")
}

module.exports = {
	cleanDist,
	cleanImage
};
