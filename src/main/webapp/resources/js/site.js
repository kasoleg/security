$(document).ready(function() {
	if ($("#registration-form").is(":visible")) {
        $("#new-account-btn").hide()
    } else {
        $("#new-account-btn").show()
    }

	$("#new-account-btn").click(function() {
	        if ($("#registration-form").is(":visible")) {
	            $(this).show()
	        } else {
	            $(this).hide();
	            $("#registration-form").slideDown(500);
	        }
	    });		
});

$(document).ready(function() {
	var loginForm = $("#loginForm");
	var email = $('#email');
	var password = $("#password");
	var errorEmail = $("#errorEmail");
	var errorPassword = $("#errorPassword");
	var emailReg = /^[a-zA-Z0-9]+[a-zA-Z0-9_.-]+[a-zA-Z0-9_-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{2,4}$/;
	
	
	email.keydown(function() {
		errorEmail.text("");
	});
	
	password.keydown(function() {
		errorPassword.text("");
	});
	
	loginForm.submit(function() {
		if (validateEmail() & validatePassword()) {
			return true;
		} else {
			return false;
		}
	});
	
	function validateEmail() {
		var errors = false;
		if (email.val() == "") {
			errorEmail.text("The email is required and cannot be empty");
			errors = true;
		} else if (!emailReg.test(email.val())) {
			errorEmail.text("The input is not a valid email address");
			errors = true;
		}	else {
			errorEmail.text("");
		} 
		if (errors)
			return false;
		else
			return true;
	}
	
	function validatePassword() {
		if (password.val().length == 0) {
			errorPassword.text("The password is required and cannot be empty");
			return false;	
		} else {
			return true;
		}
	}
	
	var registrationForm = $("#registration-form");
	var name = $("#name");
	var emailRegistration = $('#emailRegistration');
	var passwordRegistration = $("#passwordRegistration");
	var errorEmailRegistration = $("#errorEmailRegistration");
	var errorPasswordRegistration = $("#errorPasswordRegistration");
	var errorName = $("#errorName");
	
	emailRegistration.keydown(function() {
		errorEmailRegistration.text("");
	});
	
	passwordRegistration.keydown(function() {
		errorPasswordRegistration.text("");
	});
	
	name.keydown(function() {
		errorName.text("");
	});
	
	registrationForm.submit(function() {
		if (validateNameRegistration() & validateEmailRegistration() & validatePasswordRegistration()) {
			return true;
		} else {
			return false;
		}
	});
	
	function validateEmailRegistration() {
		var errors = false;
		if (emailRegistration.val() == "") {
			errorEmailRegistration.text("The email is required and cannot be empty");
			errors = true;
		} else if (!emailReg.test(emailRegistration.val())) {
			errorEmailRegistration.text("The input is not a valid email address");
			errors = true;
		}	else {
			errorEmailRegistration.text("");
		} 
		if (errors)
			return false;
		else
			return true;
	}
	
	function validatePasswordRegistration() {
		if (passwordRegistration.val().length == 0) {
			errorPasswordRegistration.text("The password is required and cannot be empty");
			return false;	
		} else {
			return true;
		}
	}
	
	function validateNameRegistration() {
		if (name.val() == "") {
			errorName.text("The username is required and cannot be empty");
			return false;
		} else {
			errorName.text("");
			return true;
		}
	}
});

$(document).ready(function() {
	var shopDropdownMenu = $("#shop-dropdown-menu");
	var account = $("#account");
	
	account.mouseenter(function() {
		if (!shopDropdownMenu.is(":visible")) {
            shopDropdownMenu.slideDown(200);
        }
	});
	
	account.mouseleave(function() {
		shopDropdownMenu.slideUp(200);
	});
});

function facetToggle(a, c) {
	var d = $(a).find("span");
    var b = $(window).width();
    if (b <= 480) {
        $(".facet_panel").each(function() {
            if ($(this).is(":visible") && this.id != c + "_facet_panel") {
                $(this).slideToggle()
            }
        })
    }
    $("#" + c + "_facet_panel").slideToggle();
    $(d).toggleClass("plus");
    $(d).toggleClass("minus")
}

function activeLi(element) {
	var element = $(element);
	var li = $("li");
	li.removeClass("active");
	element.addClass("active");
}

function activeColor(element) {
	var element = $(element);
	var li = $("li");
	li.removeClass("selected");
	element.addClass("selected");
}

function activeMenuItem(element, item) {
	var element = $(element);
	var productDetails = $("#productDetails");
	var productFeatures = $("#productFeatures");
	var li = $("li");
	li.removeClass("active");
	element.addClass("active");
	if (item == 1) {
		productFeatures.removeClass("active");
		productDetails.addClass("active");
	} else {
		productDetails.removeClass("active");
		productFeatures.addClass("active");
	}
}

$(document).ready(function() {
	var showButton = $(".show-button");
	var productDetails = $("#productDetails");
	var more = $(".more");
	var less = $(".less");
	showButton.click(function() {
		if (productDetails.is(".see-less")) {
			productDetails.removeClass("see-less");
			more.css("display", "none");
			less.css("display", "inline-block");
			
		} else {
			productDetails.addClass("see-less");
			less.css("display", "none");
			more.css("display", "inline-block");
		}          
    });		
});

/*! perfect-scrollbar - v0.5.1
 * http://noraesae.github.com/perfect-scrollbar/
 * Copyright (c) 2014 Hyeonje Alex Jun; Licensed MIT */
(function(a) {
    "function" == typeof define && define.amd ? define(["jquery"], a) : "object" == typeof exports ? a(require("jquery")) : a(jQuery)
})(function(b) {
    var a = {
            wheelSpeed: 1,
            wheelPropagation: !1,
            minScrollbarLength: null,
            maxScrollbarLength: null,
            useBothWheelAxes: !1,
            useKeyboard: !0,
            suppressScrollX: !1,
            suppressScrollY: !1,
            scrollXMarginOffset: 0,
            scrollYMarginOffset: 0,
            includePadding: !1
        },
        c = function() {
            var d = 0;
            return function() {
                var e = d;
                return d += 1, ".perfect-scrollbar-" + e
            }
        }();
    b.fn.perfectScrollbar = function(e, d) {
        return this.each(function() {
            var az = b.extend(!0, {}, a),
                aJ = b(this);
            if ("object" == typeof e ? b.extend(!0, az, e) : d = e, "update" === d) {
                return aJ.data("perfect-scrollbar-update") && aJ.data("perfect-scrollbar-update")(), aJ
            }
            if ("destroy" === d) {
                return aJ.data("perfect-scrollbar-destroy") && aJ.data("perfect-scrollbar-destroy")(), aJ
            }
            if (aJ.data("perfect-scrollbar")) {
                return aJ.data("perfect-scrollbar")
            }
            aJ.addClass("ps-container");
            var av, aC, aH, aG, au, ax, aF, at, aD, aI, aE = b("<div class='ps-scrollbar-x-rail'></div>").appendTo(aJ),
                ay = b("<div class='ps-scrollbar-y-rail'></div>").appendTo(aJ),
                ar = b("<div class='ps-scrollbar-x'></div>").appendTo(aE),
                t = b("<div class='ps-scrollbar-y'></div>").appendTo(ay),
                ac = parseInt(aE.css("bottom"), 10),
                ap = ac === ac,
                af = ap ? null : parseInt(aE.css("top"), 10),
                al = parseInt(ay.css("right"), 10),
                N = al === al,
                aq = N ? null : parseInt(ay.css("left"), 10),
                ak = "rtl" === aJ.css("direction"),
                Z = c(),
                o = parseInt(aE.css("borderLeftWidth"), 10) + parseInt(aE.css("borderRightWidth"), 10),
                n = parseInt(aE.css("borderTopWidth"), 10) + parseInt(aE.css("borderBottomWidth"), 10),
                aA = function(l, f) {
                    var q = l + f,
                        m = aG - aD;
                    aI = 0 > q ? 0 : q > m ? m : q;
                    var g = parseInt(aI * (ax - aG) / (aG - aD), 10);
                    aJ.scrollTop(g)
                },
                aj = function(l, f) {
                    var q = l + f,
                        m = aH - aF;
                    at = 0 > q ? 0 : q > m ? m : q;
                    var g = parseInt(at * (au - aH) / (aH - aF), 10);
                    aJ.scrollLeft(g)
                },
                ab = function(f) {
                    return az.minScrollbarLength && (f = Math.max(f, az.minScrollbarLength)), az.maxScrollbarLength && (f = Math.min(f, az.maxScrollbarLength)), f
                },
                r = function() {
                    var g = {
                        width: aH,
                        display: av ? "inherit" : "none"
                    };
                    g.left = ak ? aJ.scrollLeft() + aH - au : aJ.scrollLeft(), ap ? g.bottom = ac - aJ.scrollTop() : g.top = af + aJ.scrollTop(), aE.css(g);
                    var f = {
                        top: aJ.scrollTop(),
                        height: aG,
                        display: aC ? "inherit" : "none"
                    };
                    N ? f.right = ak ? au - aJ.scrollLeft() - al - t.outerWidth() : al - aJ.scrollLeft() : f.left = ak ? aJ.scrollLeft() + 2 * aH - au - aq - t.outerWidth() : aq + aJ.scrollLeft(), ay.css(f), ar.css({
                        left: at,
                        width: aF - o
                    }), t.css({
                        top: aI,
                        height: aD - n
                    }), av ? aJ.addClass("ps-active-x") : aJ.removeClass("ps-active-x"), aC ? aJ.addClass("ps-active-y") : aJ.removeClass("ps-active-y")
                },
                aB = function() {
                    aE.hide(), ay.hide(), aH = az.includePadding ? aJ.innerWidth() : aJ.width(), aG = az.includePadding ? aJ.innerHeight() : aJ.height(), au = aJ.prop("scrollWidth"), ax = aJ.prop("scrollHeight"), !az.suppressScrollX && au > aH + az.scrollXMarginOffset ? (av = !0, aF = ab(parseInt(aH * aH / au, 10)), at = parseInt(aJ.scrollLeft() * (aH - aF) / (au - aH), 10)) : (av = !1, aF = 0, at = 0, aJ.scrollLeft(0)), !az.suppressScrollY && ax > aG + az.scrollYMarginOffset ? (aC = !0, aD = ab(parseInt(aG * aG / ax, 10)), aI = parseInt(aJ.scrollTop() * (aG - aD) / (ax - aG), 10)) : (aC = !1, aD = 0, aI = 0, aJ.scrollTop(0)), aI >= aG - aD && (aI = aG - aD), at >= aH - aF && (at = aH - aF), r(), aE.show(), ay.show()
                },
                aa = function() {
                    var f, g;
                    ar.bind("mousedown" + Z, function(l) {
                        g = l.pageX, f = ar.position().left, aE.addClass("in-scrolling"), l.stopPropagation(), l.preventDefault()
                    }), b(document).bind("mousemove" + Z, function(l) {
                        aE.hasClass("in-scrolling") && (aj(f, l.pageX - g), aB(), l.stopPropagation(), l.preventDefault())
                    }), b(document).bind("mouseup" + Z, function() {
                        aE.hasClass("in-scrolling") && aE.removeClass("in-scrolling")
                    }), f = g = null
                },
                aw = function() {
                    var f, g;
                    t.bind("mousedown" + Z, function(l) {
                        g = l.pageY, f = t.position().top, ay.addClass("in-scrolling"), l.stopPropagation(), l.preventDefault()
                    }), b(document).bind("mousemove" + Z, function(l) {
                        ay.hasClass("in-scrolling") && (aA(f, l.pageY - g), aB(), l.stopPropagation(), l.preventDefault())
                    }), b(document).bind("mouseup" + Z, function() {
                        ay.hasClass("in-scrolling") && ay.removeClass("in-scrolling")
                    }), f = g = null
                },
                an = function(g, f) {
                    var m = aJ.scrollTop();
                    if (0 === g) {
                        if (!aC) {
                            return !1
                        }
                        if (0 === m && f > 0 || m >= ax - aG && 0 > f) {
                            return !az.wheelPropagation
                        }
                    }
                    var l = aJ.scrollLeft();
                    if (0 === f) {
                        if (!av) {
                            return !1
                        }
                        if (0 === l && 0 > g || l >= au - aH && g > 0) {
                            return !az.wheelPropagation
                        }
                    }
                    return !0
                },
                am = function() {
                    var g = !1,
                        f = function(q) {
                            var m = q.originalEvent.deltaX,
                                s = -1 * q.originalEvent.deltaY;
                            return (m === void 0 || s === void 0) && (m = -1 * q.originalEvent.wheelDeltaX / 6, s = q.originalEvent.wheelDeltaY / 6), q.originalEvent.deltaMode && 1 === q.originalEvent.deltaMode && (m *= 10, s *= 10), m !== m && s !== s && (m = 0, s = q.originalEvent.wheelDelta), [m, s]
                        },
                        l = function(u) {
                            var q = f(u),
                                m = q[0],
                                s = q[1];
                            g = !1, az.useBothWheelAxes ? aC && !av ? (s ? aJ.scrollTop(aJ.scrollTop() - s * az.wheelSpeed) : aJ.scrollTop(aJ.scrollTop() + m * az.wheelSpeed), g = !0) : av && !aC && (m ? aJ.scrollLeft(aJ.scrollLeft() + m * az.wheelSpeed) : aJ.scrollLeft(aJ.scrollLeft() - s * az.wheelSpeed), g = !0) : (aJ.scrollTop(aJ.scrollTop() - s * az.wheelSpeed), aJ.scrollLeft(aJ.scrollLeft() + m * az.wheelSpeed)), aB(), g = g || an(m, s), g && (u.stopPropagation(), u.preventDefault())
                        };
                    window.onwheel !== void 0 ? aJ.bind("wheel" + Z, l) : window.onmousewheel !== void 0 && aJ.bind("mousewheel" + Z, l)
                },
                ag = function() {
                    var f = !1;
                    aJ.bind("mouseenter" + Z, function() {
                        f = !0
                    }), aJ.bind("mouseleave" + Z, function() {
                        f = !1
                    });
                    var g = !1;
                    b(document).bind("keydown" + Z, function(s) {
                        if (!(s.isDefaultPrevented && s.isDefaultPrevented() || !f || b(document.activeElement).is(":input,[contenteditable]"))) {
                            var q = 0,
                                m = 0;
                            switch (s.which) {
                                case 37:
                                    q = -30;
                                    break;
                                case 38:
                                    m = 30;
                                    break;
                                case 39:
                                    q = 30;
                                    break;
                                case 40:
                                    m = -30;
                                    break;
                                case 33:
                                    m = 90;
                                    break;
                                case 32:
                                case 34:
                                    m = -90;
                                    break;
                                case 35:
                                    m = -aG;
                                    break;
                                case 36:
                                    m = aG;
                                    break;
                                default:
                                    return
                            }
                            aJ.scrollTop(aJ.scrollTop() - m), aJ.scrollLeft(aJ.scrollLeft() + q), g = an(q, m), g && s.preventDefault()
                        }
                    })
                },
                ad = function() {
                    var f = function(g) {
                        g.stopPropagation()
                    };
                    t.bind("click" + Z, f), ay.bind("click" + Z, function(m) {
                        var g = parseInt(aD / 2, 10),
                            s = m.pageY - ay.offset().top - g,
                            q = aG - aD,
                            l = s / q;
                        0 > l ? l = 0 : l > 1 && (l = 1), aJ.scrollTop((ax - aG) * l)
                    }), ar.bind("click" + Z, f), aE.bind("click" + Z, function(m) {
                        var g = parseInt(aF / 2, 10),
                            s = m.pageX - aE.offset().left - g,
                            q = aH - aF,
                            l = s / q;
                        0 > l ? l = 0 : l > 1 && (l = 1), aJ.scrollLeft((au - aH) * l)
                    })
                },
                V = function() {
                    var g = function(s, l) {
                            aJ.scrollTop(aJ.scrollTop() - l), aJ.scrollLeft(aJ.scrollLeft() - s), aB()
                        },
                        v = {},
                        u = 0,
                        q = {},
                        f = null,
                        m = !1;
                    b(window).bind("touchstart" + Z, function() {
                        m = !0
                    }), b(window).bind("touchend" + Z, function() {
                        m = !1
                    }), aJ.bind("touchstart" + Z, function(s) {
                        var l = s.originalEvent.targetTouches[0];
                        v.pageX = l.pageX, v.pageY = l.pageY, u = (new Date).getTime(), null !== f && clearInterval(f), s.stopPropagation()
                    }), aJ.bind("touchmove" + Z, function(z) {
                        if (!m && 1 === z.originalEvent.targetTouches.length) {
                            var w = z.originalEvent.targetTouches[0],
                                s = {};
                            s.pageX = w.pageX, s.pageY = w.pageY;
                            var y = s.pageX - v.pageX,
                                B = s.pageY - v.pageY;
                            g(y, B), v = s;
                            var A = (new Date).getTime(),
                                x = A - u;
                            x > 0 && (q.x = y / x, q.y = B / x, u = A), z.preventDefault()
                        }
                    }), aJ.bind("touchend" + Z, function() {
                        clearInterval(f), f = setInterval(function() {
                            return 0.01 > Math.abs(q.x) && 0.01 > Math.abs(q.y) ? (clearInterval(f), void 0) : (g(30 * q.x, 30 * q.y), q.x *= 0.8, q.y *= 0.8, void 0)
                        }, 10)
                    })
                },
                U = function() {
                    aJ.bind("scroll" + Z, function() {
                        aB()
                    })
                },
                ao = function() {
                    aJ.unbind(Z), b(window).unbind(Z), b(document).unbind(Z), aJ.data("perfect-scrollbar", null), aJ.data("perfect-scrollbar-update", null), aJ.data("perfect-scrollbar-destroy", null), ar.remove(), t.remove(), aE.remove(), ay.remove(), aE = ay = ar = t = av = aC = aH = aG = au = ax = aF = at = ac = ap = af = aD = aI = al = N = aq = ak = Z = null
                },
                ai = function(f) {
                    aJ.addClass("ie").addClass("ie" + f);
                    var l = function() {
                            var m = function() {
                                    b(this).addClass("hover")
                                },
                                q = function() {
                                    b(this).removeClass("hover")
                                };
                            aJ.bind("mouseenter" + Z, m).bind("mouseleave" + Z, q), aE.bind("mouseenter" + Z, m).bind("mouseleave" + Z, q), ay.bind("mouseenter" + Z, m).bind("mouseleave" + Z, q), ar.bind("mouseenter" + Z, m).bind("mouseleave" + Z, q), t.bind("mouseenter" + Z, m).bind("mouseleave" + Z, q)
                        },
                        g = function() {
                            r = function() {
                                var q = {
                                    left: at + aJ.scrollLeft(),
                                    width: aF
                                };
                                ap ? q.bottom = ac : q.top = af, ar.css(q);
                                var m = {
                                    top: aI + aJ.scrollTop(),
                                    height: aD
                                };
                                N ? m.right = al : m.left = aq, t.css(m), ar.hide().show(), t.hide().show()
                            }
                        };
                    6 === f && (l(), g())
                },
                ah = "ontouchstart" in window || window.DocumentTouch && document instanceof window.DocumentTouch,
                ae = function() {
                    var f = navigator.userAgent.toLowerCase().match(/(msie) ([\w.]+)/);
                    f && "msie" === f[1] && ai(parseInt(f[2], 10)), aB(), U(), aa(), aw(), ad(), am(), ah && V(), az.useKeyboard && ag(), aJ.data("perfect-scrollbar", aJ), aJ.data("perfect-scrollbar-update", aB), aJ.data("perfect-scrollbar-destroy", ao)
                };
            return ae(), aJ
        })
    }
});

(function(document, window, $) {
$(document).ready(function() {
	$('.slick-slider').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  arrows: false,
		  fade: true,
		  asNavFor: '#ib_img_thumb'
		});
		$('#ib_img_thumb').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  asNavFor: '.slick-slider',
		  centerMode: true,
		  focusOnSelect: true,
		 
		});
		$(".slick-slider").on('beforeChange', function () {
			$(".slick-center img").removeClass("selectedThumb");
		});
		$(".slick-slider").on('afterChange', function () {
			$(".slick-center img").addClass("selectedThumb");
		});
		
		$(".similar_items_side #similar-items-carousel").slick({
	        infinite: true,
	        speed: 200,
	        slidesToShow: 1,
	        adaptiveHeight: false,
	        autoplay: true,
	        autoplaySpeed: 5000,
	        dots: false,
	        responsive: [{
	            breakpoint: 640,
	            settings: {
	                autoplay: false,
	                slidesToShow: 1,
	                slidesToScroll: 1,
	                arrows: true,
	                dots: false
	            }
	        }]
	    });
	    
});
})(document, window, jQuery);



