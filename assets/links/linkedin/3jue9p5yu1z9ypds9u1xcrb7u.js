/* Auto generated, hash = e8f4oys180ibzlotyyew43mkf */
(function() {
    function a(a, b) {
        return a.write('\x3cdiv id\x3d"captcha-dialog" aria-labelledby\x3d"captcha-title" role\x3d"dialog" tabindex\x3d"-1"\x3e\x3cspan class\x3d"a11y-hidden"\x3e').helper("i18n", b, {}, { key: "i18n_dialog_start", templateName: "reg-fe-client/tl/_captcha_dialog" }).write('\x3c/span\x3e\x3ch1 class\x3d"title" id\x3d"captcha-title"\x3e').helper("i18n", b, {}, { key: "i18n_security_verification", templateName: "reg-fe-client/tl/_captcha_dialog" }).write('\x3c/h1\x3e\x3cbutton class\x3d"close"\x3e\x3cspan class\x3d"a11y-hidden"\x3e').helper("i18n",
            b, {}, { key: "i18n_close", templateName: "reg-fe-client/tl/_captcha_dialog" }).write('\x3c/span\x3e\x3c/button\x3e\x3ciframe class\x3d"challenge-iframe" src\x3d"about:blank" frameborder\x3d"0" border\x3d"0" scrolling\x3d"auto"allowtransparency\x3d"true"\x3e\x3c/iframe\x3e\x3cspan class\x3d"a11y-hidden"\x3e').helper("i18n", b, {}, { key: "i18n_dialog_end", templateName: "reg-fe-client/tl/_captcha_dialog" }).write("\x3c/span\x3e\x3c/div\x3e")
    }
    dust.register("reg-fe-client/tl/_captcha_dialog", a);
    return a
})();
(function() {
    dust.i18n = dust.i18n || {};
    dust.i18n.cache = dust.i18n.cache || {};
    dust.i18n.cache["reg-fe-client/tl/_captcha_dialog"] = { i18n_dialog_start: "Dialog start", i18n_security_verification: "Security verification", i18n_close: "Close", i18n_dialog_end: "Dialog end" }
})();
(function() {
    LIModules.imports("patterns");
    var b;
    b = function(w, c) {
        function t(a) { return /^([a-zA-Z0-9_\-=\.\'\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,63}|[0-9]{1,3})(\]?)$/.test(a) }

        function u(a) { a = a.replace(/\-|\.|\(|\)|\ /gi, ""); return /^[+]?[0-9]+$/.test(a) }

        function v(a) {
            return "string" !== typeof a || a.match(l.INVALID_CHARS_REGEX) || a.match(l.TWO_CONSECUTIVE_DIGITS_REGEX) || a.match(l.FOUR_CONSECUTIVE_REPEATED_CHARS_REGEX) || a.match(l.LINKEDIN_REGEX) || l.URL_REGEX && l.URL_REGEX.test(a) ?
                !1 : !0
        }

        function r(a, b) {
            function f() {
                a.classList.remove(c.errorClass);
                r(a, !1)
            }
            b ? a.addEventListener(c.removeErrorOn, f) : a.removeEventListener(c.removeErrorOn, f)
        }

        function x(a) {
            a.preventDefault();
            n.validate()
        }

        function y() {
            s = (c.fields || []).map(function(a) {
                var c = a.rules,
                    f = "string" === typeof a.selector ? document.querySelector(a.selector) : a.selector;
                return {
                    name: a.name,
                    fieldEl: f,
                    isRequired: !!c[b.RULES.REQUIRED],
                    isPassword: f.getAttribute(k.TYPE) === k.PASSWORD,
                    isEmail: c[b.RULES.TYPE] === b.FIELD_TYPE.EMAIL || f.getAttribute(k.TYPE) ===
                        b.FIELD_TYPE.EMAIL,
                    isPhone: c[b.RULES.TYPE] === b.FIELD_TYPE.PHONE || f.getAttribute(k.TYPE) === b.FIELD_TYPE.PHONE,
                    isEmailPhone: c[b.RULES.TYPE] === b.FIELD_TYPE.EMAIL_OR_PHONE || f.getAttribute(k.TYPE) === b.FIELD_TYPE.EMAIL_OR_PHONE,
                    isName: c[b.RULES.TYPE] === b.FIELD_TYPE.NAME,
                    isPhonetic: c[b.RULES.TYPE] === b.FIELD_TYPE.PHONETIC,
                    test: c.test,
                    size: c.size
                }
            })
        }

        function z() {
            var a = n;
            w.addEventListener(A.SUBMIT, function(b) { x.call(a, b) })
        }
        var s = [],
            q, A = { BLUR: "blur", SUBMIT: "submit" },
            l = {
                FOUR_CONSECUTIVE_REPEATED_CHARS_REGEX: /(.)\1{3}/,
                INVALID_CHARS_REGEX: /\!|\@|\#|\$|\%|\^|\&|\*|\+|\=|\||<|\>|\?|\:|\;/,
                VALID_PHONETIC_CHARS_REGEX: /^[\u3041-\u3094\u309e\u309b\u309c\u30fc]+$/,
                LINKEDIN_REGEX: /linkedin/i,
                TWO_CONSECUTIVE_DIGITS_REGEX: /\d\d/,
                URL_REGEX: LIModules.imports("urlRE")
            },
            k = { TYPE: "type", PASSWORD: "password" },
            n = this;
        this.validate = function() {
            var a = [],
                k = [],
                f = !1;
            c.callback && s.length && (s.forEach(function(d) {
                var m = d.fieldEl;
                var e = d.fieldEl,
                    g = d.isPassword ? e.value : e.value.trim(),
                    p = g.length,
                    h = [];
                if (d.test && "function" === typeof d.test) h = d.test(e) || [];
                else if (d.isRequired && 0 === p) h.push(b.RULES.REQUIRED);
                else if (0 !== p) {
                    d.isEmail && (t(g) || h.push(b.RULES.TYPE));
                    d.isPhone && (e.setAttribute("data-isPhone", !0), u(g) || h.push(b.RULES.TYPE));
                    d.isEmailPhone && (e.setAttribute("data-isPhone", !1), u(g) ? e.setAttribute("data-isPhone", !0) : t(g) || h.push(b.RULES.TYPE));
                    !d.isName && !d.isPhonetic || v(g) || h.push(b.RULES.CHARACTERS);
                    if (e = d.isPhonetic) e = !(g.match(l.VALID_PHONETIC_CHARS_REGEX) && v(g));
                    e && h.push(b.RULES.TYPE);
                    if (d.size && Array.isArray(d.size)) {
                        var e = d.size,
                            p = !0,
                            n = g.length;
                        n < e[0] ? p = !1 : 1 < e.length && n > e[1] && (p = !1);
                        p || h.push(b.RULES.SIZE)
                    }
                }
                h.length ? (f = !0, q && !m.classList.contains(q) && (m.classList.add(c.errorClass), c.removeErrorOn && r(m, !0)), a.push({ name: d.name, fieldEl: m, value: g, errors: h })) : (q && d.fieldEl.classList.contains(q) && (m.classList.remove(c.errorClass), c.removeErrorOn && r(m, !1)), k.push({ name: d.name, fieldEl: m, value: g }))
            }), c.callback({ passed: !f, errorFields: a, validatedFields: k }))
        };
        "object" === typeof c && (y(), q = c.errorClass || "", c.validateOnSubmit && z.call(n))
    };
    b.RULES = { CHARACTERS: "characters", INVALID: "invalid", RANGE: "range", REGEX: "regex", REQUIRED: "required", SIZE: "size", TEST: "test", TYPE: "type" };
    b.FIELD_TYPE = { EMAIL: "email", PHONE: "tel", EMAIL_OR_PHONE: "emailOrPhone", NAME: "name", PHONETIC: "phonetic" };
    LIModules.exports("FormValidator", b)
})();
(function() {
    function e() {
        function e(b) {
            b.addEventListener("submit", function() {
                var a = b.querySelector("#session_key-login"),
                    c = b.querySelector("input[name\x3demail]"),
                    d = Date.now(),
                    f = "",
                    e = "",
                    h = "";
                a ? f = a.value : c && (f = c.value);
                a = [];
                for (c = 0; 3 > c; c++) a[c] = Math.floor(9E8 * Math.random()) + 1E8;
                a = a.join(":");
                c = f + ":" + a;
                window.jsRandomCalculator && (h = window.jsRandomCalculator.computeJson ? window.jsRandomCalculator.computeJson({ ts: d, n: a, email: f }) : window.jsRandomCalculator.compute(a, f, d), e = window.jsRandomCalculator.version);
                g("client_ts", d, b);
                g("client_r", c, b);
                g("client_output", h, b);
                g("client_n", a, b);
                g("client_v", e, b)
            })
        }

        function g(b, a, c) {
            var d = c.querySelector("input[name\x3d" + b + "]");
            d ? d.value = a : (d = document.createElement("input"), d.setAttribute("type", "hidden"), d.setAttribute("name", b), d.setAttribute("value", a), c.appendChild(d))
        }
        Array.prototype.slice.call(document.querySelectorAll("[data-jsenabled\x3dcheck]"), 0).forEach(function(b) {
            var a = b.querySelector("input[name\x3disJsEnabled]");
            a && (a.value = "true");
            e(b)
        })
    }
    Date.now ||
        (Date.now = function() { return (new Date).getTime() });
    "loading" !== document.readyState ? e() : document.addEventListener("DOMContentLoaded", e)
})();
(function() {
    var d = function() {},
        l = /^\"(.+)\"$/;
    d.format = function() {
        var a = arguments,
            b;
        return a[0].replace(/{(\d+)}/g, function(c, e) { b = parseInt(e, 10) + 1; return "undefined" !== a[b] ? a[b] : c })
    };
    d.hashMap = function(a) { var b = a || {}; return { addIfNotEmpty: function(a, e) { e && null !== e && (b[a] = e) }, data: b } };
    d.getQueryParams = function(a, b) {
        var c, e, d, h, f, k = {};
        if (c = b && -1 !== b.indexOf("?") ? b.substring(b.indexOf("?") + 1) : window.location.search.substring(1))
            for (c = c.split("\x26"), d = 0, e = c.length; d < e; d++) {
                f = c[d].split("\x3d");
                h = decodeURIComponent(f[0]);
                f = decodeURIComponent(f[1]);
                if (a && h === a) return f;
                k[h] = f
            }
        return a ? "" : k
    };
    d.addQueryParams = function(a, b, c) {
        var e = d.getQueryParams(!1, a);
        a = a.split("?")[0];
        var g;
        if ("string" === typeof b) "undefined" !== typeof c && (e[b] = c);
        else
            for (g in b) c = b[g], "undefined" !== typeof c && (e[g] = c);
        b = Object.keys(e).map(function(a) { return encodeURIComponent(a) + "\x3d" + encodeURIComponent(e[a]) }).join("\x26");
        return a + "?" + b
    };
    d.getCsrfToken = function() {
        var a;
        a: {
            var b, c = document.cookie.split(";"),
                d = c.length;
            for (a = 0; a < d; a++)
                if (b = c[a].trim(),
                    0 === b.indexOf("bcookie\x3d") && (b = b.substring(8, b.length), "delete me" !== b)) { a = b.replace(l, "$1").replace("v\x3d2\x26", ""); break a }
            a = null
        }
        return a || (window.play ? window.play.getPageContextValue("csrfToken", !0) : null)
    };
    d.getPageKey = function() { return document.body.id ? document.body.id.substring(8) : "" };
    d.fixDocumentDomain = function() {
        var a;
        d.isDocumentDomainFixed || (a = document.domain.replace(/([^\.]+)\./, ""), document.domain = a, d.isDocumentDomainFixed = !0)
    };
    d.isIE = function() {
        var a = window.navigator.userAgent;
        return 0 <=
            a.indexOf("MSIE ") || 0 <= a.indexOf("Trident/") || 0 <= a.indexOf("Edge/")
    };
    d.formUrlEncode = function(a, b) {
        b = b || "";
        return Object.keys(a).map(function(c) {
            var e = a[c];
            c = b ? b + "[" + c + "]" : c;
            return "object" === typeof e ? d.formUrlEncode(e, c) : encodeURIComponent(c) + "\x3d" + encodeURIComponent(e)
        }).join("\x26")
    };
    LIModules.exports("RegUtil", d)
})();
(function() {
    var g = LIModules.requires("RegUtil"),
        c;
    c = function() {
        this.sendRequest = function(a) {
            var e, f, d, h, k, l, m, b, n;
            if (!a || !a.url) { if (a && a.errorCallback) { a.errorCallback(); return } throw Error("No url or error callback provided"); }
            h = a.customHeaders || {};
            k = a.data || {};
            l = a.contentType || c.CONTENT_TYPE.JSON;
            m = a.dataType || c.DATA_TYPE.JSON;
            n = a.method || c.HTTP_METHOD.POST;
            f = a.url;
            if (!a.skipCsrf) {
                e = g.getCsrfToken();
                if (!e) {
                    if (a && a.errorCallback) { a.errorCallback(); return }
                    throw Error("No csrf token found and skipCsrf was not set to true");
                }
                e = g.format("csrfToken\x3d{0}", e);
                f += 0 <= f.indexOf("?") ? "\x26" + e : "?" + e
            }
            a.memberId && (h["X-LinkedIn-Id"] = a.memberId);
            d = {
                url: f,
                contentType: l,
                type: n,
                data: l === c.CONTENT_TYPE.JSON ? JSON.stringify(k) : g.formUrlEncode(k),
                cache: !1,
                headers: h,
                success: function(b, d, e) {
                    m === c.DATA_TYPE.JSON && (b = JSON.parse(b), e.responseJSON = b);
                    a.callback && a.callback(b, d, e)
                },
                error: function(b, d, e) {
                    if (a.errorCallback) {
                        if (b.responseText && m === c.DATA_TYPE.JSON) try { b.responseJSON = JSON.parse(b.responseText) } catch (f) {}
                        a.errorCallback(b, d)
                    }
                }
            };
            b = new XMLHttpRequest;
            b.onreadystatechange = function() { b.readyState === c.READY_STATE.DONE && (200 <= b.status && 300 > b.status || 304 === b.status ? d.success(b.responseText, b.status, b) : d.error(b, "error")) };
            b.open(d.type, d.url, !0);
            b.withCredentials = !0;
            b.setRequestHeader("Accept", "*/*");
            b.setRequestHeader("Content-Type", d.contentType);
            Object.keys(d.headers).forEach(function(a) { b.setRequestHeader(a, d.headers[a]) });
            b.send(d.data)
        };
        document.addEventListener("keypress.asyncrequest", function(a) { 27 === a.keyCode && a.preventDefault() })
    };
    c.CONTENT_TYPE = { JSON: "application/json; charset\x3dUTF-8", QUERY_STRING: "application/x-www-form-urlencoded; charset\x3dUTF-8" };
    c.DATA_TYPE = { HTML: "html", JSON: "json", SCRIPT: "script" };
    c.HTTP_STATUS = { BAD_REQUEST: 400, CONFLICT: 409, SUCCESS: 200, UNAUTHORIZED: 401 };
    c.HTTP_METHOD = { GET: "GET", POST: "POST" };
    c.READY_STATE = { UNSENT: 0, OPENED: 1, HEADERS_RECEIVED: 2, LOADING: 3, DONE: 4 };
    LIModules.exports("RegAsyncRequest", c)
})();
(function(c) {
    var e = c.requires("RegAsyncRequest"),
        h = c.requires("RegUtil"),
        g = function() {},
        k = new e;
    g.create = function(d) {
        var a = d.data || {},
            c = d.url,
            b, f;
        c ? (a.botDetectionData && (f = a.botDetectionData, f.email = a.emailAddress), b = h.hashMap({ firstName: a.firstName, lastName: a.lastName, password: a.password }), b.addIfNotEmpty("emailAddress", a.emailAddress), b.addIfNotEmpty("phoneNumber", a.phoneNumber), b.addIfNotEmpty("foreignName", a.foreignName), b.addIfNotEmpty("maidenName", a.maidenName), b.addIfNotEmpty("phoneticFirstName",
            a.phoneticFirstName), b.addIfNotEmpty("phoneticLastName", a.phoneticLastName), b.addIfNotEmpty("submissionId", a.submissionId), b.addIfNotEmpty("challengeId", a.challengeId), b.addIfNotEmpty("botDetectionInput", f), b.addIfNotEmpty("redirectInfo", a.redirectInfo), b.addIfNotEmpty("thirdPartyCredentials", a.thirdPartyCredentials), b.addIfNotEmpty("source", a.source), b.addIfNotEmpty("invitationInfo", a.invitationInfo), b.addIfNotEmpty("sendConfirmationEmail", a.sendConfirmationEmail), b.addIfNotEmpty("companyUrnsToFollow",
            a.companyUrnsToFollow), k.sendRequest({ url: c, method: e.HTTP_METHOD.POST, contentType: e.CONTENT_TYPE.JSON, customHeaders: { "X-NuxSupportsCp": "on" }, data: b.data, callback: d.callback, errorCallback: d.errorCallback })) : d.errorCallback && d.errorCallback()
    };
    c.exports("RegAccount", g)
})(LIModules);
(function() {
    LIModules.exports("RegZhUtils", {
        CHINESE_LAST_NAMES: "\u8d75 \u94b1 \u5b59 \u674e \u5468 \u5434 \u90d1 \u738b \u51af \u9648 \u891a \u536b \u848b \u6c88 \u97e9 \u6768 \u6731 \u79e6 \u5c24 \u8bb8 \u4f55 \u5415 \u65bd \u5f20 \u5b54 \u66f9 \u4e25 \u534e \u91d1 \u9b4f \u9676 \u59dc \u621a \u8c22 \u90b9 \u55bb \u67cf \u6c34 \u7aa6 \u7ae0 \u4e91 \u82cf \u6f58 \u845b \u595a \u8303 \u5f6d \u90ce \u9c81 \u97e6 \u660c \u9a6c \u82d7 \u51e4 \u82b1 \u65b9 \u4fde \u4efb \u8881 \u67f3 \u9146 \u9c8d \u53f2 \u5510 \u8d39 \u5ec9 \u5c91 \u859b \u96f7 \u8d3a \u502a \u6c64 \u6ed5 \u6bb7 \u7f57 \u6bd5 \u90dd \u90ac \u5b89 \u5e38 \u4e50 \u4e8e \u65f6 \u5085 \u76ae \u535e \u9f50 \u5eb7 \u4f0d \u4f59 \u5143 \u535c \u987e \u5b5f \u5e73 \u9ec4 \u548c \u7a46 \u8427 \u5c39 \u59da \u90b5 \u6e5b \u6c6a \u7941 \u6bdb \u79b9 \u72c4 \u7c73 \u8d1d \u660e \u81e7 \u8ba1 \u4f0f \u6210 \u6234 \u8c08 \u5b8b \u8305 \u5e9e \u718a \u7eaa \u8212 \u5c48 \u9879 \u795d \u8463 \u6881 \u675c \u962e \u84dd \u95f5 \u5e2d \u5b63 \u9ebb \u5f3a \u8d3e \u8def \u5a04 \u5371 \u6c5f \u7ae5 \u989c \u90ed \u6885 \u76db \u6797 \u5201 \u949f \u5f90 \u90b1 \u9a86 \u9ad8 \u590f \u8521 \u7530 \u6a0a \u80e1 \u51cc \u970d \u865e \u4e07 \u652f \u67ef \u661d \u7ba1 \u5362 \u83ab \u67ef \u623f \u88d8 \u7f2a \u5e72 \u89e3 \u5e94 \u5b97 \u4e01 \u5ba3 \u8d32 \u9093 \u90c1 \u5355 \u676d \u6d2a \u5305 \u8bf8 \u5de6 \u77f3 \u5d14 \u5409 \u94ae \u9f9a \u7a0b \u5d47 \u90a2 \u6ed1 \u88f4 \u9646 \u8363 \u7fc1 \u8340 \u7f8a \u4e8e \u60e0 \u7504 \u66f2 \u5bb6 \u5c01 \u82ae \u7fbf \u50a8 \u9773 \u6c72 \u90b4 \u7cdc \u677e \u4e95 \u6bb5 \u5bcc \u5deb \u4e4c \u7126 \u5df4 \u5f13 \u7267 \u9697 \u5c71 \u8c37 \u8f66 \u4faf \u5b93 \u84ec \u5168 \u90d7 \u73ed \u4ef0 \u79cb \u4ef2 \u4f0a \u5bab \u5b81 \u4ec7 \u683e \u66b4 \u7518 \u94ad \u5386 \u620e \u7956 \u6b66 \u7b26 \u5218 \u666f \u8a79 \u675f \u9f99 \u53f6 \u5e78 \u53f8 \u97f6 \u90dc \u9ece \u84df \u6ea5 \u5370 \u5bbf \u767d \u6000 \u84b2 \u90b0 \u4ece \u9102 \u7d22 \u54b8 \u7c4d \u8d56 \u5353 \u853a \u5c60 \u8499 \u6c60 \u4e54 \u9633 \u90c1 \u80e5 \u80fd \u82cd \u53cc \u95fb \u8398 \u515a \u7fdf \u8c2d \u8d21 \u52b3 \u9004 \u59ec \u7533 \u6276 \u5835 \u5189 \u5bb0 \u90e6 \u96cd \u5374 \u74a9 \u6851 \u6842 \u6fee \u725b \u5bff \u901a \u8fb9 \u6248 \u71d5 \u5180 \u6d66 \u5c1a \u519c \u6e29 \u522b \u5e84 \u664f \u67f4 \u77bf \u960e \u5145 \u6155 \u8fde \u8339 \u4e60 \u5ba6 \u827e \u9c7c \u5bb9 \u5411 \u53e4 \u6613 \u614e \u6208 \u5ed6 \u5ebe \u7ec8 \u66a8 \u5c45 \u8861 \u6b65 \u90fd \u803f \u6ee1 \u5f18 \u5321 \u56fd \u6587 \u5bc7 \u5e7f \u7984 \u9619 \u4e1c \u6b27 \u6bb3 \u6c83 \u5229 \u851a \u8d8a \u5914 \u9686 \u5e08 \u5de9 \u538d \u8042 \u6641 \u52fe \u6556 \u878d \u51b7 \u8a3e \u8f9b \u961a \u90a3 \u7b80 \u9976 \u7a7a \u66fe \u6bcb \u6c99 \u4e5c \u517b \u97a0 \u987b \u4e30 \u5de2 \u5173 \u84af \u76f8 \u67e5 \u540e \u8346 \u7ea2 \u6e38 \u7afa \u6743 \u902e \u76cd \u76ca \u6853 \u516c \u4e07\u4fdf \u53f8\u9a6c \u4e0a\u5b98 \u6b27\u9633 \u590f\u4faf \u8bf8\u845b \u95fb\u4eba \u4e1c\u65b9 \u8d6b\u8fde \u7687\u752b \u5c09\u8fdf \u516c\u7f8a \u6fb9\u53f0 \u516c\u51b6 \u5b97\u653f \u6fee\u9633 \u6df3\u4e8e \u5355\u4e8e \u592a\u53d4 \u7533\u5c60 \u516c\u5b59 \u4ef2\u5b59 \u8f69\u8f95 \u4ee4\u72d0 \u5f90\u79bb \u5b87\u6587 \u957f\u5b59 \u6155\u5bb9 \u53f8\u5f92 \u53f8\u7a7a \u8d99 \u9322 \u5b6b \u674e \u5468 \u5433 \u912d \u738b \u99ae \u9673 \u891a \u885b \u8523 \u6c88 \u97d3 \u694a \u6731 \u79e6 \u5c24 \u8a31 \u4f55 \u5442 \u65bd \u5f35 \u5b54 \u66f9 \u56b4 \u83ef \u91d1 \u9b4f \u9676 \u59dc \u621a \u8b1d \u9112 \u55bb \u67cf \u6c34 \u7ac7 \u7ae0 \u96f2 \u8607 \u6f58 \u845b \u595a \u8303 \u5f6d \u90ce \u9b6f \u97cb \u660c \u99ac \u82d7 \u9cf3 \u82b1 \u65b9 \u4fde \u4efb \u8881 \u67f3 \u9146 \u9b91 \u53f2 \u5510 \u8cbb \u5ec9 \u5c91 \u859b \u96f7 \u8cc0 \u502a \u6e6f \u6ed5 \u6bb7 \u7f85 \u7562 \u90dd \u9114 \u5b89 \u5e38 \u6a02 \u65bc \u6642 \u5085 \u76ae \u535e \u9f4a \u5eb7 \u4f0d \u4f59 \u5143 \u535c \u9867 \u5b5f \u5e73 \u9ec3 \u548c \u7a46 \u856d \u5c39 \u59da \u90b5 \u6e5b \u6c6a \u7941 \u6bdb \u79b9 \u72c4 \u7c73 \u8c9d \u660e \u81e7 \u8a08 \u4f0f \u6210 \u6234 \u8ac7 \u5b8b \u8305 \u9f90 \u718a \u7d00 \u8212 \u5c48 \u9805 \u795d \u8463 \u6881 \u675c \u962e \u85cd \u9594 \u5e2d \u5b63 \u9ebb \u5f37 \u8cc8 \u8def \u5a41 \u5371 \u6c5f \u7ae5 \u984f \u90ed \u6885 \u76db \u6797 \u5201 \u9418 \u5f90 \u90b1 \u99f1 \u9ad8 \u590f \u8521 \u7530 \u6a0a \u80e1 \u51cc \u970d \u865e \u842c \u652f \u67ef \u661d \u7ba1 \u76e7 \u83ab \u67ef \u623f \u88d8 \u7e46 \u5e72 \u89e3 \u61c9 \u5b97 \u4e01 \u5ba3 \u8cc1 \u9127 \u90c1 \u55ae \u676d \u6d2a \u5305 \u8af8 \u5de6 \u77f3 \u5d14 \u5409 \u9215 \u9f94 \u7a0b \u5d47 \u90a2 \u6ed1 \u88f4 \u9678 \u69ae \u7fc1 \u8340 \u7f8a \u65bc \u60e0 \u7504 \u66f2 \u5bb6 \u5c01 \u82ae \u7fbf \u5132 \u9773 \u6c72 \u90b4 \u7cdc \u9b06 \u4e95 \u6bb5 \u5bcc \u5deb \u70cf \u7126 \u5df4 \u5f13 \u7267 \u9697 \u5c71 \u8c37 \u8eca \u4faf \u5b93 \u84ec \u5168 \u90d7 \u73ed \u4ef0 \u79cb \u4ef2 \u4f0a \u5bae \u5be7 \u4ec7 \u6b12 \u66b4 \u7518 \u9204 \u6b77 \u620e \u7956 \u6b66 \u7b26 \u5289 \u666f \u8a79 \u675f \u9f8d \u8449 \u5e78 \u53f8 \u97f6 \u90dc \u9ece \u858a \u6ea5 \u5370 \u5bbf \u767d \u61f7 \u84b2 \u90b0 \u5f9e \u9102 \u7d22 \u54b8 \u7c4d \u8cf4 \u5353 \u85fa \u5c60 \u8499 \u6c60 \u55ac \u967d \u90c1 \u80e5 \u80fd \u84bc \u96d9 \u805e \u8398 \u9ee8 \u7fdf \u8b5a \u8ca2 \u52de \u9004 \u59ec \u7533 \u6276 \u5835 \u5189 \u5bb0 \u9148 \u96cd \u537b \u74a9 \u6851 \u6842 \u6fee \u725b \u58fd \u901a \u908a \u6248 \u71d5 \u5180 \u6d66 \u5c1a \u8fb2 \u6eab \u5225 \u5e84 \u664f \u67f4 \u77bf \u95bb \u5145 \u6155 \u9023 \u8339 \u7fd2 \u5ba6 \u827e \u9b5a \u5bb9 \u5411 \u53e4 \u6613 \u614e \u6208 \u5ed6 \u5ebe \u7d42 \u66a8 \u5c45 \u8861 \u6b65 \u90fd \u803f \u6eff \u5f18 \u5321 \u570b \u6587 \u5bc7 \u5ee3 \u797f \u95d5 \u6771 \u6b50 \u6bb3 \u6c83 \u5229 \u851a \u8d8a \u5914 \u9686 \u5e2b \u978f \u5399 \u8076 \u6641 \u52fe \u6556 \u878d \u51b7 \u8a3e \u8f9b \u95de \u90a3 \u7c21 \u9952 \u7a7a \u66fe \u6bcb \u6c99 \u4e5c \u990a \u97a0 \u9808 \u8c50 \u5de2 \u95dc \u84af \u76f8 \u67e5 \u540e \u834a \u7d05 \u6e38 \u7afa \u6b0a \u902e \u76cd \u76ca \u6853 \u516c \u842c\u4fdf \u53f8\u99ac \u4e0a\u5b98 \u6b50\u967d \u590f\u4faf \u8af8\u845b \u805e\u4eba \u6771\u65b9 \u8d6b\u9023 \u7687\u752b \u5c09\u9072 \u516c\u7f8a \u6fb9\u53f0 \u516c\u51b6 \u5b97\u653f \u6fee\u967d \u6df3\u65bc \u55ae\u65bc \u592a\u53d4 \u7533\u5c60 \u516c\u5b6b \u4ef2\u5b6b \u8ed2\u8f45 \u4ee4\u72d0 \u5f90\u96e2 \u5b87\u6587 \u9577\u5b6b \u6155\u5bb9 \u53f8\u5f92 \u53f8\u7a7a",
        PATTERN_CHINESE_CHARACTERS_UNICODE: "\u4e00-\u9fff|\u3400-\u4dbf|\uf900-\ufaff",
        EXCEPTION: { ILLEGAL_ARGUMENT: "IllegalArgumentException" },
        arrChineseLastNames: [],
        _sanitizeStrParam: function(a) { if ("string" !== typeof a) throw this.EXCEPTION.ILLEGAL_ARGUMENT; },
        _trimString: function(a) { this._sanitizeStrParam(a); return String.prototype.trim ? a.trim() : a.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, "") },
        _inArray: function(a, b) {
            var d, c = 0;
            if (!(a && b && b instanceof Array)) throw this.EXCEPTION.ILLEGAL_ARGUMENT;
            if (Array.prototype.indexOf) return -1 !==
                b.indexOf(a);
            d = b.length;
            for (c; c < d; c++)
                if (b.hasOwnProperty(c) && b[c] === a) return !0;
            return !1
        },
        isValidChineseLastName: function(a) {
            this._sanitizeStrParam(a);
            if (0 === this._trimString(a).length) return !1;
            0 === this.arrChineseLastNames.length && (this.arrChineseLastNames = this.CHINESE_LAST_NAMES.split(" "));
            return this._inArray(a, this.arrChineseLastNames)
        },
        isChineseCharString: function(a) { this._sanitizeStrParam(a); return 0 === this._trimString(a).length ? !0 : (new RegExp("^[" + this.PATTERN_CHINESE_CHARACTERS_UNICODE + "]*$")).test(a) },
        getFirstAndLastName: function(a) {
            var b;
            this._sanitizeStrParam(a);
            a = this._trimString(a);
            b = a.length;
            if (2 > b || 4 < b || !this.isChineseCharString(a)) throw this.EXCEPTION.ILLEGAL_ARGUMENT;
            2 === b ? (b = a.substring(0, 1), a = a.substring(1, 2)) : 3 === b ? (b = a.substring(0, 2), this.isValidChineseLastName(b) ? a = a.substring(2, 3) : (b = a.substring(0, 1), a = a.substring(1, 3))) : (b = a.substring(0, 2), a = a.substring(2, 4));
            return { firstName: a, lastName: b }
        }
    })
})();
(function() {
    var g = LIModules.requires("RegUtil");
    LIModules.exports("UnoCheckpoint", function(b) {
        function p() {
            g.isIE() || g.fixDocumentDomain();
            a ? h() : q(function(a) { a ? k() : h() })
        }

        function h() {
            a.focus();
            l.src = m;
            document.body.appendChild(a);
            document.documentElement.style.overflow = "hidden";
            window.unoRegChallengeSuccessCallback = r;
            window.unoRegChallengeFailureCallback = k
        }

        function q(b) {
            dust.render("reg-fe-client/tl/_captcha_dialog", {}, function(d, e) {
                var c;
                d ? b(d) : (c = document.createElement("div"), c.innerHTML = e, a = c.querySelector("#captcha-dialog"),
                    a.querySelector(".close").addEventListener("click", s), l = a.querySelector("iframe"), b(null))
            })
        }

        function s() { d || (e(), c({ softFail: !0 })) }

        function r() {
            d = !0;
            e();
            n()
        }

        function k(a) {
            d = !0;
            e();
            c(a)
        }

        function e() { a && (a.parentNode.removeChild(a), document.documentElement.style.overflow = "") }
        var a, l, f, m, n, c, d = !1;
        "object" === typeof b && (f = b.challengeId, n = b.successCallback, c = b.failureCallback, "string" === typeof f && (m = "/start/checkpoint-challenge/CHALLENGEID".replace("CHALLENGEID", f), p()))
    })
})();
(function() {
    var h = LIModules.requires("FormValidator"),
        T = LIModules.requires("RegAccount"),
        D = LIModules.requires("RegZhUtils"),
        E = LIModules.requires("RegUtil"),
        F = LIModules.imports("FacebookSignup"),
        U = LIModules.requires("UnoCheckpoint"),
        t = function(d) {
            function k(a) { return a instanceof HTMLElement ? a : document.querySelector(a) }

            function G(a) {
                b.form = k(a.form);
                if (!b.form) throw Error("NO_FORM");
                Object.keys(c).forEach(function(g) {
                    var e = c[g];
                    b[e] = a[e] ? k(a[e]) : b.form.querySelector('*[name\x3d"' + g.toLowerCase() + '"]')
                });
                b.submitBtn = a.submitBtn ? k(a.submitBtn) : b.form.querySelector(q.JOIN_BTN);
                b.fbBtn = a.fbBtn ? k(a.fbBtn) : b.form.querySelector(q.FB_BTN);
                v && Object.keys(l).forEach(function(g) {
                    g = l[g];
                    a[g] && (b[g] = k(a[g]))
                })
            }

            function H(a) {
                if (a && a.passed) {
                    A(I);
                    J(B);
                    b[c.LAST_NAME].hasAttribute(V.AUTO_FOCUS) ? b[c.LAST_NAME].focus() : b[[c.FIRST_NAME]].focus();
                    w[C.SUBMIT_BTN_TEXT] && (b.submitBtn.innerText = w[C.SUBMIT_BTN_TEXT], b.submitBtn.value = w[C.SUBMIT_BTN_TEXT]);
                    if ("function" === typeof e.onValidationSuccess) e.onValidationSuccess(a);
                    s = new h(b.form, { validateOnSubmit: !1, errorClass: f.errorClass, removeErrorOn: f.removeErrorOn, fields: m.concat(p).concat(f.customRules), callback: K })
                } else if (e.onValidationFailure) e.onValidationFailure(a)
            }

            function W(a) {
                a.preventDefault();
                s.validate()
            }

            function X(a) {
                var b = [];
                (a = a.value) || b.push(h.RULES.REQUIRED);
                (2 > a.length || 4 < a.length) && b.push(h.RULES.SIZE);
                D.isChineseCharString(a) || b.push(h.RULES.CHARACTERS);
                return b
            }

            function K(a) {
                if (a.passed) {
                    x(!0);
                    a = a.validatedFields;
                    var g = y !== t.HANDLE_TYPES.EMAIL && "true" ===
                        b.emailAddress.getAttribute("data-isPhone"),
                        d, f, h, l, m, n = {},
                        p = {},
                        k = E.getQueryParams();
                    f = 0;
                    for (h = a.length; f < h; f++)
                        if (d = a[f], l = d.name, m = d.value, l === c.REAL_NAME) {
                            try { p = D.getFirstAndLastName(m), n[c.FIRST_NAME] = p.firstName, n[c.LAST_NAME] = p.lastName } catch (s) {}
                            n[c.FOREIGN_NAME] = b.foreignName && b.foreignName.value;
                            n[c.MAIDEN_NAME] = b.maidenName && b.maidenName.value
                        } else l === c.EMAIL && g ? n[Y.PHONE] = m : n[d.name] = m;
                    g || (r || (r = {
                        clientTS: b.form.querySelector(q.CLIENT_TS),
                        clientR: b.form.querySelector(q.CLIENT_R),
                        clientOutput: b.form.querySelector(q.CLIENT_OUTPUT),
                        clientN: b.form.querySelector(q.CLIENT_N),
                        clientV: b.form.querySelector(q.CLIENT_V)
                    }), n.botDetectionData = { requestId: r.clientR.value, clientOutput: r.clientOutput.value, nonce: r.clientN.value, clientTimestampParamValue: r.clientTS.value, jsVersion: r.clientV.value });
                    b.fbBtn && (n.thirdPartyCredentials = L.getTaskCredentials());
                    if (e.onPrepareJoinData) e.onPrepareJoinData(n);
                    k && k.hasOwnProperty(z.INVITATION_ID) && k.hasOwnProperty(z.SHARED_KEY) && (n.invitationInfo = { invitationId: k[z.INVITATION_ID], sharedKey: k[z.SHARED_KEY] });
                    u = n;
                    M()
                } else if (e.onValidationFailure) e.onValidationFailure(a)
            }

            function x(a) { b.submitBtn.disabled = a || !1 }

            function M() {
                if (e.onSendJoinRequest) e.onSendJoinRequest();
                T.create({ url: N, data: u, callback: Z, errorCallback: $ })
            }

            function Z(a, g, c) {
                if (a.memberUrn) { if (e.onRegSuccess) e.onRegSuccess(a) } else if (a.challengeId) {
                    if (e.onChallenge) e.onChallenge(a);
                    O && P ? (g = b.form.cloneNode(!0), c = document.createElement("input"), c.type = "hidden", c.name = "csrfToken", c.value = E.getCsrfToken(), g.appendChild(c), g.id = "", g.style.display =
                        "none", document.body.appendChild(g), g.submit()) : ("string" === typeof a.phoneNumberInNationalFormat && (window.RegFeCp = { phoneNumberInNationalFormat: a.phoneNumberInNationalFormat, countryCode: a.countryCode }), new U({
                        challengeId: a.challengeId,
                        challengeTemplate: d.challengeTemplate,
                        successCallback: function() {
                            if (e.onChallengeSuccess) e.onChallengeSuccess();
                            x(!0);
                            u.challengeId = a.challengeId;
                            M()
                        },
                        failureCallback: function(a) {
                            if (e.onChallengeFail) e.onChallengeFail(a);
                            x(!1)
                        }
                    }));
                    u.challengeId && (u.challengeId = "")
                }
            }

            function A(a) {
                for (var c =
                        0; c < a.length; c++) b[a[c]] && b[a[c]].classList.add(Q.HIDDEN)
            }

            function J(a) { for (var c = 0; c < a.length; c++) b[a[c]] && b[a[c]].classList.remove(Q.HIDDEN) }

            function $(a, d) {
                var l = a.responseJSON || {},
                    k = l.debugMessage || "",
                    m = /^Duplicate email/.test(k),
                    k = /password/.test(k);
                x(!1);
                v && (m || k) && (J(I), A(B), s = new h(b.form, { validateOnSubmit: !1, errorClass: f.errorClass, removeErrorOn: f.removeErrorOn, fields: p.concat(f.customRules), callback: H }), b[c.EMAIL].focus());
                if (e.onRegFailure) e.onRegFailure(l, d)
            }
            var c = {
                    EMAIL: "emailAddress",
                    FIRST_NAME: "firstName",
                    FOREIGN_NAME: "foreignName",
                    LAST_NAME: "lastName",
                    MAIDEN_NAME: "maidenName",
                    PASSWORD: "password",
                    PHONE: "phoneNumber",
                    PHONETIC_FIRST_NAME: "phoneticFirstName",
                    PHONETIC_LAST_NAME: "phoneticLastName",
                    REAL_NAME: "realName"
                },
                l = { FIRST_NAME_LABEL: "firstNameLabel", LAST_NAME_LABEL: "lastNameLabel", EMAIL_LABEL: "emailLabel", PASSWORD_LABEL: "passwordLabel", JOIN_DISCLAIMER: "joinDisclaimer", ALT_LOGIN: "altLogin" },
                C = { SUBMIT_BTN_TEXT: "submitBtnText" },
                I = [l.EMAIL_LABEL, c.EMAIL, l.PASSWORD_LABEL, c.PASSWORD,
                    l.JOIN_DISCLAIMER, l.ALT_LOGIN
                ],
                B = [l.FIRST_NAME_LABEL, c.FIRST_NAME, l.LAST_NAME_LABEL, c.LAST_NAME],
                Q = { ERROR: "error", HIDDEN: "hidden" },
                Y = { PHONE: "phoneNumber" },
                q = { CLIENT_TS: 'input[name\x3d"client_ts"]', CLIENT_R: 'input[name\x3d"client_r"]', CLIENT_OUTPUT: 'input[name\x3d"client_output"]', CLIENT_N: 'input[name\x3d"client_n"]', CLIENT_V: 'input[name\x3d"client_v"]', FB_BTN: ".fb-btn", JOIN_BTN: ".join-btn" },
                V = { AUTO_FOCUS: "autofocus" },
                z = { INVITATION_ID: "invitationId", SHARED_KEY: "sharedKey" },
                f = {
                    errorClass: null,
                    removeErrorOn: null,
                    customRules: []
                },
                b = {},
                e = {},
                w = {},
                r, N, O, P, L, y, R, S, v, s, m, p, u;
            if (!d.registrationUrl) throw Error("NO_URL");
            (v = d.isSplitRegForm) && d.splitRegFormI18n && (w = d.splitRegFormI18n);
            if (d.elements) G(d.elements);
            else if (d.formNode) G({ form: d.formNode });
            else throw Error("NO_REF");
            O = !1 !== d.postCheckpointOnSubdomain;
            P = document.location.hostname;
            d.validation && (f.customRules = d.validation.customRules || [], f.errorClass = d.validation.errorClass || null, f.removeErrorOn = d.validation.removeErrorOn ||
                null);
            d.callbacks && (e = d.callbacks);
            y = d.handleType || t.HANDLE_TYPES.EMAIL_OR_PHONE;
            R = d.isChinaFlow || !1;
            S = d.isPhoneticNameLocale || !1;
            N = d.registrationUrl;
            p = [{ name: c.EMAIL, selector: b.emailAddress, rules: { required: !0, type: h.FIELD_TYPE[y], size: [3, 128] } }, { name: c.PASSWORD, selector: b.password, rules: { required: !0, size: [6] } }];
            y === t.HANDLE_TYPES.PHONE && (p[0].name = c.PHONE);
            R ? m = [{ name: c.REAL_NAME, selector: b.realName, rules: { required: !0, test: X, type: h.FIELD_TYPE.NAME, size: [2, 4] } }] : (m = [{
                name: c.FIRST_NAME,
                selector: b.firstName,
                rules: { required: !0, type: h.FIELD_TYPE.NAME, size: [1, 20] }
            }, { name: c.LAST_NAME, selector: b.lastName, rules: { required: !0, type: h.FIELD_TYPE.NAME, size: [1, 40] } }], S && (m.push({ name: c.PHONETIC_FIRST_NAME, selector: b.phoneticFirstName, rules: { required: !1, type: h.FIELD_TYPE.PHONETIC, size: [1, 20] } }), m.push({ name: c.PHONETIC_LAST_NAME, selector: b.phoneticLastName, rules: { required: !1, type: h.FIELD_TYPE.PHONETIC, size: [1, 40] } })));
            v ? (s = new h(b.form, {
                validateOnSubmit: !1,
                errorClass: f.errorClass,
                removeErrorOn: f.removeErrorOn,
                fields: p.concat(f.customRules),
                callback: H
            }), A(B), b.form.addEventListener("submit", W)) : s = new h(b.form, { validateOnSubmit: !0, errorClass: f.errorClass, removeErrorOn: f.removeErrorOn, fields: m.concat(p).concat(f.customRules), callback: K });
            if (b.fbBtn) {
                if (!F) throw Error("You must include the FacebookSignup.js if you want to add the facebook button");
                L = new F(b.fbBtn, b)
            }
            if (e.onInit) e.onInit();
            return this
        };
    t.HANDLE_TYPES = { EMAIL: "EMAIL", EMAIL_OR_PHONE: "EMAIL_OR_PHONE", PHONE: "PHONE" };
    LIModules.exports("RegForm", t)
})();
(function(d, e) {
    var f = d && d.getEmbeddedContent || function(a) {
            var b = document.getElementById(a);
            if (!b) throw Error("Element with id: " + a + " not found");
            a = b.firstChild.nodeValue;
            b.parentNode.removeChild(b);
            return JSON.parse(a)
        },
        c = {};
    "isReturning signupAjaxUrl gwmVariant isMobile i18n_sign_in i18n_join_now isPhoneRegEnabled isPhoneOnlyRegEnabled qualarooSurveyId qualarooChannelId isPreloadDuoEnabled isSplitJoinFormEnabled".split(" ").forEach(function(a) { try { c[a] = f(a) } catch (b) { c[a] = void 0 } });
    e.exports("EmbeddedContent",
        c)
})(window.play, window.LIModules);
(function(h, k) {
    function e(a, c) { return (new RegExp("\\b" + c + "\\b")).test(a.className) }
    var b = {};
    b.hasClass = e;
    b.addClass = function(a, c) {
        if (e(a, c)) return a;
        a.className = "" === a.className ? c : a.className + " " + c;
        return a
    };
    b.removeClass = function(a, c) { a.className = a.className.split(" ").filter(function(a) { return a !== c }).join(" "); return a };
    b.makeArray = function(a) { return Array.prototype.slice.call(a) };
    b.shuffle = function(a) { var c, b, d; for (c = a.length - 1; 0 < c; c--) b = Math.floor(Math.random() * c), d = a[c], a[c] = a[b], a[b] = d; return a };
    b.closest = function(a, c) { for (var b = a.matches || a.webkitMatchesSelector || a.mozMatchesSelector || a.msMatchesSelector; a && !b.call(a, c);) a = a.parentElement; return a };
    b.ready = function(a) { "complete" === document.readyState ? a() : window.addEventListener("load", a) };
    b.debounce = function(a, c, b) {
        var d;
        return function() {
            var e = this,
                f = arguments,
                g = b && !d;
            clearTimeout(d);
            d = setTimeout(function() {
                d = null;
                b || a.apply(e, f)
            }, c);
            g && a.apply(e, f)
        }
    };
    b.outerWidth = function(a) {
        var c = a.offsetWidth;
        a = getComputedStyle(a);
        return c += parseInt(a.marginLeft) +
            parseInt(a.marginRight)
    };
    b.parseQueryString = function(a) {
        return a ? a.split("\x26").reduce(function(a, b) {
            var d = b.split("\x3d");
            a[decodeURIComponent(d[0])] = decodeURIComponent(d[1]);
            return a
        }, {}) : {}
    };
    LIModules.exports("helpers", b)
})(window, document);
(function(k, g) {
    function h(b, d) { if (!b || !b.supports) return !1; try { return b.supports(d) } catch (e) { return !1 } }
    LIModules.exports("preloader", {
        preloadAssets: function(b) {
            var d = !1,
                e = g.createElement("link");
            h(e.relList, "prefetch") ? e.rel = "prefetch" : d = !0;
            var a = new XMLHttpRequest;
            a.open("GET", b, !0);
            a.onreadystatechange = function() {
                if (4 === this.readyState && 200 === this.status) {
                    var c = g.createElement("div");
                    c.innerHTML = this.responseText;
                    for (var c = c.getElementsByTagName("script"), b = g.createDocumentFragment(), a = 0; a < c.length; a++)
                        if (c[a].src)
                            if (d) {
                                var f =
                                    new XMLHttpRequest;
                                f.open("GET", c[a].src, !0);
                                f.send()
                            } else f = e.cloneNode(e), f.href = c[a].src, b.appendChild(f);
                    d || g.getElementsByTagName("head")[0].appendChild(b)
                }
            };
            a.onerror = function() { reject(new TypeError("Network request failed")) };
            a.ontimeout = function() { reject(new TypeError("Network request failed")) };
            a.send()
        }
    })
})(window, document);
(function(d, f) {
    var g = "complete" === f.readyState,
        a = {
            cache: [],
            srcAttrib: "data-delayed-url",
            onLoadClassRegex: /\bonload\b/,
            init: function() {
                var e = function() {
                    for (var b = f.querySelectorAll("[" + a.srcAttrib + "], .lazy-load"), c = 0; c < b.length; c++) a.cache.push(b[c]);
                    a.loadVisibleImages();
                    a.attachEvents();
                    d.removeEventListener("load", e)
                };
                g ? e() : d.addEventListener("load", e)
            },
            attachEvents: function() {
                d.addEventListener("scroll", a.loadVisibleImages);
                d.addEventListener("touchmove", a.loadVisibleImages);
                d.addEventListener("resize",
                    a.loadVisibleImages)
            },
            detachEvents: function() {
                d.removeEventListener("scroll", a.loadVisibleImages);
                d.removeEventListener("touchmove", a.loadVisibleImages);
                d.removeEventListener("resize", a.loadVisibleImages)
            },
            imageOnLoad: function() { this.className = this.className.replace(/(^|\s+)lazy-load(\s+|$)/, "$1lazy-loaded$2") },
            loadVisibleImages: function() {
                for (var e = 0; e < a.cache.length;) {
                    var b = a.cache[e],
                        c;
                    c = b.getBoundingClientRect();
                    0 <= c.top && 0 <= c.left && c.top <= (d.innerHeight || f.documentElement.clientHeight) || a.onLoadClassRegex.test(b.className) ?
                        (c = b.getAttribute(a.srcAttrib), "IMG" === b.tagName ? (b.onerror = b.onload = a.imageOnLoad, b.src = c, b.removeAttribute(a.srcAttrib)) : a.imageOnLoad.call(b), a.cache.splice(e, 1)) : e++
                }
                0 === a.cache.length && a.detachEvents()
            }
        };
    a.init()
})(window, document);
(function() {
    function a(a, b) { return a.helper("i18n", b, {}, { key: "i18n_reg_split_join_form_continue_btn", output: "json", templateName: "templates/ghp/partials/split_reg_form_strings" }) }
    dust.register("templates/ghp/partials/split_reg_form_strings", a);
    return a
})();
(function() {
    dust.i18n = dust.i18n || {};
    dust.i18n.cache = dust.i18n.cache || {};
    dust.i18n.cache["templates/ghp/partials/split_reg_form_strings"] = { i18n_reg_split_join_form_continue_btn: "Continue" }
})();
(function(a) {
    var b = document.querySelector('meta[name\x3d"pageKey"]'),
        c = b && b.content || "",
        d = a.requires("liTrackClient");
    a.exports("GHPTracking", {
        controlInteractionEvent: function(a, b) {
            if (!a || !b) throw Error("controlName and interactionType are required");
            d.track({ eventInfo: { eventName: "ControlInteractionEvent", topicName: "ControlInteractionEvent" }, eventBody: { requestHeader: { pageKey: c, path: window.location.href, referrer: document.referrer }, controlUrn: "urn:li:control:" + c + "-" + a, interactionType: b } })
        },
        INTERACTION_TYPE: {
            FOCUS: "FOCUS",
            SHORT_PRESS: "SHORT_PRESS"
        }
    })
})(LIModules);
(function() {
    function a(a, b) { return a }
    dust.register("templates/ghp/partials/reg_form_errors", a);
    return a
})();
(function() {
    dust.i18n = dust.i18n || {};
    dust.i18n.cache = dust.i18n.cache || {};
    dust.i18n.cache["templates/ghp/partials/reg_form_errors"] = {
        error_message_characters_firstname: "Please enter a valid first name",
        error_message_characters_lastname: "Please enter a valid last name",
        error_message_characters_phoneticfirstname: "Please enter a valid phonetic first name",
        error_message_characters_phoneticlastname: " Please enter a valid phonetic last name",
        error_message_required_emailaddress: "Please enter your email address",
        error_message_required_firstname: "Please enter your first name",
        error_message_required_lastname: "Please enter your last name",
        error_message_required_password: "Please enter your password",
        error_message_required_emailaddressorphone: "Please enter your email address or mobile number",
        error_message_required_phonenumber: "Please enter your mobile number",
        error_message_type_emailaddress: "Please enter a valid email address",
        error_message_type_emailaddressorphone: "Please enter a valid email address or mobile number",
        error_message_type_phonenumber: "Please enter a valid mobile number",
        error_message_type_phoneticfirstname: "Please use phonetic characters for your phonetic first name",
        error_message_type_phoneticlastname: "Please use phonetic characters for your phonetic last name",
        error_message_size_emailaddress: "Email can not exceed 128 characters",
        error_message_size_emailaddressorphone: "Email or mobile number must be between 3 to 128 characters",
        error_message_size_firstname: "First name can not exceed 20 characters",
        error_message_size_lastname: "Last name can not exceed 40 characters",
        error_message_size_password: "Password must be 6 characters or more",
        error_message_size_phonenumber: "Mobile number must be between 3 to 128 characters",
        error_message_size_phoneticfirstname: "Name can not exceed 20 characters",
        error_message_size_phoneticlastname: "Name can not exceed 40 characters",
        error_message_required_realname: "Please enter your real name.",
        error_message_size_realname: "Real name should be 2-4 characters long.",
        error_message_characters_realname: "Please use only Chinese characters for real name.",
        error_message_request: "Sorry, something went wrong. Please try again.",
        error_message_required_emailaddressOrPhone: "Please enter your email address or mobile number",
        error_message_type_emailaddressOrPhone: "Please enter a valid email address or mobile number",
        error_message_size_emailaddressOrPhone: "Email or mobile number must be between 3 to 128 characters",
        error_message_type_emailaddress_phone_number: "Please enter a valid email address. Mobile number registration is not supported yet."
    }
})();
(function(g) {
    function p(a, b) { b = b || ""; "emailAddress" === b && h !== l.HANDLE_TYPES.EMAIL && (h === l.HANDLE_TYPES.EMAIL_OR_PHONE ? b = "emailAddressOrPhone" : h === l.HANDLE_TYPES.PHONE && (b = "phoneNumber")); return dust.i18n.cache["templates/ghp/partials/reg_form_errors"]["error_message_" + (a || "").toLowerCase() + "_" + b.toLowerCase()] || dust.i18n.cache["templates/ghp/partials/reg_form_errors"].error_message_request }

    function v(a) {
        d.addClass(c, "hidden");
        m.textContent = ""
    }

    function w(a) {
        a = a.errorFields[0];
        a = p(a.errors[0], a.name);
        m.textContent = a;
        d.removeClass(c, "hidden");
        c.focus()
    }

    function q(a) {
        var b = a.translatedMessage || p();
        a = a || {};
        x.test(a.debugMessage) ? d.removeClass(r, "hidden") : (m.textContent = b, d.removeClass(c, "hidden"), c.focus())
    }

    function y(a) {
        a = a && a.redirectUrl || "/";
        if ("d" === k.gwmVariant) {
            var b = document.querySelector("ul.intent");
            b && b.setAttribute("data-redirect-url", a);
            if (a = document.querySelector("#intent_unselected")) a.checked = !0
        } else z.redirect(a)
    }

    function s() {
        d.addClass(c, "hidden");
        c.blur()
    }

    function t() {
        var a, b, e;
        h = k.isPhoneRegEnabled ? k.isPhoneOnlyRegEnabled ? "PHONE" : "EMAIL_OR_PHONE" : "EMAIL";
        f = document.querySelector("#regForm");
        r = document.getElementById("login-callout");
        n = document.querySelector("#reg-exit-intent-popup");
        f && (c = f.querySelector(".reg-alert")) && (m = c.querySelector(".alert-content"), c.querySelector(".dismiss-alert").addEventListener("click", s), u = f.querySelector(".submit-button"), u.disabled = !1, a = d.hasClass(f, "china"), b = d.hasClass(f, "phoneticNameLocale"), e = {
            form: f,
            submitBtn: "#regForm .submit-button",
            emailAddress: ".reg-email",
            password: ".reg-password"
        }, a ? (e.realName = ".reg-realname", e.foreignName = ".reg-foreignname") : (e.firstName = ".reg-firstname", e.lastName = ".reg-lastname"), b && (e.phoneticFirstName = ".reg-phoneticfirstname", e.phoneticLastName = ".reg-phoneticlastname"), A(), a = {
            registrationUrl: k.signupAjaxUrl,
            elements: e,
            isChinaFlow: a,
            isPhoneticNameLocale: b,
            handleType: h,
            validation: { errorClass: "error", removeErrorOn: "focus" },
            callbacks: {
                onValidationFailure: w,
                onPrepareJoinData: s,
                onRegSuccess: y,
                onRegFailure: q,
                onChallengeFail: q
            }
        }, k.isSplitJoinFormEnabled && (a.isSplitRegForm = !0, a.splitRegFormI18n = { submitBtnText: dust.i18n.cache["templates/ghp/partials/split_reg_form_strings"].i18n_reg_split_join_form_continue_btn }, a.callbacks.onValidationSuccess = v, a.elements.firstNameLabel = "#regForm label[for\x3dreg-firstname]", a.elements.lastNameLabel = "#regForm label[for\x3dreg-lastname]", a.elements.emailLabel = "#regForm label[for\x3dreg-email]", a.elements.passwordLabel = "#regForm label[for\x3dreg-password]", a.elements.joinDisclaimer =
            "#regForm .agreement"), new l(a))
    }

    function A() {
        if (n && "true" === n.dataset.joinPopup) {
            var a = d.makeArray(document.querySelectorAll(".join-btn")),
                b = new B(n);
            a.forEach(function(a) { a.addEventListener("click", function(a) { b.showFormWithBind(a, null, !0) }) })
        }
    }
    var l = g.requires("RegForm"),
        B = g.imports("RegPopup"),
        d = g.requires("helpers"),
        z = g.requires("jSecure");
    g.requires("GHPTracking");
    var k = g.requires("EmbeddedContent"),
        x = /Duplicate email/,
        f, r, n, c, m, u, h;
    "complete" === document.readyState ? t() : window.addEventListener("load",
        t)
})(LIModules);
(function(h, a) {
    function q(b) {
        var a = this.querySelector('[name\x3d"first"]').value || "",
            d = this.querySelector('[name\x3d"last"]').value || "",
            e = this.querySelector('[name\x3d"trk"]').value || "";
        b.preventDefault();
        window.location.href = "/pub/dir/" + (encodeURIComponent(a.trim()) || "+") + "/" + (encodeURIComponent(d.trim()) || "+") + "?trk\x3d" + encodeURIComponent(e)
    }

    function r(b) {
        var a = g.closest(b.target, ".hopscotch-bubble");
        b.preventDefault();
        g.addClass(a, "hidden")
    }

    function s(b, a) {
        var d = g.makeArray(b.querySelectorAll('input[type\x3d"emailOrPhone"],input[type\x3d"email"],input[type\x3d"text"],input[type\x3d"password"]')),
            e = b.querySelector('input[type\x3d"submit"]'),
            c;
        c = d.filter(function(a) { return !a.value || !a.value.trim() });
        e.disabled = a && 0 < c.length || c.length === d.length ? !0 : !1
    }

    function l(a, c) {
        var d = function() { s(a, c) };
        d();
        a.addEventListener("input", d)
    }

    function t() {
        m.classList.remove("visible");
        n.classList.remove("masked");
        0 == f
    }

    function u() {
        m.classList.add("visible");
        n.classList.add("masked");
        v && !f && (k.src = k.src, f = !0)
    }

    function p() {
        var b = a.querySelector(".login-form"),
            g = b.querySelector("input:first-of-type"),
            d = a.querySelector(".hopscotch-close"),
            e = a.querySelector(".reg-form input:not(.hidden)"),
            f = a.querySelector(".same-name-search");
        f.addEventListener("submit", q);
        l(f);
        d.addEventListener("click", r);
        l(b, !0);
        c.isPreloadDuoEnabled && e && e.addEventListener("input", function w() {
            x.preloadAssets("//" + window.location.hostname + "/onboarding/start");
            e.removeEventListener("input", w)
        });
        c.isReturning ? g.focus() : e.focus();
        k && c.qualarooSurveyId && c.qualarooChannelId && (b = h.requires("Qualaroo")) && new b({
            frameElement: k,
            surveyId: c.qualarooSurveyId,
            onRender: u,
            onDismiss: t,
            expectedChannelId: c.qualarooChannelId
        })
    }
    var c = h.requires("EmbeddedContent"),
        g = h.requires("helpers"),
        x = h.requires("preloader"),
        m = a.querySelector(".qualaroo-wrapper"),
        k = a.getElementById("qualaroo-frame"),
        n = a.querySelector(".global-wrapper"),
        v = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/),
        f = !1;
    "loading" !== a.readyState ? p() : a.addEventListener("DOMContentLoaded", p)
})(window.LIModules, document);