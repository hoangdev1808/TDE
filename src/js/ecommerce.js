﻿"use strict";
var siteRoot = "";
var currCulture = "en";
if (window.location.href.indexOf("en-US") > 0) currCulture = "en";
else currCulture = "vi";
var lang = {};
lang["en"] = {
	FullNameRequired: "Please enter your full name",
	PhoneRequired: "Please enter your phone",
	PhoneNotValid: "Phone number not valid",
	EmailRequired: "Please enter your email",
	EmailNotValid: "Email not valid",
	CountryRequired: "Please chose your country",
	ProvinceRequired: "Please choose your province",
	DistrictRequired: "Please choose your district",
	AddressRequired: "Please enter your address",
	PostCodeRequired: "Please enter your Post code or Zip code",
	CityRequired: "Please chose your city",
	CompanyNameRequired: "Please enter your company name",
	CompanyTaxCodeRequired: "Please enter your company tax code",
	CompanyAddressRequired: "Please enter your company address",
	ShippingMethodRequired: "Please choose a shipping method",
	PaymentMethodRequired: "Please choose a payment method",
	AddToCartButton: "Add to cart",
	OutOfStockButton: "Out of stock",
};
lang["vi"] = {
	FullNameRequired: "Vui lòng nhập Họ và Tên",
	PhoneRequired: "Vui lòng nhập Số điện thoại",
	PhoneNotValid: "Số điện thoại không hợp lệ",
	EmailRequired: "Vui lòng nhập Email",
	EmailNotValid: "Email không hợp lệ",
	CountryRequired: "Vui lòng chọn quốc gia",
	ProvinceRequired: "Vui lòng chọn tỉnh/thành phố",
	DistrictRequired: "Vui lòng chọn quận/huyện",
	AddressRequired: "Vui lòng nhập địa chỉ",
	PostCodeRequired: "Vui lòng nhập Mã bưu điện hoặc Zip code",
	CityRequired: "Vui lòng chọn Thành phố",
	CompanyNameRequired: "Vui lòng nhập tên công ty",
	CompanyTaxCodeRequired: "Vui lòng nhập mã số thuế công ty",
	CompanyAddressRequired: "Vui lòng nhập địa chỉ công ty",
	ShippingMethodRequired: "Vui lòng chọn phương thức vận chuyển",
	PaymentMethodRequired: "Vui lòng chọn phương thức thanh toán",
	AddToCartButton: "Thêm vào giỏ hàng",
	OutOfStockButton: "Hết hàng",
};

function ProcessAjax2(pageurl) {
	//to get the ajax content and display in div with id 'content'
	$.ajax({
		url: pageurl,
		data: {
			isajax: true,
		},
		success: function (data) {
			$(".ajaxresponse").html($(data).find(".ajaxresponse").html());
			//$('.ajaxfilterresponse').html($(data).find('.ajaxfilterresponse').html());
			//$('.ajaxbrandresponse').html($(data).find('.ajaxbrandresponse').html());

			$(".productpager").remove();
			$(data).find(".productpager").insertAfter($(".ajaxresponse"));

			SwapUrlAfterProcessAjax2(data);
		},
	});

	//to change the browser URL to 'pageurl'
	if (pageurl != window.location) {
		window.history.pushState(
			{
				path: pageurl,
			},
			"",
			pageurl
		);
	}
}

function SwapUrlAfterProcessAjax2(data) {
	$(data)
		.find(".icon-diamond-list input")
		.each(function () {
			let id = $(this).attr("id");
			let url = $(this).attr("data-url");
			$("#" + id).attr("data-url", url);
		});
}
var slidering = false;

function SetupProductFilter() {
	if ($(".range-slider-values").length > 0) {
		$(".range-slider-values").each(function (element, value) {
			let valuesTitle = [];

			$("input[type='hidden']." + "values-" + $(this).data("id")).each(
				function () {
					valuesTitle.push($(this).data("title"));
				}
			);
			$(this).ionRangeSlider({
				grid: true,
				grid_num: 0,
				from: 0,
				to: valuesTitle.length,
				type: "double",
				skin: "round",
				force_edges: true,
				values: valuesTitle,
				onChange: function (data1) {
					if (!slidering) {
						let id = $(data1.input).attr("data-id");
						let param = "";
						if (
							!(data1.from == data1.min && data1.to == data1.max)
						) {
							$(this.p_values).each(function (index) {
								let val = $(
									"input[data-title = '" +
										this +
										"'].values-" +
										id
								).val();
								if (
									index >= data1.from &&
									index <= data1.to &&
									val != undefined
								) {
									param += "/" + val;
								}
							});
						}
						if ($(data1.input).attr("data-type") == "price") {
							$(".price-filter-min").val(data1.from_value);
							$(".price-filter-max").val(data1.to_value);
						}
						setTimeout(function () {
							let pageUrl = updateURLParameter(
								window.location.href,
								"mf" + id,
								param + "/"
							);
							ProcessAjax2(pageUrl);
							slidering = false;
						}, 500);
					}
					slidering = true;
				},
			});
		});
	}
}

function OpenFormProductContact($button) {
	$("#frm-lienhe .product-title input").val($($button).data("title"));
	$("#frm-lienhe .product-code input").val($($button).data("code"));
	$.fancybox.open({
		src: "#frm-lienhe",
		parentEl: "form",
	});
}

function quantityNumber() {
	$("body").on("click", ".qty-minus", function () {
		let minus = $(this).parents(".input-group").find("input").val();
		if (minus > 0) {
			$(this)
				.parents(".input-group")
				.find("input")
				.val(minus - 1);
		} else {
			$(this).parents(".input-group").find("input").val(0);
		}
		if ($("body").hasClass("cartpage")) $(".amount").trigger("change"); //AjaxCart.updatecart();
	});
	$("body").on("click", ".qty-plus", function () {
		let plus = Number($(this).parents(".input-group").find("input").val());
		$(this)
			.parents(".input-group")
			.find("input")
			.val(plus + 1);
		if ($("body").hasClass("cartpage")) $(".amount").trigger("change"); //AjaxCart.updatecart();
	});
}

