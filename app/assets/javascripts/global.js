document.addEventListener("turbolinks:load", function() {

    var notification = document.querySelector('#notice');

    if(notification) {
        window.setTimeout(function() {
            notification.style.display ="none";
        }, 3000);
    }

});