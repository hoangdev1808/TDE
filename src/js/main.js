const checkLayoutBanner123 = () => {
    if ($(window).width() <= 1024) {
        const pagesBanner = $("#page-banner");
        const breadcrumb = $(".global-breadcrumb");
        const heightHeader = 80;
        const mainBanner = $("#home-banner");
        if (mainBanner.length < 1 && pagesBanner.length < 1 && breadcrumb.length == 1) {
            breadcrumb.css("padding-top", heightHeader);
        } else if (mainBanner.length < 1 && pagesBanner.length < 1 && breadcrumb.length < 1) {
            $("main").css("padding-top", heightHeader);
        } else if (pagesBanner.length < 1) {
            mainBanner.css("padding-top", heightHeader);
        } else if (mainBanner.length < 1) {
            pagesBanner.css("padding-top", heightHeader);
        }
    }
};
const slidePage = () => {
    new Swiper(".banner-home .swiper-container", {
        pagination: {
            el: ".swiper-pagination",
        },
        autoplay: {
            delay: 4500,
            disableOnInteraction: false,
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
    new Swiper(".steps .swiper-container", {
        loop: true,
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
            768: {
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
        breakpoint: 768,
    });
};
const clickBuy = () => {
    $(".button-order").click(function () {
        $(".wrap-list-buy ").slideToggle();
    });
};
// function tabs() {
//     $(".tabs > li").on("click", function () {
//         var $panel = $(this).closest(".tab-panels");
//         $panel.find("li.active").removeClass("active");
//         $(this).addClass("active");
//         var panelToShow = $(this).attr("rel");
//         $panel.find(".panel.active").fadeOut(300, showNextPanel);

//         function showNextPanel() {
//             $(this).removeClass("active");
//             $("#" + panelToShow).fadeIn(300, function () {
//                 $(this).addClass("active").fadeIn(300);
//             });
//         }
//     });
//     if ($(window).width() < 992 && ".category-nav".length >= 1) {
//         $(".category-nav").on("click", function () {
//             $(this).find(".material-icons").toggleClass("active");
//             $(this).siblings(".tabs, .filter-content").slideToggle("slow");
//         });
//     }
// }

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
    if ($(window).width() <= 1024) {
        $("header").addClass("active");
    } else {
        $("header").removeClass("active");
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
document.addEventListener("DOMContentLoaded", () => {
    checkLayoutBanner123();
    checkMenuLayout();
    mainSearch();
    slidePage();
    moveThucDon();
    clickBuy();
    tabAcordition();
    window.addEventListener("resize", () => {
        if ($(window).width() <= 1024) {
            $("header").addClass("active");
        } else {
            $("header").removeClass("active");
            $(".menu-desktop").removeClass("active");
        }
    });
});
