function OnFailed(error, userContext, methodName) { }

var timerId = '' ;
function startTimer(id) {
    timerId = id;
    var timer = $find(timerId);
    timer._startTimer();
}

function stopTimer() {
    if (timerId != '') {
        var timer = $find(timerId);
        timer._stopTimer();
    }
}

function showModalPopup(behaviorId) {
    var modalPopupBehavior = $find(behaviorId);
    modalPopupBehavior.show();
}

function hideModalPopup(behaviorId) {
    var modalPopupBehavior = $find(behaviorId);
    modalPopupBehavior.hide();
}

function showObject(id) { $('#' + id).css({ visibility: "visible", display: "block" }); }
function hideObject(id) { $('#' + id).css({ visibility: "hidden", display: "none" }); }

function WindowOpen(url, target, alto, ancho) {
    if (alto == "0" || ancho == "0") {
        window.open(url, target, 'fullscreen=yes, scrollbars=no');
    } else {
        vert = (screen.height - alto) / 2;
        hor = (screen.width - ancho) / 2;
        propiedades = eval("'toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=yes, scrollbars=no, width=" + ancho + ", height=" + alto + ", left=" + hor + ", top=" + vert + "'");
        window.open(url, target, propiedades);
    }
}

function client_Validator(validateGroup) {
    try {
        var isPageValid = true;

        if (typeof (Page_Validators) != "undefined") {
            if (typeof (Page_ClientValidate) == 'function') {
                isPageValid = Page_ClientValidate(validateGroup);
            } else {
                alert("Page_ClientValidate function undefined");
            }
        } else {
            alert("Page_Validators undefined");
        }

        return isPageValid;
    } catch (er) {
        alert("ERROR: " + er);
    }
}

function ddlDocumento_Click(domElem, numdoc, filterdoc) {
    if (domElem != undefined) {
        var doc = $('#' + numdoc).get(0);
        switch (domElem.value) {
            case "": doc.maxLength = 0; doc.value = ""; break;
            case "14": doc.maxLength = 8; doc.value = ""; if (filterdoc != undefined) $find(filterdoc).set_FilterType(2); break;
            default: doc.maxLength = 15; doc.value = ""; if (filterdoc != undefined) $find(filterdoc).set_FilterType(14); break;
        }
    }
}

function gridView_MouseOver(o) {/*o.className = "bg_gv_over";*/}
function gridView_MouseOut(o) { /*o.className = "bg_f6f7f9";*/ }

function FP_SoloLetrasNumerosYCaracteresComunes(e) {
    var target = (e.target ? e.target : e.srcElement);
    var key = (e ? e.keyCode || e.which : window.event.keyCode);
    return (key <= 12 || (key >= 48 && key <= 57) || (key >= 65 && key <= 90) || (key >= 97 && key <= 122) || (key == 32) || (key >= 164 && key <= 165) || (key == 241) || (key == 209) ||
	                (key == 44) || (key == 45) || (key == 46) || (key == 37) || (key == 225) || (key == 233) || (key == 237) || (key == 243) || (key == 250) || (key == 252) || (key == 193) ||
	                (key == 201) || (key == 205) || (key == 211) || (key == 218) || (key == 220) || (key == 64) || (key == 58) || (key == 59) || (key == 13) || (key == 36) || (key == 47) ||
	                (key == 40) || (key == 41) || (key == 63) || (key == 191));
}

function FP_SoloNumerosYPuntoSinEspacio(e) {
    var target = (e.target ? e.target : e.srcElement);
    var key = (e ? e.keyCode || e.which : window.event.keyCode);
    return (key <= 12 || (key >= 48 && key <= 57 || key == 46));
}

/*JIFF*/
function mostrarObjecto(id) {
    if ($.browser.msie) {
        if ($.browser.version == 6) {
            $('select').each(function (index) {
                $(this).hide();
            });
        }
    }
    $('#' + id).css({ visibility: "visible", display: "block" });
}
function ocultarObjecto(id) {
    if ($.browser.msie) {
        if ($.browser.version == 6) {
            $('select').each(function (index) {
                $(this).show();
            });
        }
    }
    $('#' + id).css({ visibility: "hidden", display: "none" });
}
/*JIFF*/

/*dtavaraa*/
var dtCh = "/";
var minYear = 1900;
var maxYear = 2100;