$(document).ready(function () {
	if ($("input[provider=15]").length > 0) {
		AjaxCheckout.loadShippingServiceList();
	}
	quantityNumber();
	if ($(".diamond-filter").length > 0) SetupProductFilter();
	$(".diamond-filter").on("change", "input", function () {
		ProcessAjax2($(this).attr("data-url"));
	});
	/*************************************************************************************************************/
	/* BEGIN SEARCH
	/*************************************************************************************************************/
	//Search button
	$(".productsearchbox input[type='submit'],.productsearchbox button").click(
		function () {
			var container = $(this).parent();
			if ($(container).find(".suggestsearch ul li.selected").length) {
				var n = $(container)
					.find(".suggestsearch ul li.selected")
					.eq(0)
					.children("a")
					.attr("href");
				window.location = n;

				return false;
			}

			if ($(container).find("input[type='text']").val() == "") {
				$(container).find("input[type='text']").focus();
				return false;
			}
		}
	);

	//Search textbox
	$(".productsearchbox input[type='text']").keyup(function (n) {
		//        SuggestSearch(this, n);
		CallSuggest(this);
	});

	//    $(".productsearchbox input[type='text']").keydown(function () {
	//        CheckTimer();
	//    });

	var beginTime = 0,
		endTime = 0;

	function CheckTimer() {
		var n = new Date();
		beginTime == 0 && endTime == 0 && (beginTime = n.getTime());
		return;
	}

	function SuggestSearch(obj, n) {
		var i = new Date(),
			t;
		var suggestBoxItems = $(obj).parent().find(".suggestsearch ul");

		if (((endTime = i.getTime()), (beginTime = endTime), n.which == 40)) {
			//$(".productsearchbox .suggestsearch ul li.selected").length == 0 ? $(".productsearchbox .suggestsearch ul li:first").addClass("selected") : (t = $(".productsearchbox .suggestsearch ul li.selected").next(), t.hasClass("li-group") && (t = t.next()), $(".productsearchbox .suggestsearch ul li.selected").removeClass("selected"), t.addClass("selected"));
			$(suggestBoxItems).find(".selected").length == 0
				? $(suggestBoxItems).find("li").first().addClass("selected")
				: ((t = $(suggestBoxItems).find(".selected").next()),
				  t.hasClass("li-group") && (t = t.next()),
				  $(suggestBoxItems).find(".selected").removeClass("selected"),
				  t.addClass("selected"));
			return;
		}
		if (n.which == 38) {
			//$(".productsearchbox .suggestsearch ul li.selected").length == 0 ? $(".productsearchbox .suggestsearch ul li:last").addClass("selected") : (t = $(".productsearchbox .suggestsearch ul li.selected").prev(), t.hasClass("li-group") && (t = t.prev()), $(".productsearchbox .suggestsearch ul li.selected").removeClass("selected"), t.addClass("selected"));
			$(suggestBoxItems).find(".selected").length == 0
				? $(suggestBoxItems).find("li").last().addClass("selected")
				: ((t = $(suggestBoxItems).find(".selected").prev()),
				  t.hasClass("li-group") && (t = t.prev()),
				  $(suggestBoxItems).find(".selected").removeClass("selected"),
				  t.addClass("selected"));
			return;
		}

		SetTimeer(obj, 1);
	}

	function SetTimeer(obj, n) {
		setTimeout(function () {
			var i = new Date(),
				t = i.getTime();
			if (beginTime == endTime) {
				if (t - endTime < 750 && t - endTime >= 0) {
					SetTimeer(obj, n);
					return;
				}
				if (t - endTime >= 750) {
					CallSuggest(obj);
					return;
				}
			} else return;
		}, n);
	}

	function CallSuggest(obj) {
		var container = $(obj).parent();
		if (!$(container).find(".suggestsearch").length)
			$(container).append("<div class='suggestsearch'></div>");

		var suggestBox = $(container).find(".suggestsearch");

		var t = $(obj)
				.val()
				.replace(
					/:|;|!|@@|#|\$|%|\^|&|\*|'|"|>|<|,|\.|\?|\/|`|~|\+|=|_|\(|\)|{|}|\[|\]|\\|\|/gi,
					""
				),
			n = t.trim().toLowerCase();
		if (n.length < 2) {
			$(suggestBox).hide();
			return;
		}
		n.length >= 2 &&
			($(obj).addClass("loading"),
			$.ajax({
				url: siteRoot + "/Product/Services/SuggestSearch.ashx",
				type: "GET",
				dataType: "html",
				data: {
					q: n,
				},
				cache: !0,
				success: function (data) {
					$(obj).removeClass("loading");
					data == "" || data == " "
						? $(suggestBox).hide()
						: $(suggestBox).html(data).show();
				},
			}));
	}

	var obp = $(".searchresults .productcount");
	if ($(obp).length) {
		$.get(
			siteRoot +
				"/Product/Services/SearchCountResult.ashx?q=" +
				$(obp).attr("keyword"),
			function (data) {
				$(obp).text(" (" + data + ")");
			}
		);
	}

	var obn = $(".searchresults .newscount");
	if ($(obn).length) {
		$.get(
			siteRoot +
				"/News/Services/SearchCountResult.ashx?q=" +
				$(obn).attr("keyword"),
			function (data) {
				$(obn).text(" (" + data + ")");
			}
		);
	}

	/*************************************************************************************************************/
	/* END SEARCH
	/*************************************************************************************************************/

	/*************************************************************************************************************/
	/* BEGIN POPUP/FANCYBOX
	/*************************************************************************************************************/

	// const popUpCard = () => {
	// $('.btn-order').on('click', function () {
	// $('.popup-card ').fancybox().trigger("click");
	// })
	// }
	$(".btn-order").on("click", function () {
		$(".popup-card ").fancybox().trigger("click");
		AjaxCart.buynowpopup(this);
	});

	/*************************************************************************************************************/
	/* END POPUP/FANCYBOX
	/*************************************************************************************************************/

	/*************************************************************************************************************/
	/* BEGIN FILTER
	/*************************************************************************************************************/

	/********Price filter ********/
	var minprice = 0;
	var maxprice = 10000000;
	initSlider();

	function initSlider() {
		if ($("#slider-range").length > 0) {
			minValue = 0;
			maxValue = 10000000;
			if ($(".pricemin").text().length)
				minValue = parseInt($(".pricemin").text());
			if ($(".pricemax").text().length)
				maxValue = parseInt($(".pricemax").text());

			var options = {
				range: true,
				step: 500000,
				min: 0,
				max: 10000000,
				values: [minValue, maxValue],
				slide: function (event, ui) {
					$(".price-range .min-input").html(addCommas(ui.values[0]));
					$(".price-range .max-input").html(addCommas(ui.values[1]));
				},
				change: function (event, ui) {
					if (minprice == ui.values[0] && maxprice == ui.values[1]) {
						// do nothing
					} else {
						minprice = ui.values[0];
						maxprice = ui.values[1];
						priceChange();
					}
				},
			};

			$("#slider-range").slider(options);

			$(".price-range .min-input").html(
				addCommas($("#slider-range").slider("values", 0))
			);
			$(".price-range .max-input").html(
				addCommas($("#slider-range").slider("values", 1))
			);
		}
	}

	function addCommas(nStr) {
		nStr += "";
		x = nStr.split(".");
		x1 = x[0];
		x2 = x.length > 1 ? "." + x[1] : "";
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, "$1" + "." + "$2");
		}
		return x1 + x2;
	}

	function priceChange() {
		pageurl = $(".urlwithoutprice").attr("href");
		$.ajax({
			url: pageurl,
			data: {
				isajax: true,
				price: minprice + "-" + maxprice,
			},
			success: function (data) {
				$(".ajaxresponse").html($(data).find(".ajaxresponse").html());
				$(".ajaxfilterresponse").html(
					$(data).find(".ajaxfilterresponse").html()
				);
				$(".ajaxbrandresponse").html(
					$(data).find(".ajaxbrandresponse").html()
				);
				$(".productpager").remove();
				$(data).find(".productpager").insertAfter($(".ajaxresponse"));

				pageurl = $(data).find(".urlwithprice").attr("href");
				//to change the browser URL to 'pageurl'
				if (pageurl != window.location) {
					window.history.pushState(
						{
							path: pageurl,
						},
						"",
						pageurl
					);
				}
			},
		});
	}
	/********End Price filter ********/
	/********Price change ********/
	$(".btn-dec").click(function (e) {
		e.preventDefault();
		let amountInput = $(this).next();
		let amountVal = parseInt(amountInput.val());
		if (amountVal <= 0) {
			amountVal = 0;
		} else {
			amountVal--;
		}
		amountInput.val(amountVal);
		$(".amount").trigger("change");
	});

	$(".btn-inc").click(function (e) {
		e.preventDefault();
		let amountInput = $(this).prev();
		let amountVal = parseInt(amountInput.val());
		amountVal++;
		amountInput.val(amountVal);
		$(".amount").trigger("change");
	});
	/********Reward points ********/
	// initPointSlider();

	// function initPointSlider() {
	// 	var pointSlider = $('#pointSlider');
	// 	if (pointSlider.length > 0) {
	// 		var options = {
	// 			range: false,
	// 			step: pointSlider.data('step'),
	// 			min: pointSlider.data('min'),
	// 			max: pointSlider.data('max'),
	// 			value: pointSlider.data('value'),
	// 			slide: function (event, ui) {
	// 				$("#spendingPointsLabel").text(ui.value);
	// 				$("#spendingPoints").val(ui.value);
	// 			},
	// 			change: function (event, ui) {
	// 				var data = {
	// 					'method': 'SpendingPoint',
	// 					'point': $("#spendingPoints").val()
	// 				};
	// 				$.ajax({
	// 					cache: false,
	// 					url: siteRoot + "/Product/Services/CheckoutService.aspx",
	// 					data: data,
	// 					type: 'post',
	// 					success: function (result) {
	// 						if (result.success) {
	// 							$('.discount-total').html(result.discountTotal);
	// 							$('.order-total').html(result.total);
	// 						} else
	// 							alert(result.message);
	// 					}
	// 				});
	// 			}
	// 		};

	// 		pointSlider.slider(options);
	// 	}
	// }
	/********End Reward points ********/

	/********Countdown ********/

	initCountdown();
	function initCountdown() {
		if ($("body").is(".canhcam, .vi-vn, .site1")) {
			console.log("Init countdown");
			$(".date").each(function (index, value) {
				let endDate = $(this).attr("data-countdown");
				let cd = $(this)
					.countdown(endDate)
					.on("update.countdown", function (event) {
						var format = "%W tuần %-d ngày %-H : %M : %S";
						let week = parseInt(event.strftime("%W"));
						if (week < 1) format = "%-d ngày %-H : %M : %S";
						$(this).html(event.strftime(format));
					})
					.on("finish.countdown", function (event) {
						$(this).html("Deal đã hết hạn!");
					});
			});
		}
	}

	/********End Countdown ********/

	/********Reward points ********/
	initPointSlider();
	var sliding = false;

	function initPointSlider() {
		if (!$("body").hasClass("checkout-page")) {
			return false;
		}

		var pointMax = Number(
			$(".point-slider-wrap").find(".point-max").text()
		);
		/*
		$(".point-slider").slider({
			max: pointMax,
			range: "min",
			min: 0,
			step: 1,
			slide: function slide(event, ui) {
				sliding = true;
				$("#usedPoints").text(ui.value);
				$("input[name='RedeemedRewardPoints']").val(ui.value);
				setTimeout(function () {
					callOrdercalculator();
				}, 500);
			},
			stop: function (event, ui) {
				setTimeout(function () {
					sliding = false;
					callOrdercalculator();
				}, 200);
			},
		});
		$("input[name='RedeemedRewardPoints']").on("keyup", function () {
			var val = $(this).val();

			if (!isNaN(val) && val <= pointMax) {
				$(".point-slider").slider("value", val);
				$("#usedPoints").text(val);
				AjaxCheckout.ordercalculator();
			}
		});
		*/
		var startVal = 0;
		var pointSlider = document.getElementById("user-points-slider");
		if (pointSlider != null) {
			noUiSlider.create(pointSlider, {
				start: [0],
				tooltips: [true],
				//direction: 'ltr',
				format: wNumb({
					decimals: 0,
					thousand: ".",
				}),
				//connect: true,
				range: {
					min: 0,
					max: pointMax,
				},
			});
			$("#user-points-slider")[0].noUiSlider.on(
				"change",
				function (v, handle) {
					$("#usedPoints").text(v[0]);
					$("input[name='RedeemedRewardPoints']").val(v[0]);
					setTimeout(function () {
						callOrdercalculator();
					}, 500);
				}
			);

			$("input[name='RedeemedRewardPoints']").on("change", function () {
				var val = $(this).val();
				//console.log("point input: " + val);
				if (!isNaN(val) && val <= pointMax) {
					pointSlider.noUiSlider.set(val);
					$("#usedPoints").text(val);
					AjaxCheckout.ordercalculator();
				}
			});
		}
	}

	function callOrdercalculator() {
		if (!sliding) AjaxCheckout.ordercalculator();
	}
	/********End Reward points ********/

	/****************/
	/* Ajax process */
	/****************/
	$("body").on("change", ".ajaxsort", function () {
		ProcessAjax($(this).val());
	});
	$("body").on("click", ".ajaxsortlink", function (e) {
		e.preventDefault();
		ProcessAjax($(this).attr("href"));
		return false;
	});
	$("body").on("click", "a.ajaxlink", function (e) {
		e.preventDefault();
		ProcessAjax($(this).attr("href"));
		return false;
	});

	function ProcessAjax(pageurl) {
		//to get the ajax content and display in div with id 'content'
		$.ajax({
			url: pageurl,
			data: {
				isajax: true,
			},
			success: function (data) {
				console.log(data)
				$(".ajaxresponsewrap").html($(data).find(".ajaxresponsewrap").html());
				// ajaxfilter
				$(".ajaxfilterresponse").html(
					$(data).find(".ajaxfilterresponse").html()
				);
				$(".ajaxbrandresponse").html(
					$(data).find(".ajaxbrandresponse").html()
				);
			},
		});

		//to change the browser URL to 'pageurl'
		if (pageurl != window.location) {
			window.history.pushState({ path: pageurl }, "", pageurl);
		}
	}

	$("body").on("click", "a.ajaxpagerlink", function (e) {
		e.preventDefault();
		/*
		if uncomment the above line, html5 nonsupported browers won't change the url but will display the ajax content;
		if commented, html5 nonsupported browers will reload the page to the specified link.
		*/

		//get the link location that was clicked
		obj = $(this);
		pageurl = $(this).attr("href");

		//to get the ajax content and display in div with id 'content'
		$.ajax({
			url: pageurl,
			data: {
				isajax: true,
			},
			success: function (data) {
				$(".ajaxresponse .ajaxresponsewrap").append(
					$(data).find(".ajaxresponsewrap").html()
				);
				obj.remove();
			},
		});

		//to change the browser URL to 'pageurl'
		if (pageurl != window.location) {
			window.history.pushState(
				{
					path: pageurl,
				},
				"",
				pageurl
			);
		}

		//window.scrollTo(0, 0);

		return false;
	});

	/* the below code is to override back button to get the ajax content without reload*/
	$(window).bind("popstate", function () {
		$.ajax({
			url: location.pathname,
			data: {
				isajax: true,
			},
			success: function (data) {
				$(".ajaxresponse").html($(data).find(".ajaxresponse").html());
				$(".ajaxfilterresponse").html(
					$(data).find(".ajaxfilterresponse").html()
				);
				$(".ajaxbrandresponse").html(
					$(data).find(".ajaxbrandresponse").html()
				);
			},
		});
	});

	/*************************************************************************************************************/
	/* END FILTER
	/*************************************************************************************************************/

	if ($('input[name="ShippingMethod"]').length) {
		$('input[name="ShippingMethod"]').trigger("change");
	}
});

