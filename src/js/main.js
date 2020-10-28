const checkLayoutBanner123 = () => {
    if ($(window).width() < 1024) {
        const pagesBanner = $("#page-banner");
        const breadcrumb = $(".global-breadcrumb");
        const heightHeader = 60;
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
    });
};
function tabs() {
    $(".tabs > li").on("click", function () {
        var $panel = $(this).closest(".tab-panels");
        $panel.find("li.active").removeClass("active");
        $(this).addClass("active");
        var panelToShow = $(this).attr("rel");
        $panel.find(".panel.active").fadeOut(300, showNextPanel);

        function showNextPanel() {
            $(this).removeClass("active");
            $("#" + panelToShow).fadeIn(300, function () {
                $(this).addClass("active").fadeIn(300);
            });
        }
    });
    if ($(window).width() < 992 && ".category-nav".length >= 1) {
        $(".category-nav").on("click", function () {
            $(this).find(".material-icons").toggleClass("active");
            $(this).siblings(".tabs, .filter-content").slideToggle("slow");
        });
    }
}

const checkMenuLayout = () => {
    $(".hambuger").click(function () {
        $(this).toggleClass("active");
        $(".menu-desktop").toggleClass("active");
        $("#overlay").toggleClass("active");
    });
    $("#overlay").click(function () {
        $(".hambuger").removeClass("active");
        $(".menu-desktop").removeClass("active");
    });
    if ($(window).width() <= 1024) {
        $("header").addClass("active");
    } else {
        $("header").removeClass("active");
    }
};
document.addEventListener("DOMContentLoaded", () => {
    checkLayoutBanner123();
    checkMenuLayout();
    slidePage();
    window.addEventListener("resize", () => {
        if ($(window).width() <= 1024) {
            $("header").addClass("active");
        } else {
            $("header").removeClass("active");
            $(".menu-desktop").removeClass("active");
        }
    });
});