$(document).ready(function() {
	var add = $("#add");
	var del = $(".del");
	var controls = $("#controls");
	add.click(function(){
		var is = $('.count').size();
		controls.before("<tr class='count'><td><input id='details"+is+".attribute' name='details["+is+"].attribute' type='text' value=''></td><td><input id='details"+is+".value' name='details["+is+"].value' type='text' value=''></td><td><input type='button' class='del' onclick='del(this)' value='Delete attribute'></td></tr>");
	});
});

function del(element) {
	var count = $(".count");
	
	$(element).parent().parent().remove();
	
}

function delMenuLink(element) {
	
	$(element).parent().parent().remove();
	
	$(".menu").each(function(i){
		this.id = "links"+(i-1);
		this.name = name="links["+(i-1)+"]";
	});
}


$(document).ready(function() {
	var addMenuLink = $("#addMenuLink");
	var controls = $("#controls");
	addMenuLink.click(function(){
		var is = $('.count').size();
		controls.before("<tr class='count'><td><input class='menu' id='links"+is+"' name='links["+is+"]' type='text'></td><td><input type='button' class='delMenuLink' onclick='delMenuLink(this)' value='Delete attribute'></td>");
	});
});

$(document).ready(function() {
	var select = $("#select");
	var search = $("#search");
	select.change(function() {
		var selected = $("#select option:selected").text();
		search.attr("action", "/mongo/"+selected);
	});
});

