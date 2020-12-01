const checkLayoutBanner123 = () => {
    const pagesBanner = $("#page-banner");
    const mainBanner = $("#home-banner");
    if ($(window).width() > 1280) {
        const widthHeader = $("header").outerWidth();
        if (mainBanner.length >= 1) {
            $("section").css("padding-left", widthHeader);
        } else if (pagesBanner.length >= 1) {
            $("section").css("padding-left", widthHeader);
            $("footer").css("padding-left", widthHeader);
        } else {
            $("section").css("padding-left", widthHeader);
            $("footer").css("padding-left", widthHeader);
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
        pagination: {
            el: ".swiper-pagination",
        },
    });
    new Swiper(".thuc-don-ct-2 .swiper-container", {
        slidesPerView: 3,
        spaceBetween: 30,
        loop: true,
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
                slidesPerView: 1,
                spaceBetween: 20,
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
        navigation: {
            nextEl: ".partner .swiper-next",
            prevEl: ".partner .swiper-prev",
        },
        slidesPerView: 4,
        spaceBetween: 20,
        breakpoints: {
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
    new Swiper(".thucdon .swiper-container", {
        navigation: {
            nextEl: ".thucdon .button-next",
            prevEl: ".thucdon .button-prev",
        },
        slidesPerView: 4,
        spaceBetween: 20,
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
    new Swiper(".steps .swiper-container", {
        navigation: {
            nextEl: ".steps .swiper-next",
            prevEl: ".steps .swiper-prev",
        },
        slidesPerView: 4,
        spaceBetween: 25,
        breakpoints: {
            576: {
                slidesPerView: 1,
                spaceBetween: 0,
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
                return '<span class="' + className + '">' + (index + 1) + "</span>";
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
        $(".wrap-list-buy ").slideToggle();
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
document.addEventListener("DOMContentLoaded", () => {
    moveThucDon();
    moveQuyTrinh();
    checkFullpage();
    checkLayoutBanner123();
    checkMenuLayout();
    mainSearch();
    slidePage();
    clickBuy();
    tabAcordition();
    moveNewsSpecial();
    window.addEventListener("resize", () => {
        if ($(window).width() <= 1280) {
            $("header").addClass("active");
        } else {
            $("header").removeClass("active");
            $(".menu-desktop").removeClass("active");
        }
    });
});