/*************************************************************************************************************/
/* BEGIN CART
/*************************************************************************************************************/

var AjaxCart = {
	loadWaiting: false,
	usepopupnotifications: false,
	effecttocart: true,
	topcartselector: ".cart .cart-flyout-quantity",
	topwishlistselector: "",
	flyoutcartselector: ".shopping-card-toggle",
	cartpopup: ".shopping-cart-wrapper",
	popupbody: ".popup-body",
	popupfooter: ".popup-footer",

	init: function (
		usepopupnotifications,
		topcartselector,
		topwishlistselector,
		flyoutcartselector
	) {
		this.loadWaiting = false;
		this.usepopupnotifications = usepopupnotifications;
		this.topcartselector = topcartselector;
		this.topwishlistselector = topwishlistselector;
		this.flyoutcartselector = flyoutcartselector;
	},

	setLoadWaiting: function (display) {
		displayAjaxLoading(display);
		this.loadWaiting = display;
	},

	calculateSquare: function (button) {
		let unit = $("input[type=radio][name=kichthuoc]:checked").val();
		let square = $("input[type=text][name=square]").val();
		let quantityPerUnit = $("#quantityPerUnit").text();
		if (unit == undefined || unit == 0) {
			alert("Vui lòng chọn kích thước!");
		} else if (square == undefined || square < 0) {
			alert("Vui lòng nhập diện tích!");
		} else {
			let quantity = Math.ceil(
				(square * 1000000) / (unit * quantityPerUnit)
			);
			$("input[type=text][name=soluong]").val(quantity);
		}
	},

	//add a product to the cart/wishlist from the catalog pages
	addproducttocart_catalog: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		if (this.effecttocart == true && this.topcartselector) {
			var img = $(button).parent().parent().find(".product-img img");
			flyToCart($(img), this.topcartselector);
		}

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "AddProductToCart_Catalog",
			productid: $(button).attr("data-productid"),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: this.success_desktop,
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},
	//add a product to the wishlist from the product details page
	addproducttowishlist: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "AddProductToWishlist",
			productid: $(button).attr("data-productid"),
		};
		//var data = $('#aspnetForm').serializeArray();
		//data.push({ name: 'method', value: 'AddProductToWishlist' });
		//data.push({ name: 'productid', value: $(button).attr('data-productid') });
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success) {
					$(button).find("em").attr("class", "ri-heart-fill");
					alert("Đã thêm sản phẩm vào danh sách yêu thích");
					location.reload();
				} else {
					$(button).find("em").attr("class", "ri-heart-line");
				}
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	addproducttocart_quick: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({
			name: "method",
			value: "AddProductToCart_Details",
		});
		data.push({
			name: "productid",
			value: $(button).attr("data-productid"),
		});
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				let carturl = $(
					".shopping-cart-wrapper .btn-center .btn-primary"
				).attr("href");
				AjaxCart.success_desktop(response);
				location.href = carturl;
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//add a product to the cart/wishlist from the product details page (desktop version)
	addproducttocart_details: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		// if (this.effecttocart == true && this.topcartselector) {
		// 	var img = $(button)
		// 		.parent()
		// 		.parent()
		// 		.parent()
		// 		.find(".img-main-product")
		// 		.find(".swiper-slide-active img");
		// 	flyToCart($(img), this.topcartselector);
		// }

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({
			name: "method",
			value: "AddProductToCart_Details",
		});
		data.push({
			name: "productid",
			value: $(button).attr("data-productid"),
		});
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: this.success_desktop,
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//add a product to the cart/wishlist from the product details page (mobile devices version)
	addproducttocart_details_mobile: function (successredirecturl) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({
			name: "method",
			value: "AddProductToCart_Details_Mobile",
		});
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				//if (response.updatetopcartsectionhtml) {
				//    $(AjaxCart.topcartselector).html(response.updatetopcartsectionhtml);
				//}
				// if (response.updatetopwishlistsectionhtml) {
				// 	$(AjaxCart.topwishlistselector).html(
				// 		response.updatetopwishlistsectionhtml
				// 	);
				// }
				if (response.message) {
					//display notification
					if (response.success == true) {
						//we do not display success message in mobile devices mode
						//just redirect a user to the cart/wishlist
						location.href = successredirecturl;
					} else {
						//error
						displayStandardAlertNotification(response.message);
					}
					return false;
				}
				if (response.redirect) {
					location.href = response.redirect;
					return true;
				}
				return false;
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	addproducttocart_popup: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		if (this.effecttocart == true && this.topcartselector) {
			var img = $(button)
				.parent()
				.parent()
				.find(".popup-body")
				.find(".popup-product-image");
			flyToCart($(img), this.topcartselector);
		}

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({
			name: "method",
			value: "AddProductToCart_Details",
		});
		let productId = $(button).attr("data-productid");
		data.push({
			name: "productid",
			value: productId,
		});
		data.push({
			name: $(
				"input[name='addtocart_" + productId + ".EnteredQuantity']"
			).attr("name"),
			value: $(
				"input[name='addtocart_" + productId + ".EnteredQuantity']"
			).val(),
		});
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				$.fancybox.close();
				setTimeout(function () {
					AjaxCart.success_desktop(response);
				}, 1000);
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//update cart
	updatecart: function (input) {
		if ($(input).val() < 1) {
			if (!confirm("Bạn muốn xóa sản phẩm này?")) {
				$(input).val(1);
				return;
			}
		}
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({
			name: "method",
			value: "UpdateCart",
		});
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: this.success_desktop,
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//remove from cart
	removefromcart: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		if (!confirm("Bạn muốn xóa sản phẩm này?")) return;
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "RemoveFromCart",
			itemguid: $(button).data("itemguid"),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			//success: this.success_desktop,
			success: function () {
				location.reload();
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//remove from cart
	removefromwishlist: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "RemoveFromWishlist",
			itemguid: $(button).data("itemguid"),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function () {
				location.reload();
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//cart to wishlist
	carttowishlist: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "CartToWishlist",
			itemguid: $(button).data("itemguid"),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function () {
				location.reload();
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	// wishlist to cart
	wishlisttocart: function (button) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "WishlistToCart",
			itemguid: $(button).data("itemguid"),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function () {
				location.reload();
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//apply coupon
	applycoupon: function () {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "ApplyCoupon",
			couponcode: $("#couponCode").val(),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success == false)
					$(".coupon-apply-error").text(response.message);
				else location.reload();
				//setLocation(response.redirect);
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	//remove coupon
	removecoupon: function () {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = {
			method: "RemoveCoupon",
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				location.reload();
				//setLocation(response.redirect);
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	success_desktop: function (response) {
		if (response.updatetopcartsectionhtml) {
			$(AjaxCart.topcartselector).html(response.updatetopcartsectionhtml);
		}
		if (response.updatetopwishlistsectionhtml) {
			$(AjaxCart.topwishlistselector).html(
				response.updatetopwishlistsectionhtml
			);
		}
		if (response.updateflyoutcartsectionhtml) {
			var checkoutUrl = $(".checkout-url").data("checkouturl");
			console.log(checkoutUrl);
			console.log(response.updateflyoutcartsectionhtml);
			$(AjaxCart.flyoutcartselector).replaceWith(
				response.updateflyoutcartsectionhtml
			);
			// $(AjaxCart.flyoutcartselector).html(
			// 	$(response.updateflyoutcartsectionhtml)
			// 		.filter(AjaxCart.flyoutcartselector)
			// 		.html()
			// );
			$(AjaxCart.cartpopup).addClass("active");
			// $(AjaxCart.flyoutcartselector).css("display", "block");
			if (checkoutUrl != null)
				$(AjaxCart.flyoutcartselector)
					.find(".btn-checkout")
					.attr("href", checkoutUrl);
		}
		if (response.popupbuynowhtml) {
			$(AjaxCart.popupbody).html(
				$(response.popupbuynowhtml).find(AjaxCart.popupbody).html()
			);
			$(AjaxCart.popupfooter).html(
				$(response.popupbuynowhtml).find(AjaxCart.popupfooter).html()
			);
		}
		if (response.message) {
			//display notification
			if (response.success == true) {
				//success
				if (AjaxCart.usepopupnotifications == true) {
					displayPopupNotification(response.message, "success", true);
				} else {
					//specify timeout for success messages
					displayBarNotification(response.message, "success", 3500);
				}
			} else {
				//error
				if (AjaxCart.usepopupnotifications == true) {
					displayPopupNotification(response.message, "error", true);
				} else {
					//no timeout for errors
					displayBarNotification(response.message, "error", 0);
				}
			}
			return false;
		}
		if (response.redirect) {
			setLocation(response.redirect);
			return true;
		}
		return false;
	},

	buynowpopup: function (button) {
		var urladd = siteRoot + "/Product/Services/CartService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({
			name: "method",
			value: "BuyNowPopup",
		});
		data.push({
			name: "productid",
			value: $(button).attr("data-productid"),
		});
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: this.success_desktop,
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	productcalculator: function (button) {
		var url = siteRoot + "/Product/Services/CartService.aspx";
		var data = [];
		data.push({
			name: "method",
			value: "ProductCalculator",
		});
		data.push({
			name: "area",
			value: $(".input-area").val(),
		});
		data.push({
			name: "productid",
			value: $(".add-to-cart").attr("data-productid"),
		});
		$.ajax({
			cache: false,
			url: url,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success == true) {
					if (response.result) {
						$(".calc-res").val(response.result);
					}
				}
			},
			error: this.ajaxFailure,
		});
	},

	selectproductoption: function (button) {
		var url = siteRoot + "/Product/Services/CartService.aspx";
		var data = [];
		data.push({
			name: "method",
			value: "SelectProductOption",
		});
		data.push({
			name: "productid",
			value: $("#hdProductId").val(),
		});
		data.push({
			name: "optionid",
			value: $(button).attr("data-id"),
		});
		$.each(
			$(button).parents(".options-wrap").find(".product-options"),
			function () {
				var input = $(this).find('input[type="hidden"]');
				if (input)
					data.push({
						name: input.attr("name"),
						value: input.attr("value"),
					});
			}
		);
		$.ajax({
			cache: false,
			url: url,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success == true) {
					if (response.productName) {
						//$('.product-name').text(response.productName);
						let pName = response.productName;
						if (response.editLink) {
							//$(".edit-link").attr("href", response.editLink);
							pName +=
								"<a title='Sửa' class='edit-link' href='" +
								response.editLink +
								"'> <i class='fa fa-pencil'></i></a>";
						}
						$(".product-name").html(pName);
					}
					if (response.price)
						$(".product-price").text(response.price);
					if (response.oldPrice)
						$(".product-oldprice").text(response.oldPrice);
					if (response.briefContent)
						$(".product-briefContent").html(response.briefContent);
					else if (response.oldPrice == null)
						$(".product-oldprice").text("");
					if (response.productUrl) {
						if (typeof history.replaceState != "undefined") {
							var url = response.productUrl;
							var obj = {
								Title: "",
								Url: url,
							};
							history.replaceState(obj, obj.Title, obj.Url);
						}
					}
					if (response.productId) {
						$(".add-to-cart").attr(
							"data-productid",
							response.productId
						);
						$(".buy-now").attr(
							"data-productid",
							response.productId
						);
						$(".product-details-quantity").attr(
							"name",
							"addtocart_" +
								response.productId +
								".EnteredQuantity"
						);
					}
					if (response.productCode)
						$(".product-sku .sku").text(
							"SKU: " + response.productCode
						);
					if (response.fullContent)
						$(".product-fullcontent").text(response.fullContent);
					if (response.productSubtitle)
						$(".product-dvt").text(
							"ĐVT: " + response.productSubtitle
						);
					if (response.selectedOptionIds) {
						var optionNames = "";
						var optionGroupCount = $(
							".product-info .product-options"
						).length;
						$(".product-options").each(function (index) {
							var opt = $(this);
							$(this).find(".product-option-input").val("");
							$(this)
								.find(".product-option")
								.removeClass("active");
							$(this)
								.find(".product-option")
								.removeClass("disable");
							$(this)
								.find(".product-option")
								.each(function (index2) {
									var option = $(this);
									var optionId = parseInt(
										option.attr("data-id")
									);
									if (
										$.inArray(
											optionId,
											response.selectedOptionIds
										) > -1
									) {
										opt.find(".product-option-input").val(
											optionId
										);
										option.addClass("active");

										if (
											option.parents(".product-intro")
												.length
										)
											optionNames +=
												option.attr("data-name") + ", ";
									}
									if (
										optionGroupCount > 1 &&
										$.inArray(
											optionId,
											response.optionIds
										) == -1
									) {
										option.addClass("disable");
									}
								});
						});
					}
					if (response.childProductDetail) {
						if (
							$(response.childProductDetail).find(
								".wrap-img-product"
							) != undefined
						)
							$(".wrap-img-product").replaceWith(
								$(response.childProductDetail).find(
									".wrap-img-product"
								)
							);
					}
					/*
					if (response.productCode)
						$(".product-code").text(response.productCode);

					if (response.selectedOptionIds) {
						var optionNames = "";
						var optionGroupCount = $(
							".product-info .product-options"
						).length;
						$(".product-options").each(function (index) {
							var opt = $(this);
							$(this).find(".product-option-input").val("");
							$(this)
								.find(".product-option")
								.removeClass("active");
							$(this)
								.find(".product-option")
								.removeClass("disable");
							$(this)
								.find(".product-option")
								.each(function (index2) {
									var option = $(this);
									var optionId = parseInt(
										option.attr("data-id")
									);
									if (
										$.inArray(
											optionId,
											response.selectedOptionIds
										) > -1
									) {
										opt.find(".product-option-input").val(
											optionId
										);
										option.addClass("active");

										if (
											option.parents(".product-intro")
												.length
										)
											optionNames +=
												option.attr("data-name") + ", ";
									}
									if (
										optionGroupCount > 1 &&
										$.inArray(
											optionId,
											response.optionIds
										) == -1
									) {
										option.addClass("disable");
									}
								});
						});
						$(".product-selected-options .option-names").html(
							optionNames
						);
					}
					*/
				} else if (response.message) {
					alert(response.message);
				}
			},
			error: this.ajaxFailure,
		});
	},

	selectproductoption_popup: function (button) {
		var url = siteRoot + "/Product/Services/CartService.aspx";
		var data = [];
		data.push({
			name: "method",
			value: "SelectProductOption_Popup",
		});
		data.push({
			name: "productid",
			value: $("#hdProductId").val(),
		});
		data.push({
			name: "optionid",
			value: $(button).attr("data-id"),
		});
		$.each(
			$(button).parents(".product-attributes").find(".product-options"),
			function () {
				var input = $(this).find('input[type="hidden"]');
				if (input)
					data.push({
						name: input.attr("name"),
						value: input.attr("value"),
					});
			}
		);
		$.ajax({
			cache: false,
			url: url,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success == true) {
					if (response.productId) {
						$(".btn-booling").attr(
							"data-productid",
							response.productId
						);
						$(".popup-input-number").attr(
							"name",
							"addtocart_" +
								response.productId +
								".EnteredQuantity"
						);
					}
					if (response.productName)
						$(".popup-product-name").text(response.productName);
					if (response.productUrl)
						$(".popup-product-name").attr(
							"href",
							response.productUrl
						);
					if (response.price)
						$(".popup-product-price").text(response.price);
					if (response.oldPrice)
						$(".popup-product-oldprice").text(response.oldPrice);
					else if (response.oldPrice == null)
						$(".product-oldprice").text("");
					if (response.discountPercentage) {
						$(".popup-discount").show();
						$(".popup-discount span").html(
							"-" + response.discountPercentage + "%"
						);
					} else $(".popup-discount").hide();
					console.log(response.productImage);
					if (response.productImage)
						$(".popup-product-image").attr(
							"src",
							response.productImage
						);

					if (response.selectedOptionIds) {
						var optionNames = "";
						var optionGroupCount = $(
							".product-info .product-options"
						).length;
						$(".product-options").each(function (index) {
							var opt = $(this);
							$(this).find(".product-option-input").val("");
							$(this)
								.find(".product-option")
								.removeClass("active");
							$(this)
								.find(".product-option")
								.removeClass("disable");
							$(this)
								.find(".product-option")
								.each(function (index2) {
									var option = $(this);
									var optionId = parseInt(
										option.attr("data-id")
									);
									if (
										$.inArray(
											optionId,
											response.selectedOptionIds
										) > -1
									) {
										opt.find(".product-option-input").val(
											optionId
										);
										option.parent().addClass("active");

										if (
											option.parents(".product-intro")
												.length
										)
											optionNames +=
												option.attr("data-name") + ", ";
									}
									if (
										optionGroupCount > 1 &&
										$.inArray(
											optionId,
											response.optionIds
										) == -1
									) {
										option.addClass("disable");
									}
								});
						});
						$(".product-selected-options .option-names").html(
							optionNames
						);
					}
				} else if (response.message) {
					alert(response.message);
				}
			},
			error: this.ajaxFailure,
		});
	},

	resetLoadWaiting: function () {
		AjaxCart.setLoadWaiting(false);
	},

	ajaxFailure: function () {
		alert(
			"Failed to add the product to the cart. Please refresh the page and try one more time."
		);
	},
};

