var elem = document.getElementById("caja_venta");
var icon = document.getElementById("fullscreen_icon");
var button_s = document.getElementById("fullscreen_button");

function openFullscreen() {
    if (elem.requestFullscreen) {
        elem.requestFullscreen();
    } else if (elem.webkitRequestFullscreen) { /* Safari */
        elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) { /* IE11 */
        elem.msRequestFullscreen();
    }
}
function exitFullscreen(){
    if (elem.exitFullscreen) {
        elem.exitFullscreen();
    } else if (elem.webkitexitFullscreen) { /* Safari */
        elem.webkitexitFullscreen();
    } else if (elem.msexitFullscreen) { /* IE11 */
        elem.msexitFullscreen();
    }
}

function ChangeIcon(){
    if(icon.className == "bi bi-fullscreen"){
        icon.className = "bi bi-fullscreen-exit";
    }
    else{
        icon.className = "bi bi-fullscreen";
    }
};