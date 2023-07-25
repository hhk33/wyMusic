var list = $('.list');
var con_button = $('.list .button');
var exit = $('.list img');
var check = $('.list .line input')
var list_result = $('.list .list_result');
var love_button = $('.result .line .love');
let choose_song;

function c_search(input) {
    $.ajax({
        url: '../users/search',
        data: { input, user_name: localStorage.getItem('user_name') },
        type: 'get',
        success({ message, status, data }) {
            var add = '';
            data.forEach(item => {
                if (item.user_name != null) {
                    add += ' <div class="line">' +
                    '<div class="pl"></div>' +
                    '<div class="play"></div>' +
                    '<div class="img" style="background-image: url(.' + item.img_url + ') ;"></div>' +
                    '<span class="name">' + item.mu_name + '</span>' +
                    '<span class="singer">' + item.singer + '</span>' +
                    '<div class="love2"></div>' +
                    '<div class="add_list"></div>' +
                    '<div class="mv"></div>' +
                    '<div class="more"></div>' +
                    '<div class="id">' + item.mu_id + '</div>' +
                    '</div>';
                }
                else {
                    add += ' <div class="line">' +
                    '<div class="pl"></div>' +
                    '<div class="play"></div>' +
                    '<div class="img" style="background-image: url(.' + item.img_url + ') ;"></div>' +
                    '<span class="name">' + item.mu_name + '</span>' +
                    '<span class="singer">' + item.singer + '</span>' +
                    '<div class="love"></div>' +
                    '<div class="add_list"></div>' +
                    '<div class="mv"></div>' +
                    '<div class="more"></div>' +
                    '<div class="id">' + item.mu_id + '</div>' +
                    '</div>';
                }
            });
            $('.result').empty();
            $('.result').append(add);
        }
    });
}

$('.result').on('click', '.line .add_list', (e) => {
    if (localStorage.getItem('user_name') != null) {
        unScroll();
        list.show();
        var p = e.currentTarget;
        choose_song = p.parentElement.lastElementChild.innerHTML;
        let data = { name: localStorage.getItem('user_name') }
        $.ajax({
            url: '../users/show_list',
            type: 'get',
            data,
            success({ message, status, data }) {
                var add = '';
                data.forEach(item => {
                    add += '<div class="line">' +
                        '<input type="checkbox" name="checkbox" value="' + item.list_name + '">' +
                        '<span>' + item.list_name + '</span>' +
                        '</div>';
                })
                $('.list .list_result').empty();
                $('.list .list_result').append(add);
            }
        })
    }
})

exit.on('click', function () {
    removeUnScroll();
    check.checked = false;
    list.hide();
})

//获得check信息，导入歌单
con_button.on('click', function () {
    $('input[name="checkbox"]:checked').each(function () {
        let data = {
            list_name: $(this).val(),
            user_name: localStorage.getItem('user_name'),
            mu_id: choose_song
        };
        $.ajax({
            url: '../users/song_collect_list',
            type: 'get',
            data,
            success({ message, status, data }) { }
        })
    })
    removeUnScroll();
    check.checked = false;
    list.hide();
})

function init() {
    var value = '';
    var loc = location.href;//获取整个跳转地址内容
    var n1 = loc.length;//地址的总长
    var n2 = loc.indexOf("?");
    var parameter = decodeURI(loc.substr(n2 + 1, n1 - n2));
    var parameters = parameter.split("&");//从&处拆分，返回字符串数组
    var m1 = parameters[0].length;//获得每个键值对的长度
    var m2 = parameters[0].indexOf("=");//获得每个键值对=号的位置
    value = parameters[0].substr(m2 + 1, m1 - m2);//获取每个键值对=号后面具体的值


    c_search(value);
    m_playId(null, 1);
}

nextbtn.on('click', m_next);
lastbtn.on('click', m_last);
popbtn.on('click', m_pop);
$('.down').on('click', m_down);

init();