function isInteger(s) {
    var i;
    for (i = 0; i < s.length; i++) {
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag) {
    var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++) {
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary(year) {
    // February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28);
}
function DaysArray(n) {
    for (var i = 1; i <= n; i++) {
        this[i] = 31
        if (i == 4 || i == 6 || i == 9 || i == 11) { this[i] = 30 }
        if (i == 2) { this[i] = 29 }
    }
    return this
}

function isDateFecIni(dtStr) {
    var daysInMonth = DaysArray(12)
    var pos1 = dtStr.indexOf(dtCh)
    var pos2 = dtStr.indexOf(dtCh, pos1 + 1)
    var strDay = dtStr.substring(0, pos1)
    var strMonth = dtStr.substring(pos1 + 1, pos2)
    var strYear = dtStr.substring(pos2 + 1)
    strYr = strYear
    if (strDay.charAt(0) == "0" && strDay.length > 1) strDay = strDay.substring(1)
    if (strMonth.charAt(0) == "0" && strMonth.length > 1) strMonth = strMonth.substring(1)
    for (var i = 1; i <= 3; i++) {
        if (strYr.charAt(0) == "0" && strYr.length > 1) strYr = strYr.substring(1)
    }
    month = parseInt(strMonth)
    day = parseInt(strDay)
    year = parseInt(strYr)
    if (pos1 == -1 || pos2 == -1) {
        alert("El formato de Fecha debe ser : dd/mm/yyyy en Fecha Inicio")
        return false
    }
    if (strDay.length < 1 || day < 1 || day > 31 || (month == 2 && day > daysInFebruary(year)) || day > daysInMonth[month]) {
        alert("Por favor ingrese un día válido en Fecha Inicio")
        return false
    }
    if (strMonth.length < 1 || month < 1 || month > 12) {
        alert("Por favor ingrese un mes válido en Fecha Inicio")
        return false
    }
    if (strYear.length != 4 || year == 0 || year < minYear || year > maxYear) {
        alert("Por favor ingrese un año válido entre " + minYear + " y " + maxYear + " en Fecha Inicio")
        return false
    }
    if (dtStr.indexOf(dtCh, pos2 + 1) != -1 || isInteger(stripCharsInBag(dtStr, dtCh)) == false) {
        alert("Por favor ingrese una fecha válida en Fecha Inicio")
        return false
    }
    return true
}

function isDateFecFin(dtStr) {
    var daysInMonth = DaysArray(12)
    var pos1 = dtStr.indexOf(dtCh)
    var pos2 = dtStr.indexOf(dtCh, pos1 + 1)
    var strDay = dtStr.substring(0, pos1)
    var strMonth = dtStr.substring(pos1 + 1, pos2)
    var strYear = dtStr.substring(pos2 + 1)
    strYr = strYear
    if (strDay.charAt(0) == "0" && strDay.length > 1) strDay = strDay.substring(1)
    if (strMonth.charAt(0) == "0" && strMonth.length > 1) strMonth = strMonth.substring(1)
    for (var i = 1; i <= 3; i++) {
        if (strYr.charAt(0) == "0" && strYr.length > 1) strYr = strYr.substring(1)
    }
    month = parseInt(strMonth)
    day = parseInt(strDay)
    year = parseInt(strYr)
    if (pos1 == -1 || pos2 == -1) {
        alert("El formato de Fecha debe ser : dd/mm/yyyy  en Fecha Fin")
        return false
    }
    if (strDay.length < 1 || day < 1 || day > 31 || (month == 2 && day > daysInFebruary(year)) || day > daysInMonth[month]) {
        alert("Por favor ingrese un día válido en Fecha Fin")
        return false
    }
    if (strMonth.length < 1 || month < 1 || month > 12) {
        alert("Por favor ingrese un mes válido en Fecha Fin")
        return false
    }
    if (strYear.length != 4 || year == 0 || year < minYear || year > maxYear) {
        alert("Por favor ingrese un año válido entre " + minYear + " y " + maxYear + "  en Fecha Fin")
        return false
    }
    if (dtStr.indexOf(dtCh, pos2 + 1) != -1 || isInteger(stripCharsInBag(dtStr, dtCh)) == false) {
        alert("Por favor ingrese una fecha válida en Fecha Fin")
        return false
    }
    return true
}
/*dtavaraa*/

/*INI - P0058 - ListaNegra - SRT*/
String.prototype.format = function () {
    var txt = this;
    for (var i = 0; i < arguments.length; i++) {
        var exp = new RegExp('\\{' + (i) + '\\}', 'gm');
        txt = txt.replace(exp, arguments[i]);
    }
    return txt;
}
/*FIN - P0058 - ListaNegra - SRT*/