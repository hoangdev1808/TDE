const checkLayoutBanner123 = () => {
	const pagesBanner = $("#page-banner");
	const mainBanner = $("#home-banner");
	const BreadCrumb = $(".global-breadcrumb");
	if ($(window).width() > 1280) {
		const widthHeader = $("header").outerWidth();
		if (mainBanner.length >= 1) {
			$("section").css("padding-left", widthHeader);
			$("footer").css("padding-left", widthHeader);
		} else if (pagesBanner.length >= 1) {
			$("section").css("padding-left", widthHeader);
			$("footer").css("padding-left", widthHeader);
			BreadCrumb.css("padding-left", widthHeader);
		} else {
			$("section").css("padding-left", widthHeader);
			$("footer").css("padding-left", widthHeader);
			BreadCrumb.css("padding-left", widthHeader);
		}
	}
	if ($(window).width() <= 1280) {
		const heightHeader = 80;
		if (mainBanner.length >= 1) {
			$("main").css("padding-top", heightHeader);
		} else if (pagesBanner.length >= 1) {
			$("main").css("padding-top", heightHeader);
		} else {
			$("main").css("padding-top", heightHeader);
		}
	}
};
const slidePage = () => {
	new Swiper(".banner-home .swiper-container", {
		slidesPerView: 1,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		pagination: {
			el: ".swiper-pagination",
		},
	});
	if ($(".homepage").length == 1 && $(window).width() > 1024) {
		var mySwiper = document.querySelector(
			".banner-home .swiper-container"
		).swiper;
		$(".banner-home .swiper-container").mouseenter(function () {
			mySwiper.autoplay.stop();
		});
		$(".banner-home .swiper-container").mouseleave(function () {
			mySwiper.autoplay.start();
		});
	}
	new Swiper(".thuc-don-ct-2 .swiper-container", {
		slidesPerView: 3,
		spaceBetween: 30,
		autoplay: {
			delay: 4000,
		},
		lazy: true,
		navigation: {
			nextEl: ".swiper-next",
			prevEl: ".swiper-prev",
		},
		breakpoints: {
			768: {
				slidesPerView: 2,
				spaceBetween: 20,
			},
			575: {
				slidesPerView: 2,
				spaceBetween: 10,
			},
		},
	});
	//Swiper Gioi Thieu
	new Swiper(".history .swiper-container", {
		loop: true,
		navigation: {
			nextEl: ".history .swiper-next",
			prevEl: ".history .swiper-prev",
		},
		autoplay: {
			delay: 3000,
		},
		centeredSlides: true,
		slidesPerView: 3,
		spaceBetween: 30,
		breakpoints: {
			992: {
				slidesPerView: 2,
				spaceBetween: 30,
				centeredSlides: false,
			},
			768: {
				slidesPerView: 1,
				spaceBetween: 0,
			},
		},
	});
	new Swiper(".partner .swiper-container", {
		loop: true,
		autoplay: {
			delay: 3000,
		},
		navigation: {
			nextEl: ".partner .swiper-next",
			prevEl: ".partner .swiper-prev",
		},
		slidesPerView: 4,
		spaceBetween: 20,
		breakpoints: {
			640: {
				slidesPerView: 2,
				spaceBetween: 30,
			},
			768: {
				slidesPerView: 3,
				spaceBetween: 20,
			},
		},
	});
	var tagThucDon = new Swiper(".thucdon .swiper-container", {
		navigation: {
			nextEl: ".thucdon .button-next",
			prevEl: ".thucdon .button-prev",
		},
		slidesPerView: 4,
		spaceBetween: 20,
		observer: true,
		observeParents: true,
		breakpoints: {
			1300: {
				slidesPerView: 3,
				spaceBetween: 0,
			},
			768: {
				slidesPerView: 2,
				spaceBetween: 0,
			},
			400: {
				slidesPerView: 1,
				spaceBetween: 0,
			},
		},
	});
	setTimeout(() => {
		let slideIndexActive;
		$(".thucdon .swiper-slide").each(function (index) {
			$(this).attr("data-slide-index", index);
			if ($(this).find("a").hasClass("active")) {
				slideIndexActive = $(this).attr("data-slide-index");
			}
		});
		console.log(slideIndexActive);
		tagThucDon.slideTo(slideIndexActive);
	}, 500);
	new Swiper(".steps .swiper-container", {
		navigation: {
			nextEl: ".steps .swiper-next",
			prevEl: ".steps .swiper-prev",
		},
		slidesPerView: 4,
		spaceBetween: 25,
		autoplay: {
			delay: 4000,
			disableOnInteraction: false,
		},
		breakpoints: {
			576: {
				slidesPerView: 1,
				spaceBetween: 30,
			},
			640: {
				slidesPerView: 2,
				spaceBetween: 10,
			},
			768: {
				slidesPerView: 3,
				spaceBetween: 20,
				autoplay: {
					delay: 3000,
					disableOnInteraction: false,
				},
			},
		},
	});
	new Swiper(".news-other .swiper-container", {
		slidesPerView: 3,
		spaceBetween: 30,
		autoplay: {
			delay: 9000,
			disableOnInteraction: false,
		},
		breakpoints: {
			576: {
				slidesPerView: 1,
				autoplay: {
					delay: 3000,
					disableOnInteraction: false,
				},
			},
			640: {
				slidesPerView: 2,
				spaceBetween: 10,
				autoplay: {
					delay: 3000,
					disableOnInteraction: false,
				},
			},
			768: {
				slidesPerView: 3,
				spaceBetween: 20,
				autoplay: {
					delay: 3000,
					disableOnInteraction: false,
				},
			},
		},
	});
	new Swiper(".khuyenmai .swiper-container", {
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
			renderBullet: function (index, className) {
				return (
					'<span class="' + className + '">' + (index + 1) + "</span>"
				);
			},
		},
	});
	new Swiper(".other-page  .swiper-container", {
		slidesPerView: 3,
		spaceBetween: 30,
		breakpoints: {
			576: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			992: {
				slidesPerView: 2,
				spaceBetween: 10,
			},
		},
	});
};
const moveThucDon = () => {
	$(".thucdon .wrap-td-1 .wrap-left-select").mapping({
		mobileWrapper: ".thucdon .wrap-td-0",
		mobileMethod: "appendTo",
		desktopWrapper: ".thucdon .wrap-td-1",
		desktopMethod: "prependTo",
		breakpoint: 992,
	});
	$("header .menu-desktop .logo").mapping({
		mobileWrapper: "header .menu-mobile",
		mobileMethod: "prependTo",
		desktopWrapper: "header .menu-desktop",
		desktopMethod: "prependTo",
		breakpoint: 1280,
	});
};
const clickBuy = () => {
	$(".button-order").click(function () {
		$(".wrap-list-buy").slideToggle();
		return false;
	});
};