$(document).ready(function() {
	var relevance = $("#relevance");
	var asc = $("#asc");
	var desc = $("#desc");
	relevance.click(function() {
		var url;
		var parameters = parseQueryString(location.href.split('?')[1]);
		if ("sort" in parameters) {
			parameters["sort"] = "relevance";
			url = parseToQueryString(parameters);
		} else {
			url = location.href + "&sort=relevance"
		}
		relevance.attr("href", url);
	});
	asc.click(function() {
		var url;
		var parameters = parseQueryString(location.href.split('?')[1]);
		if ("sort" in parameters) {
			parameters["sort"] = "asc";
			url = parseToQueryString(parameters);
		} else {
			url = location.href + "&sort=asc"
		}
		asc.attr("href", url);
	});
	desc.click(function() {
		var url;
		var parameters = parseQueryString(location.href.split('?')[1]);
		if ("sort" in parameters) {
			parameters["sort"] = "desc";
			url = parseToQueryString(parameters);
		} else {
			url = location.href + "&sort=desc"
		}
		desc.attr("href", url);
	});
});

var parseQueryString = function (strQuery) {
    var i,
        tmp     = [],
        tmp2    = [],
        objRes   = {};
    if (strQuery != '') {
        tmp = (strQuery.substr(0)).split('&');
        for (i = 0; i < tmp.length; i += 1) {
            tmp2 = tmp[i].split('=');
            if (tmp2[0]) {
                objRes[tmp2[0]] = tmp2[1];
            }
        }
    }
    return objRes;
};

var parseToQueryString = function (objRes) {
	var string = location.href.split('?')[0] + '?';
	for (var val in objRes) {
		string += val + "=" + objRes[val] + "&";
	}
	string = string.substr(0, string.length-1);
	return string;
};