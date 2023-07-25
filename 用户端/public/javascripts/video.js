let mv_name = $('.title .name');
let mv_singer = $('.title .singer');
let mv_video = $('.player video');

//返回上一页面
function down() {
    window.location = document.referrer;
}

function init() {
    var loc = location.href;//获取整个跳转地址内容
    var n1 = loc.length;//地址的总长
    var n2 = loc.indexOf("?");
    var parameter = decodeURI(loc.substr(n2 + 1, n1 - n2));
    var parameters = parameter.split("&");//从&处拆分，返回字符串数组
    var m1 = parameters[0].length;//获得每个键值对的长度
    var m2 = parameters[0].indexOf("=");//获得每个键值对=号的位置
    var value = parameters[0].substr(m2 + 1, m1 - m2);//获取每个键值对=号后面具体的值

    $.ajax({
        url: '../users/load_mv',
        type: 'get',
        data: { mu_id: value },
        success({ message, status, data }) {
            mv_name.text(data.title);
            mv_singer.text(data.singer);
            document.getElementById("video").src = '.' + data.url;
            document.getElementById("video").load();
        }
    })
}

init();
$('.down').on('click', down);