function OpenWindow(n, t, i, r) {
	var u = (screen.width - t) / 2,
		f = (screen.height - i) / 2,
		e;
	winprops =
		"resizable=0, height=" +
		i +
		",width=" +
		t +
		",top=" +
		f +
		",left=" +
		u +
		"w";
	r && (winprops += ",scrollbars=1");
	e = window.open(n, "_blank", winprops);
}

function setLocation(n) {
	window.location.href = n;
}

function displayAjaxLoading(n) {
	n
		? $(".ajax-loading-block-window").show()
		: $(".ajax-loading-block-window").hide("slow");
}

function displayPopupNotification(n, t, i) {
	var f, r, u, e;
	if (
		((f =
			t == "success"
				? $("#dialog-notifications-success")
				: t == "error"
				? $("#dialog-notifications-error")
				: $("#dialog-notifications-success")),
		(r = ""),
		typeof n == "string")
	)
		r = "<p>" + n + "</p>";
	else for (u = 0; u < n.length; u++) r = r + "<p>" + n[u] + "</p>";
	f.html(r);
	e = i ? !0 : !1;
	f.dialog({
		modal: e,
	});
}

function closePopupNotification() {
	$(".ui-dialog-titlebar-close").trigger("click");
	return false;
}

function displayBarNotification(n, t, i) {
	var u, r, f;
	if (
		(clearTimeout(barNotificationTimeout),
		(u = "success"),
		t == "success" ? (u = "success") : t == "error" && (u = "error"),
		$("#bar-notification").removeClass("success").removeClass("error"),
		$("#bar-notification .content").remove(),
		(r = ""),
		typeof n == "string")
	)
		r = '<p class="content">' + n + "</p>";
	else
		for (f = 0; f < n.length; f++)
			r = r + '<p class="content">' + n[f] + "</p>";
	$("#bar-notification")
		.append(r)
		.addClass(u)
		.fadeIn("slow")
		.mouseenter(function () {
			clearTimeout(barNotificationTimeout);
		});
	$("#bar-notification .close")
		.unbind("click")
		.click(function () {
			$("#bar-notification").fadeOut("slow");
		});
	i > 0 &&
		(barNotificationTimeout = setTimeout(function () {
			$("#bar-notification").fadeOut("slow");
		}, i));
}

// fly to basket
function flyToCart(flyer, flyingTo, callBack) {
	try {
		var $jqfunc = $(this);
		var divider = 3;
		var flyerClone = $(flyer).clone();
		$(flyerClone).css({
			position: "absolute",
			top: $(flyer).offset().top + "px",
			left: $(flyer).offset().left + "px",
			opacity: 1,
			"z-index": 1000,
		});
		$("body").append($(flyerClone));
		if ($(flyingTo)) {
			var gotoX =
				$(flyingTo).offset().left +
				$(flyingTo).width() / 2 -
				$(flyer).width() / divider / 2;
			var gotoY =
				$(flyingTo).offset().top +
				$(flyingTo).height() / 2 -
				$(flyer).height() / divider / 2;
			$(flyerClone).animate(
				{
					opacity: 0.7,
					left: gotoX,
					top: gotoY,
					width: 135,
					height: 135,
				},
				200,
				function () {
					$(flyingTo).fadeOut("100", function () {
						$(flyingTo).fadeIn("100", function () {
							$(flyerClone).fadeOut("100", function () {
								$(flyerClone).remove();
								if (callBack != null) {
									callBack.apply($jqfunc);
								}
							});
						});
					});
				}
			);
		}
	} catch (exception) {}
}

