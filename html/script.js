window.addEventListener('message', function (event) {
    var msgaction = event.data.action;
    var msg = event.data;
    switch (msgaction) {
        case 'notification':
            showNotification(msg.icon, msg.title, msg.info, msg.desc, msg.show);
        break;
    }
});

function showNotification(icon, title, info, desc, show) {
    if (show === true) {
        document.getElementById('icon').innerHTML = icon;
        document.getElementById('title').innerHTML = title;
        document.getElementById('info').innerHTML = info;
        document.getElementById('desc').innerHTML = desc;
        $('.box').fadeIn(300)
    } else if (show === false) {
        $('.box').fadeOut(300)
    }
}