const checkMenuLayout = () => {
	$(".hambuger").click(function () {
		$(this).toggleClass("active");
		$(".menu-desktop").toggleClass("active");
		$("#overlay").toggleClass("active");
	});
	$("#overlay").click(function () {
		$(".hambuger").removeClass("active");
		$(".menu-desktop").removeClass("active");
		$("#overlay").removeClass("active");
	});
	if ($(window).width() <= 1280) {
		$("header").addClass("active");
	} else {
		$("header").removeClass("active");
		$(".menu-desktop").removeClass("active");
	}
};
const mainSearch = () => {
	$(".search-icon").click(function () {
		$(".search-wrap").css("right", "0");
		$("body").addClass("disabled");
	});
	$(".close-btn").click(function () {
		$(".search-wrap").css("right", "-100%");
		$("body").removeClass("disabled");
	});
};
const tabAcordition = () => {
	$(".title-acr").click(function () {
		$(this).addClass("active").siblings(".title-acr").removeClass("active");
		var check = $(this).next().is(".active");
		var checkTitle = $(this).is(".active");
		if (check && checkTitle) {
			$(this).next().removeClass("active").slideUp();
			$(this).removeClass("active");
		} else {
			$(this)
				.next()
				.addClass("active")
				.slideDown()
				.siblings(".content-acr")
				.removeClass("active")
				.slideUp();
		}
	});
};