function htmlEncode(n) {
	return $("<div/>").text(n).html();
}

function htmlDecode(n) {
	return $("<div/>").html(n).text();
}
var barNotificationTimeout, AjaxCart;

/*************************************************************************************************************/
/* END CART
/*************************************************************************************************************/

/*************************************************************************************************************/
/* BEGIN CHECKOUT
/*************************************************************************************************************/
/*! jQuery Validation Plugin - v1.14.0 - 6/30/2015
 * http://jqueryvalidation.org/
 * Copyright (c) 2015 Jörn Zaefferer; Licensed MIT */
!(function (a) {
	"function" == typeof define && define.amd
		? define(["jquery"], a)
		: a(jQuery);
})(function (a) {
	a.extend(a.fn, {
		validate: function (b) {
			if (!this.length)
				return void (
					b &&
					b.debug &&
					window.console &&
					console.warn(
						"Nothing selected, can't validate, returning nothing."
					)
				);
			var c = a.data(this[0], "validator");
			return c
				? c
				: (this.attr("novalidate", "novalidate"),
				  (c = new a.validator(b, this[0])),
				  a.data(this[0], "validator", c),
				  c.settings.onsubmit &&
						(this.on("click.validate", ":submit", function (b) {
							c.settings.submitHandler &&
								(c.submitButton = b.target),
								a(this).hasClass("cancel") &&
									(c.cancelSubmit = !0),
								void 0 !== a(this).attr("formnovalidate") &&
									(c.cancelSubmit = !0);
						}),
						this.on("submit.validate", function (b) {
							function d() {
								var d, e;
								return c.settings.submitHandler
									? (c.submitButton &&
											(d = a("<input type='hidden'/>")
												.attr(
													"name",
													c.submitButton.name
												)
												.val(a(c.submitButton).val())
												.appendTo(c.currentForm)),
									  (e = c.settings.submitHandler.call(
											c,
											c.currentForm,
											b
									  )),
									  c.submitButton && d.remove(),
									  void 0 !== e ? e : !1)
									: !0;
							}
							return (
								c.settings.debug && b.preventDefault(),
								c.cancelSubmit
									? ((c.cancelSubmit = !1), d())
									: c.form()
									? c.pendingRequest
										? ((c.formSubmitted = !0), !1)
										: d()
									: (c.focusInvalid(), !1)
							);
						})),
				  c);
		},
		valid: function () {
			var b, c, d;
			return (
				a(this[0]).is("form")
					? (b = this.validate().form())
					: ((d = []),
					  (b = !0),
					  (c = a(this[0].form).validate()),
					  this.each(function () {
							(b = c.element(this) && b),
								(d = d.concat(c.errorList));
					  }),
					  (c.errorList = d)),
				b
			);
		},
		rules: function (b, c) {
			var d,
				e,
				f,
				g,
				h,
				i,
				j = this[0];
			if (b)
				switch (
					((d = a.data(j.form, "validator").settings),
					(e = d.rules),
					(f = a.validator.staticRules(j)),
					b)
				) {
					case "add":
						a.extend(f, a.validator.normalizeRule(c)),
							delete f.messages,
							(e[j.name] = f),
							c.messages &&
								(d.messages[j.name] = a.extend(
									d.messages[j.name],
									c.messages
								));
						break;
					case "remove":
						return c
							? ((i = {}),
							  a.each(c.split(/\s/), function (b, c) {
									(i[c] = f[c]),
										delete f[c],
										"required" === c &&
											a(j).removeAttr("aria-required");
							  }),
							  i)
							: (delete e[j.name], f);
				}
			return (
				(g = a.validator.normalizeRules(
					a.extend(
						{},
						a.validator.classRules(j),
						a.validator.attributeRules(j),
						a.validator.dataRules(j),
						a.validator.staticRules(j)
					),
					j
				)),
				g.required &&
					((h = g.required),
					delete g.required,
					(g = a.extend(
						{
							required: h,
						},
						g
					)),
					a(j).attr("aria-required", "true")),
				g.remote &&
					((h = g.remote),
					delete g.remote,
					(g = a.extend(g, {
						remote: h,
					}))),
				g
			);
		},
	}),
		a.extend(a.expr[":"], {
			blank: function (b) {
				return !a.trim("" + a(b).val());
			},
			filled: function (b) {
				return !!a.trim("" + a(b).val());
			},
			unchecked: function (b) {
				return !a(b).prop("checked");
			},
		}),
		(a.validator = function (b, c) {
			(this.settings = a.extend(!0, {}, a.validator.defaults, b)),
				(this.currentForm = c),
				this.init();
		}),
		(a.validator.format = function (b, c) {
			return 1 === arguments.length
				? function () {
						var c = a.makeArray(arguments);
						return c.unshift(b), a.validator.format.apply(this, c);
				  }
				: (arguments.length > 2 &&
						c.constructor !== Array &&
						(c = a.makeArray(arguments).slice(1)),
				  c.constructor !== Array && (c = [c]),
				  a.each(c, function (a, c) {
						b = b.replace(
							new RegExp("\\{" + a + "\\}", "g"),
							function () {
								return c;
							}
						);
				  }),
				  b);
		}),
		a.extend(a.validator, {
			defaults: {
				messages: {},
				groups: {},
				rules: {},
				errorClass: "error",
				validClass: "valid",
				errorElement: "label",
				focusCleanup: !1,
				focusInvalid: !0,
				errorContainer: a([]),
				errorLabelContainer: a([]),
				onsubmit: !0,
				ignore: ":hidden",
				ignoreTitle: !1,
				onfocusin: function (a) {
					(this.lastActive = a),
						this.settings.focusCleanup &&
							(this.settings.unhighlight &&
								this.settings.unhighlight.call(
									this,
									a,
									this.settings.errorClass,
									this.settings.validClass
								),
							this.hideThese(this.errorsFor(a)));
				},
				onfocusout: function (a) {
					this.checkable(a) ||
						(!(a.name in this.submitted) && this.optional(a)) ||
						this.element(a);
				},
				onkeyup: function (b, c) {
					var d = [
						16, 17, 18, 20, 35, 36, 37, 38, 39, 40, 45, 144, 225,
					];
					(9 === c.which && "" === this.elementValue(b)) ||
						-1 !== a.inArray(c.keyCode, d) ||
						((b.name in this.submitted || b === this.lastElement) &&
							this.element(b));
				},
				onclick: function (a) {
					a.name in this.submitted
						? this.element(a)
						: a.parentNode.name in this.submitted &&
						  this.element(a.parentNode);
				},
				highlight: function (b, c, d) {
					"radio" === b.type
						? this.findByName(b.name).addClass(c).removeClass(d)
						: a(b).addClass(c).removeClass(d);
				},
				unhighlight: function (b, c, d) {
					"radio" === b.type
						? this.findByName(b.name).removeClass(c).addClass(d)
						: a(b).removeClass(c).addClass(d);
				},
			},
			setDefaults: function (b) {
				a.extend(a.validator.defaults, b);
			},
			messages: {
				required: "This field is required.",
				remote: "Please fix this field.",
				email: "Please enter a valid email address.",
				url: "Please enter a valid URL.",
				date: "Please enter a valid date.",
				dateISO: "Please enter a valid date ( ISO ).",
				number: "Please enter a valid number.",
				digits: "Please enter only digits.",
				creditcard: "Please enter a valid credit card number.",
				equalTo: "Please enter the same value again.",
				maxlength: a.validator.format(
					"Please enter no more than {0} characters."
				),
				minlength: a.validator.format(
					"Please enter at least {0} characters."
				),
				rangelength: a.validator.format(
					"Please enter a value between {0} and {1} characters long."
				),
				range: a.validator.format(
					"Please enter a value between {0} and {1}."
				),
				max: a.validator.format(
					"Please enter a value less than or equal to {0}."
				),
				min: a.validator.format(
					"Please enter a value greater than or equal to {0}."
				),
			},
			autoCreateRanges: !1,
			prototype: {
				init: function () {
					function b(b) {
						var c = a.data(this.form, "validator"),
							d = "on" + b.type.replace(/^validate/, ""),
							e = c.settings;
						e[d] && !a(this).is(e.ignore) && e[d].call(c, this, b);
					}
					(this.labelContainer = a(
						this.settings.errorLabelContainer
					)),
						(this.errorContext =
							(this.labelContainer.length &&
								this.labelContainer) ||
							a(this.currentForm)),
						(this.containers = a(this.settings.errorContainer).add(
							this.settings.errorLabelContainer
						)),
						(this.submitted = {}),
						(this.valueCache = {}),
						(this.pendingRequest = 0),
						(this.pending = {}),
						(this.invalid = {}),
						this.reset();
					var c,
						d = (this.groups = {});
					a.each(this.settings.groups, function (b, c) {
						"string" == typeof c && (c = c.split(/\s/)),
							a.each(c, function (a, c) {
								d[c] = b;
							});
					}),
						(c = this.settings.rules),
						a.each(c, function (b, d) {
							c[b] = a.validator.normalizeRule(d);
						}),
						a(this.currentForm)
							.on(
								"focusin.validate focusout.validate keyup.validate",
								":text, [type='password'], [type='file'], select, textarea, [type='number'], [type='search'], [type='tel'], [type='url'], [type='email'], [type='datetime'], [type='date'], [type='month'], [type='week'], [type='time'], [type='datetime-local'], [type='range'], [type='color'], [type='radio'], [type='checkbox']",
								b
							)
							.on(
								"click.validate",
								"select, option, [type='radio'], [type='checkbox']",
								b
							),
						this.settings.invalidHandler &&
							a(this.currentForm).on(
								"invalid-form.validate",
								this.settings.invalidHandler
							),
						a(this.currentForm)
							.find("[required], [data-rule-required], .required")
							.attr("aria-required", "true");
				},
				form: function () {
					return (
						this.checkForm(),
						a.extend(this.submitted, this.errorMap),
						(this.invalid = a.extend({}, this.errorMap)),
						this.valid() ||
							a(this.currentForm).triggerHandler("invalid-form", [
								this,
							]),
						this.showErrors(),
						this.valid()
					);
				},
				checkForm: function () {
					this.prepareForm();
					for (
						var a = 0, b = (this.currentElements = this.elements());
						b[a];
						a++
					)
						this.check(b[a]);
					return this.valid();
				},
				element: function (b) {
					var c = this.clean(b),
						d = this.validationTargetFor(c),
						e = !0;
					return (
						(this.lastElement = d),
						void 0 === d
							? delete this.invalid[c.name]
							: (this.prepareElement(d),
							  (this.currentElements = a(d)),
							  (e = this.check(d) !== !1),
							  e
									? delete this.invalid[d.name]
									: (this.invalid[d.name] = !0)),
						a(b).attr("aria-invalid", !e),
						this.numberOfInvalids() ||
							(this.toHide = this.toHide.add(this.containers)),
						this.showErrors(),
						e
					);
				},
				showErrors: function (b) {
					if (b) {
						a.extend(this.errorMap, b), (this.errorList = []);
						for (var c in b)
							this.errorList.push({
								message: b[c],
								element: this.findByName(c)[0],
							});
						this.successList = a.grep(
							this.successList,
							function (a) {
								return !(a.name in b);
							}
						);
					}
					this.settings.showErrors
						? this.settings.showErrors.call(
								this,
								this.errorMap,
								this.errorList
						  )
						: this.defaultShowErrors();
				},
				resetForm: function () {
					a.fn.resetForm && a(this.currentForm).resetForm(),
						(this.submitted = {}),
						(this.lastElement = null),
						this.prepareForm(),
						this.hideErrors();
					var b,
						c = this.elements()
							.removeData("previousValue")
							.removeAttr("aria-invalid");
					if (this.settings.unhighlight)
						for (b = 0; c[b]; b++)
							this.settings.unhighlight.call(
								this,
								c[b],
								this.settings.errorClass,
								""
							);
					else c.removeClass(this.settings.errorClass);
				},
				numberOfInvalids: function () {
					return this.objectLength(this.invalid);
				},
				objectLength: function (a) {
					var b,
						c = 0;
					for (b in a) c++;
					return c;
				},
				hideErrors: function () {
					this.hideThese(this.toHide);
				},
				hideThese: function (a) {
					a.not(this.containers).text(""), this.addWrapper(a).hide();
				},
				valid: function () {
					return 0 === this.size();
				},
				size: function () {
					return this.errorList.length;
				},
				focusInvalid: function () {
					if (this.settings.focusInvalid)
						try {
							a(
								this.findLastActive() ||
									(this.errorList.length &&
										this.errorList[0].element) ||
									[]
							)
								.filter(":visible")
								.focus()
								.trigger("focusin");
						} catch (b) {}
				},
				findLastActive: function () {
					var b = this.lastActive;
					return (
						b &&
						1 ===
							a.grep(this.errorList, function (a) {
								return a.element.name === b.name;
							}).length &&
						b
					);
				},
				elements: function () {
					var b = this,
						c = {};
					return a(this.currentForm)
						.find("input, select, textarea")
						.not(":submit, :reset, :image, :disabled")
						.not(this.settings.ignore)
						.filter(function () {
							return (
								!this.name &&
									b.settings.debug &&
									window.console &&
									console.error(
										"%o has no name assigned",
										this
									),
								this.name in c ||
								!b.objectLength(a(this).rules())
									? !1
									: ((c[this.name] = !0), !0)
							);
						});
				},
				clean: function (b) {
					return a(b)[0];
				},
				errors: function () {
					var b = this.settings.errorClass.split(" ").join(".");
					return a(
						this.settings.errorElement + "." + b,
						this.errorContext
					);
				},
				reset: function () {
					(this.successList = []),
						(this.errorList = []),
						(this.errorMap = {}),
						(this.toShow = a([])),
						(this.toHide = a([])),
						(this.currentElements = a([]));
				},
				prepareForm: function () {
					this.reset(),
						(this.toHide = this.errors().add(this.containers));
				},
				prepareElement: function (a) {
					this.reset(), (this.toHide = this.errorsFor(a));
				},
				elementValue: function (b) {
					var c,
						d = a(b),
						e = b.type;
					return "radio" === e || "checkbox" === e
						? this.findByName(b.name).filter(":checked").val()
						: "number" === e && "undefined" != typeof b.validity
						? b.validity.badInput
							? !1
							: d.val()
						: ((c = d.val()),
						  "string" == typeof c ? c.replace(/\r/g, "") : c);
				},
				check: function (b) {
					b = this.validationTargetFor(this.clean(b));
					var c,
						d,
						e,
						f = a(b).rules(),
						g = a.map(f, function (a, b) {
							return b;
						}).length,
						h = !1,
						i = this.elementValue(b);
					for (d in f) {
						e = {
							method: d,
							parameters: f[d],
						};
						try {
							if (
								((c = a.validator.methods[d].call(
									this,
									i,
									b,
									e.parameters
								)),
								"dependency-mismatch" === c && 1 === g)
							) {
								h = !0;
								continue;
							}
							if (((h = !1), "pending" === c))
								return void (this.toHide = this.toHide.not(
									this.errorsFor(b)
								));
							if (!c) return this.formatAndAdd(b, e), !1;
						} catch (j) {
							throw (
								(this.settings.debug &&
									window.console &&
									console.log(
										"Exception occurred when checking element " +
											b.id +
											", check the '" +
											e.method +
											"' method.",
										j
									),
								j instanceof TypeError &&
									(j.message +=
										".  Exception occurred when checking element " +
										b.id +
										", check the '" +
										e.method +
										"' method."),
								j)
							);
						}
					}
					if (!h)
						return (
							this.objectLength(f) && this.successList.push(b), !0
						);
				},
				customDataMessage: function (b, c) {
					return (
						a(b).data(
							"msg" +
								c.charAt(0).toUpperCase() +
								c.substring(1).toLowerCase()
						) || a(b).data("msg")
					);
				},
				customMessage: function (a, b) {
					var c = this.settings.messages[a];
					return c && (c.constructor === String ? c : c[b]);
				},
				findDefined: function () {
					for (var a = 0; a < arguments.length; a++)
						if (void 0 !== arguments[a]) return arguments[a];
					return void 0;
				},
				defaultMessage: function (b, c) {
					return this.findDefined(
						this.customMessage(b.name, c),
						this.customDataMessage(b, c),
						(!this.settings.ignoreTitle && b.title) || void 0,
						a.validator.messages[c],
						"<strong>Warning: No message defined for " +
							b.name +
							"</strong>"
					);
				},
				formatAndAdd: function (b, c) {
					var d = this.defaultMessage(b, c.method),
						e = /\$?\{(\d+)\}/g;
					"function" == typeof d
						? (d = d.call(this, c.parameters, b))
						: e.test(d) &&
						  (d = a.validator.format(
								d.replace(e, "{$1}"),
								c.parameters
						  )),
						this.errorList.push({
							message: d,
							element: b,
							method: c.method,
						}),
						(this.errorMap[b.name] = d),
						(this.submitted[b.name] = d);
				},
				addWrapper: function (a) {
					return (
						this.settings.wrapper &&
							(a = a.add(a.parent(this.settings.wrapper))),
						a
					);
				},
				defaultShowErrors: function () {
					var a, b, c;
					for (a = 0; this.errorList[a]; a++)
						(c = this.errorList[a]),
							this.settings.highlight &&
								this.settings.highlight.call(
									this,
									c.element,
									this.settings.errorClass,
									this.settings.validClass
								),
							this.showLabel(c.element, c.message);
					if (
						(this.errorList.length &&
							(this.toShow = this.toShow.add(this.containers)),
						this.settings.success)
					)
						for (a = 0; this.successList[a]; a++)
							this.showLabel(this.successList[a]);
					if (this.settings.unhighlight)
						for (a = 0, b = this.validElements(); b[a]; a++)
							this.settings.unhighlight.call(
								this,
								b[a],
								this.settings.errorClass,
								this.settings.validClass
							);
					(this.toHide = this.toHide.not(this.toShow)),
						this.hideErrors(),
						this.addWrapper(this.toShow).show();
				},
				validElements: function () {
					return this.currentElements.not(this.invalidElements());
				},
				invalidElements: function () {
					return a(this.errorList).map(function () {
						return this.element;
					});
				},
				showLabel: function (b, c) {
					var d,
						e,
						f,
						g = this.errorsFor(b),
						h = this.idOrName(b),
						i = a(b).attr("aria-describedby");
					g.length
						? (g
								.removeClass(this.settings.validClass)
								.addClass(this.settings.errorClass),
						  g.html(c))
						: ((g = a("<" + this.settings.errorElement + ">")
								.attr("id", h + "-error")
								.addClass(this.settings.errorClass)
								.html(c || "")),
						  (d = g),
						  this.settings.wrapper &&
								(d = g
									.hide()
									.show()
									.wrap("<" + this.settings.wrapper + "/>")
									.parent()),
						  this.labelContainer.length
								? this.labelContainer.append(d)
								: this.settings.errorPlacement
								? this.settings.errorPlacement(d, a(b))
								: d.insertAfter(b),
						  g.is("label")
								? g.attr("for", h)
								: 0 ===
										g.parents("label[for='" + h + "']")
											.length &&
								  ((f = g
										.attr("id")
										.replace(/(:|\.|\[|\]|\$)/g, "\\$1")),
								  i
										? i.match(
												new RegExp("\\b" + f + "\\b")
										  ) || (i += " " + f)
										: (i = f),
								  a(b).attr("aria-describedby", i),
								  (e = this.groups[b.name]),
								  e &&
										a.each(this.groups, function (b, c) {
											c === e &&
												a(
													"[name='" + b + "']",
													this.currentForm
												).attr(
													"aria-describedby",
													g.attr("id")
												);
										}))),
						!c &&
							this.settings.success &&
							(g.text(""),
							"string" == typeof this.settings.success
								? g.addClass(this.settings.success)
								: this.settings.success(g, b)),
						(this.toShow = this.toShow.add(g));
				},
				errorsFor: function (b) {
					var c = this.idOrName(b),
						d = a(b).attr("aria-describedby"),
						e = "label[for='" + c + "'], label[for='" + c + "'] *";
					return (
						d && (e = e + ", #" + d.replace(/\s+/g, ", #")),
						this.errors().filter(e)
					);
				},
				idOrName: function (a) {
					return (
						this.groups[a.name] ||
						(this.checkable(a) ? a.name : a.id || a.name)
					);
				},
				validationTargetFor: function (b) {
					return (
						this.checkable(b) && (b = this.findByName(b.name)),
						a(b).not(this.settings.ignore)[0]
					);
				},
				checkable: function (a) {
					return /radio|checkbox/i.test(a.type);
				},
				findByName: function (b) {
					return a(this.currentForm).find("[name='" + b + "']");
				},
				getLength: function (b, c) {
					switch (c.nodeName.toLowerCase()) {
						case "select":
							return a("option:selected", c).length;
						case "input":
							if (this.checkable(c))
								return this.findByName(c.name).filter(
									":checked"
								).length;
					}
					return b.length;
				},
				depend: function (a, b) {
					return this.dependTypes[typeof a]
						? this.dependTypes[typeof a](a, b)
						: !0;
				},
				dependTypes: {
					boolean: function (a) {
						return a;
					},
					string: function (b, c) {
						return !!a(b, c.form).length;
					},
					function: function (a, b) {
						return a(b);
					},
				},
				optional: function (b) {
					var c = this.elementValue(b);
					return (
						!a.validator.methods.required.call(this, c, b) &&
						"dependency-mismatch"
					);
				},
				startRequest: function (a) {
					this.pending[a.name] ||
						(this.pendingRequest++, (this.pending[a.name] = !0));
				},
				stopRequest: function (b, c) {
					this.pendingRequest--,
						this.pendingRequest < 0 && (this.pendingRequest = 0),
						delete this.pending[b.name],
						c &&
						0 === this.pendingRequest &&
						this.formSubmitted &&
						this.form()
							? (a(this.currentForm).submit(),
							  (this.formSubmitted = !1))
							: !c &&
							  0 === this.pendingRequest &&
							  this.formSubmitted &&
							  (a(this.currentForm).triggerHandler(
									"invalid-form",
									[this]
							  ),
							  (this.formSubmitted = !1));
				},
				previousValue: function (b) {
					return (
						a.data(b, "previousValue") ||
						a.data(b, "previousValue", {
							old: null,
							valid: !0,
							message: this.defaultMessage(b, "remote"),
						})
					);
				},
				destroy: function () {
					this.resetForm(),
						a(this.currentForm)
							.off(".validate")
							.removeData("validator");
				},
			},
			classRuleSettings: {
				required: {
					required: !0,
				},
				email: {
					email: !0,
				},
				url: {
					url: !0,
				},
				date: {
					date: !0,
				},
				dateISO: {
					dateISO: !0,
				},
				number: {
					number: !0,
				},
				digits: {
					digits: !0,
				},
				creditcard: {
					creditcard: !0,
				},
			},
			addClassRules: function (b, c) {
				b.constructor === String
					? (this.classRuleSettings[b] = c)
					: a.extend(this.classRuleSettings, b);
			},
			classRules: function (b) {
				var c = {},
					d = a(b).attr("class");
				return (
					d &&
						a.each(d.split(" "), function () {
							this in a.validator.classRuleSettings &&
								a.extend(
									c,
									a.validator.classRuleSettings[this]
								);
						}),
					c
				);
			},
			normalizeAttributeRule: function (a, b, c, d) {
				/min|max/.test(c) &&
					(null === b || /number|range|text/.test(b)) &&
					((d = Number(d)), isNaN(d) && (d = void 0)),
					d || 0 === d
						? (a[c] = d)
						: b === c && "range" !== b && (a[c] = !0);
			},
			attributeRules: function (b) {
				var c,
					d,
					e = {},
					f = a(b),
					g = b.getAttribute("type");
				for (c in a.validator.methods)
					"required" === c
						? ((d = b.getAttribute(c)),
						  "" === d && (d = !0),
						  (d = !!d))
						: (d = f.attr(c)),
						this.normalizeAttributeRule(e, g, c, d);
				return (
					e.maxlength &&
						/-1|2147483647|524288/.test(e.maxlength) &&
						delete e.maxlength,
					e
				);
			},
			dataRules: function (b) {
				var c,
					d,
					e = {},
					f = a(b),
					g = b.getAttribute("type");
				for (c in a.validator.methods)
					(d = f.data(
						"rule" +
							c.charAt(0).toUpperCase() +
							c.substring(1).toLowerCase()
					)),
						this.normalizeAttributeRule(e, g, c, d);
				return e;
			},
			staticRules: function (b) {
				var c = {},
					d = a.data(b.form, "validator");
				return (
					d.settings.rules &&
						(c =
							a.validator.normalizeRule(
								d.settings.rules[b.name]
							) || {}),
					c
				);
			},
			normalizeRules: function (b, c) {
				return (
					a.each(b, function (d, e) {
						if (e === !1) return void delete b[d];
						if (e.param || e.depends) {
							var f = !0;
							switch (typeof e.depends) {
								case "string":
									f = !!a(e.depends, c.form).length;
									break;
								case "function":
									f = e.depends.call(c, c);
							}
							f
								? (b[d] = void 0 !== e.param ? e.param : !0)
								: delete b[d];
						}
					}),
					a.each(b, function (d, e) {
						b[d] = a.isFunction(e) ? e(c) : e;
					}),
					a.each(["minlength", "maxlength"], function () {
						b[this] && (b[this] = Number(b[this]));
					}),
					a.each(["rangelength", "range"], function () {
						var c;
						b[this] &&
							(a.isArray(b[this])
								? (b[this] = [
										Number(b[this][0]),
										Number(b[this][1]),
								  ])
								: "string" == typeof b[this] &&
								  ((c = b[this]
										.replace(/[\[\]]/g, "")
										.split(/[\s,]+/)),
								  (b[this] = [Number(c[0]), Number(c[1])])));
					}),
					a.validator.autoCreateRanges &&
						(null != b.min &&
							null != b.max &&
							((b.range = [b.min, b.max]),
							delete b.min,
							delete b.max),
						null != b.minlength &&
							null != b.maxlength &&
							((b.rangelength = [b.minlength, b.maxlength]),
							delete b.minlength,
							delete b.maxlength)),
					b
				);
			},
			normalizeRule: function (b) {
				if ("string" == typeof b) {
					var c = {};
					a.each(b.split(/\s/), function () {
						c[this] = !0;
					}),
						(b = c);
				}
				return b;
			},
			addMethod: function (b, c, d) {
				(a.validator.methods[b] = c),
					(a.validator.messages[b] =
						void 0 !== d ? d : a.validator.messages[b]),
					c.length < 3 &&
						a.validator.addClassRules(
							b,
							a.validator.normalizeRule(b)
						);
			},
			methods: {
				required: function (b, c, d) {
					if (!this.depend(d, c)) return "dependency-mismatch";
					if ("select" === c.nodeName.toLowerCase()) {
						var e = a(c).val();
						return e && e.length > 0;
					}
					return this.checkable(c)
						? this.getLength(b, c) > 0
						: b.length > 0;
				},
				email: function (a, b) {
					return (
						this.optional(b) ||
						/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test(
							a
						)
					);
				},
				url: function (a, b) {
					return (
						this.optional(b) ||
						/^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})).?)(?::\d{2,5})?(?:[/?#]\S*)?$/i.test(
							a
						)
					);
				},
				date: function (a, b) {
					return (
						this.optional(b) ||
						!/Invalid|NaN/.test(new Date(a).toString())
					);
				},
				dateISO: function (a, b) {
					return (
						this.optional(b) ||
						/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/.test(
							a
						)
					);
				},
				number: function (a, b) {
					return (
						this.optional(b) ||
						/^(?:-?\d+|-?\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test(a)
					);
				},
				digits: function (a, b) {
					return this.optional(b) || /^\d+$/.test(a);
				},
				creditcard: function (a, b) {
					if (this.optional(b)) return "dependency-mismatch";
					if (/[^0-9 \-]+/.test(a)) return !1;
					var c,
						d,
						e = 0,
						f = 0,
						g = !1;
					if (
						((a = a.replace(/\D/g, "")),
						a.length < 13 || a.length > 19)
					)
						return !1;
					for (c = a.length - 1; c >= 0; c--)
						(d = a.charAt(c)),
							(f = parseInt(d, 10)),
							g && (f *= 2) > 9 && (f -= 9),
							(e += f),
							(g = !g);
					return e % 10 === 0;
				},
				minlength: function (b, c, d) {
					var e = a.isArray(b) ? b.length : this.getLength(b, c);
					return this.optional(c) || e >= d;
				},
				maxlength: function (b, c, d) {
					var e = a.isArray(b) ? b.length : this.getLength(b, c);
					return this.optional(c) || d >= e;
				},
				rangelength: function (b, c, d) {
					var e = a.isArray(b) ? b.length : this.getLength(b, c);
					return this.optional(c) || (e >= d[0] && e <= d[1]);
				},
				min: function (a, b, c) {
					return this.optional(b) || a >= c;
				},
				max: function (a, b, c) {
					return this.optional(b) || c >= a;
				},
				range: function (a, b, c) {
					return this.optional(b) || (a >= c[0] && a <= c[1]);
				},
				equalTo: function (b, c, d) {
					var e = a(d);
					return (
						this.settings.onfocusout &&
							e
								.off(".validate-equalTo")
								.on("blur.validate-equalTo", function () {
									a(c).valid();
								}),
						b === e.val()
					);
				},
				remote: function (b, c, d) {
					if (this.optional(c)) return "dependency-mismatch";
					var e,
						f,
						g = this.previousValue(c);
					return (
						this.settings.messages[c.name] ||
							(this.settings.messages[c.name] = {}),
						(g.originalMessage =
							this.settings.messages[c.name].remote),
						(this.settings.messages[c.name].remote = g.message),
						(d =
							("string" == typeof d && {
								url: d,
							}) ||
							d),
						g.old === b
							? g.valid
							: ((g.old = b),
							  (e = this),
							  this.startRequest(c),
							  (f = {}),
							  (f[c.name] = b),
							  a.ajax(
									a.extend(
										!0,
										{
											mode: "abort",
											port: "validate" + c.name,
											dataType: "json",
											data: f,
											context: e.currentForm,
											success: function (d) {
												var f,
													h,
													i,
													j =
														d === !0 ||
														"true" === d;
												(e.settings.messages[
													c.name
												].remote = g.originalMessage),
													j
														? ((i =
																e.formSubmitted),
														  e.prepareElement(c),
														  (e.formSubmitted = i),
														  e.successList.push(c),
														  delete e.invalid[
																c.name
														  ],
														  e.showErrors())
														: ((f = {}),
														  (h =
																d ||
																e.defaultMessage(
																	c,
																	"remote"
																)),
														  (f[c.name] =
																g.message =
																	a.isFunction(
																		h
																	)
																		? h(b)
																		: h),
														  (e.invalid[c.name] =
																!0),
														  e.showErrors(f)),
													(g.valid = j),
													e.stopRequest(c, j);
											},
										},
										d
									)
							  ),
							  "pending")
					);
				},
			},
		});
	var b,
		c = {};
	a.ajaxPrefilter
		? a.ajaxPrefilter(function (a, b, d) {
				var e = a.port;
				"abort" === a.mode && (c[e] && c[e].abort(), (c[e] = d));
		  })
		: ((b = a.ajax),
		  (a.ajax = function (d) {
				var e = ("mode" in d ? d : a.ajaxSettings).mode,
					f = ("port" in d ? d : a.ajaxSettings).port;
				return "abort" === e
					? (c[f] && c[f].abort(),
					  (c[f] = b.apply(this, arguments)),
					  c[f])
					: b.apply(this, arguments);
		  }));
});

var AjaxCheckout = {
	loadWaiting: false,
	usepopupnotifications: false,
	shippingtotalselector: ".shipping-total",
	totalselector: ".order-total",

	init: function (usepopupnotifications) {
		this.loadWaiting = false;
		this.usepopupnotifications = usepopupnotifications;
	},

	setLoadWaiting: function (display) {
		displayAjaxLoading(display);
		this.loadWaiting = display;
	},
	toggleCompany: function () {
		$("#divCompany").slideToggle();
		console.log("sdsd");
	},
	loadShippingServiceList: function () {
		if ($("input[provider=15]").length > 0)
			$("input[provider=15]").each(function () {
				let currentShipping = $(this);
				let urladd =
					siteRoot + "/Product/Services/CheckoutService.aspx";
				let data = {
					method: "GetServiceList",
					shippingMethodId: $(this).val(),
					provinceGuid: $("select[name=Address_Province]").val(),
					districtGuid: $("select[name=Address_District]").val(),
				};
				$.ajax({
					cache: false,
					url: urladd,
					data: data,
					type: "post",
					success: function (response) {
						if (response.success == true) {
							$(currentShipping)
								.parents(".select-group")
								.find("select")
								.html(response.data);
							$(currentShipping)
								.parents(".select-group")
								.find("select")
								.trigger("change");
						}
					},
				});
			});
	},
	getdistrictsbyprovinceguid: function (select, districtElementName) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		var urladd = siteRoot + "/Product/Services/CheckoutService.aspx";
		var data = {
			method: "GetDistrictsByProvinceGuid",
			provinceGuid: $(select).val(),
		};
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (result) {
				var district = $("select[name='" + districtElementName + "']");
				$(district).empty();
				$.each(result, function (index, value) {
					$(district).append(
						$("<option></option>").val(value.guid).html(value.name)
					);
				});
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	getshippingtotal: function (radio) {
		if ($("input[provider=15]").length > 0) {
			AjaxCheckout.loadShippingServiceList();
		}
		if ($(radio).is(":checked")) {
			var urladd = siteRoot + "/Product/Services/CheckoutService.aspx";
			var data = $("#aspnetForm").serializeArray();
			data.push({ name: "method", value: "GetShippingTotal" });
			data.push({ name: "shippingMethodId", value: $(radio).val() });
			//var data = {
			//	'method': 'GetShippingTotal',
			//	'shippingMethodId': $(radio).val()
			//};
			$.ajax({
				cache: false,
				url: urladd,
				data: data,
				type: "post",
				success: function (response) {
					if (response.success == true) {
						if (AjaxCheckout.shippingtotalselector)
							$(AjaxCheckout.shippingtotalselector).html(
								response.shippingtotalsectionhtml
							);
						if (AjaxCheckout.totalselector)
							$(AjaxCheckout.totalselector).html(
								response.totalsectionhtml
							);
					}
				},
			});
		}
	},

	ordercalculator: function () {
		var urladd = siteRoot + "/Product/Services/CheckoutService.aspx";
		var data = $("#aspnetForm").serializeArray();
		data.push({ name: "method", value: "OrderCalculator" });
		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success == true) {
					if (response.shippingTotal)
						$(AjaxCheckout.shippingtotalselector).html(
							response.shippingTotal
						);
					if (response.discountTotal)
						$(AjaxCheckout.discountselector).html(
							response.discountTotal
						);
					if (response.rewardPointTotal)
						$(AjaxCheckout.rewardPointSelector).html(
							response.rewardPointTotal
						);
					if (response.total)
						$(AjaxCheckout.totalselector).html(response.total);
					if (response.discountPaymentValue > 0)
						$(AjaxCheckout.discountPaymentSelector).html(
							response.discountPaymentMessage
						);
					else $(AjaxCheckout.discountPaymentSelector).html("");
					// if(response.expectedTime != '' && $("input[name=ShippingMethod]:checked").attr('provider') == 16)
					// {
					//     let expectedTime = response.expectedTime;
					//     if(expectedTime == '24 Giờ')
					//         expectedTime = 'Thời gian dự kiến giao hàng 1 -2 ngày';
					//     else
					//         expectedTime = 'Thời gian dự kiến giao hàng 3 -5 ngày';
					//     $("input[name=ShippingMethod]:checked").parent().find(".content .des-small").html(expectedTime);
					// }
				}
			},
		});
	},

	validateorder: function () {
		$("textarea[name=Address_Address]").val(
			$("textarea[name=Address_Address]").val().trim()
		);
		$("textarea[name=ShippingAddress_Address]").val(
			$("textarea[name=ShippingAddress_Address]").val().trim()
		);
		let $isttmh = $(".user-info.clearfix").is(":visible"); //$("#ttmh").is(":checked");
		var validator = $("#aspnetForm").validate({
			onsubmit: false,
			rules: {
				Address_FirstName: "required",
				Address_Address: "required",
				Address_Phone: {
					required: true,
					number: true,
					minlength: 8,
					maxlength: 10,
				},
				Address_Country: "required",
				Address_Province: "required",
				Address_District: "required",
				Address_Address: "required",
				Address_Mobile: "required",
				Address_Fax: "required",
				Address_Email: {
					required: true,
					email: true,
				},
				Invoice_CompanyName: "required",
				Invoice_CompanyTaxCode: "required",
				Invoice_CompanyAddress: "required",
				ShippingAddress_FirstName: {
					required: $isttmh,
				},
				ShippingAddress_Phone: {
					required: $isttmh,
				},
				ShippingAddress_Email: {
					required: $isttmh,
					email: true,
				},
				ShippingAddress_Country: {
					required: $isttmh,
				},
				ShippingAddress_Address: {
					required: $isttmh,
				},
				ShippingAddress_Province: {
					required: $isttmh,
				},
				ShippingAddress_District: {
					required: $isttmh,
				},
				ShippingAddress_ShippingMobile: {
					required: $isttmh,
				},
				ShippingAddress_ShippingFax: {
					required: $isttmh,
				},
				ShippingMethod: "required",
				PaymentMethod: "required",
			},
			messages: {
				Address_FirstName: lang[currCulture].FullNameRequired,
				Address_Address: lang[currCulture].AddressRequired,
				Address_Phone: {
					required: lang[currCulture].PhoneRequired,
					number: lang[currCulture].PhoneNotValid,
					minlength: lang[currCulture].PhoneNotValid,
				},
				Address_Country: lang[currCulture].CountryRequired,
				Address_Province: lang[currCulture].ProvinceRequired,
				Address_District: lang[currCulture].DistrictRequired,
				Address_Address: lang[currCulture].AddressRequired,
				Address_Mobile: lang[currCulture].PostCodeRequired,
				Address_Fax: lang[currCulture].CityRequired,
				Address_Email: {
					required: lang[currCulture].EmailRequired,
					email: lang[currCulture].EmailNotValid,
				},
				Invoice_CompanyName: lang[currCulture].CompanyNameRequired,
				Invoice_CompanyTaxCode:
					lang[currCulture].CompanyTaxCodeRequired,
				Invoice_CompanyAddress:
					lang[currCulture].CompanyAddressRequired,
				ShippingAddress_FirstName: {
					required: lang[currCulture].FullNameRequired,
				},
				ShippingAddress_Phone: {
					required: lang[currCulture].PhoneRequired,
				},
				ShippingAddress_Email: {
					required: lang[currCulture].EmailRequired,
					email: lang[currCulture].EmailNotValid,
				},
				ShippingAddress_Country: {
					required: lang[currCulture].CountryRequired,
				},
				ShippingAddress_Province: {
					required: lang[currCulture].ProvinceRequired,
				},
				ShippingAddress_District: {
					required: lang[currCulture].DistrictRequired,
				},
				ShippingAddress_Address: {
					required: lang[currCulture].AddressRequired,
				},
				ShippingAddress_ShippingMobile: {
					required: lang[currCulture].PostCodeRequired,
				},
				ShippingAddress_ShippingFax: {
					required: lang[currCulture].CityRequired,
				},
				ShippingMethod: lang[currCulture].ShippingMethodRequired,
				PaymentMethod: lang[currCulture].PaymentMethodRequired,
			},
		});
		if (!$("#aspnetForm").valid()) {
			validator.focusInvalid();
			return false;
		}
		return true;
	},

	saveorder: function (savetodb, redirect) {
		if (this.loadWaiting != false) {
			return;
		}
		this.setLoadWaiting(true);

		if (!this.validateorder()) {
			this.setLoadWaiting(false);
			return;
		}

		var urladd = siteRoot + "/Product/Services/CheckoutService.aspx";
		var data = $("#aspnetForm").serializeArray();
		let sameBilling = "off";
		if ($(".user-info.clearfix").is(":visible")) sameBilling = "on";
		data.push({
			name: "Address_SameBilling",
			value: sameBilling,
		});
		data.push({
			name: "method",
			value: "SaveOrder",
		});
		data.push({
			name: "savetodb",
			value: savetodb,
		});
		data.push({
			name: "redirect",
			value: redirect,
		});

		//        $("input[type=text][required],select[required]").each(function(){
		//            data.push({ name: $(this).attr("name") + ".Required", value: true });
		//        });

		$.ajax({
			cache: false,
			url: urladd,
			data: data,
			type: "post",
			success: function (response) {
				if (response.success == true) {
					if (response.redirect) {
						setLocation(response.redirect);
					}
				} else {
					//error
					displayBarNotification(response.message, "error", 0);
				}
			},
			complete: this.resetLoadWaiting,
			error: this.ajaxFailure,
		});
	},

	resetLoadWaiting: function () {
		AjaxCheckout.setLoadWaiting(false);
	},

	ajaxFailure: function () {
		alert(
			"Failed to process checkout. Please refresh the page and try one more time."
		);
	},
};

/*************************************************************************************************************/
/* END CHECKOUT
/*************************************************************************************************************/