function moveNewsSpecial() {
	$(".news-new").appendTo(".news-detail-page #news-new");
	$(".site5 .news-new").css("display", "none");
}
function checkFullpage() {
	if ($(".full-page").length >= 1 && $(window).width() >= 1280) {
		$("footer").appendTo(".index-4 ");
	}
}
const moveQuyTrinh = () => {
	if ($(window).width() <= 575) {
		$(".about-6 .wrap-button-slide").mapping({
			mobileWrapper: ".about-6 .wrap-slide",
			mobileMethod: "appendTo",
			desktopWrapper: ".about-6 .wrap-slide",
			desktopMethod: "prependTo",
			breakpoint: 575,
		});
	}
};
const selectOption = () => {
	let elements = $(".thucdon").find("select");
	let getValue = $(".ajxsort option:selected").val();
	$("#" + getValue).addClass("active");
	var checkValue = function () {
		let getValue = $(".ajxsort option:selected").val();
		console.log(getValue);
		$("#" + getValue)
			.addClass("active")
			.siblings("")
			.removeClass("active");
	};
	elements.on("change keyup", checkValue);
};
const CheckActivePage = () => {
	var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
	$(".thucdon .wrap-right a").each(function () {
		if (this.href === path) {
			$(this).addClass("active");
		}
	});
};
const checkProductDetail = () => {
	if ($(".product-detail-page").length == 1) {
		$("#page-banner").remove();
		$(".global-breadcrumb").addClass("product-detail");
	}
};
const hidenPagiPro = () => {
	if ($(".thuc-don-ct").length == 1) {
		$(".pagination").hide();
	}
};
function checkClickDropdown() {
	if ($(window).width() <= 1024) {
		$("header .wrap-list-menu ul li a").click(function () {
			if ($(this).hasClass("active")) {
				return true;
			} else {
				$(this).closest("ul").find("a").removeClass("active");
				$(this).addClass("active");
			}
			return false;
		});
	}
}
function phantrang() {
	$(".modulepager")
		.find(".pagination")
		.find("li>a.NextPage, li>a.LastPage, li>a.BackPage, li>a.FirstPage")
		.parent()
		.hide();
}
/*==================== Check Device ====================*/
/**
 * Determine the mobile operating system.
 * This function returns one of 'iOS', 'Android', 'Windows Phone', or 'unknown'.
 *
 * @returns {String}
 */
function getMobileOperatingSystem() {
	let main = $(".thuc-don-ct");
	let android = $(".thuc-don-ct .wrap-list-buy.ver-android");
	let ios = $(".thuc-don-ct .wrap-list-buy.ver-ios");
	//
	var userAgent = navigator.userAgent || navigator.vendor || window.opera;
	// Windows Phone must come first because its UA also contains "Android"
	if (/windows phone/i.test(userAgent)) {
		ios.remove();
		return "Windows Phone";
	}
	if (/android/i.test(userAgent)) {
		ios.remove();
		return "Android";
	}
	// iOS detection from: http://stackoverflow.com/a/9039885/177710
	if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream) {
		android.remove();
		return "iOS";
	}
	ios.remove();
	return "unknown";
}
/*==================== End Check Device ====================*/
document.addEventListener("DOMContentLoaded", () => {
	getMobileOperatingSystem();
	moveThucDon();
	moveQuyTrinh();
	checkFullpage();
	checkLayoutBanner123();
	checkMenuLayout();
	mainSearch();
	slidePage();
	phantrang();
	clickBuy();
	tabAcordition();
	moveNewsSpecial();
	selectOption();
	window.addEventListener("resize", () => {
		if ($(window).width() <= 1280) {
			$("header").addClass("active");
		} else {
			$("header").removeClass("active");
			$(".menu-desktop").removeClass("active");
		}
	});
	CheckActivePage();
	hidenPagiPro();
	checkProductDetail();
	checkClickDropdown();
});
