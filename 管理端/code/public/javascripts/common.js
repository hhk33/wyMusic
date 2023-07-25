var nowId = 8; //当前播放
var totalMusic = 3; //歌曲总数
var pop = 1, r = 0;
var soundNum = 0;//当前音量
var circulateNum = 0;//循环状态
var input = '';//搜索输入
var popbtn = $('.pop');
var lastbtn = $('.last');
var nextbtn = $('.next');//已播放时间
var startT = $('.startT');//音乐总时间
var endT = $('.endT');
var love = $('.love');
var sound = $('.sound');
var circulate = $('.circulate');
var search_input = $('.top .search input');
var audio = new Audio();
var user_name = $('.top .user span');
var progress = $('.progress');
//注册页
var top_user = $('.top .user');
var user_login = $('.user_login');
var login_exit = $('.user_login img');
var land = $('.user_login .land');
var land_button = $('.user_login .land .button');
var land_infor = $('.user_login .land .infor');
var logon = $('.user_login .login');
var log = $('.user_login .land .log');
var login_button = $('.user_login .login .button');
var login_infor = $('.user_login .login .infor');
var login_pw1 = $('.login .input_password1');
var login_pw2 = $('.login .input_password2');
var bk_cover = $('.bk_cover');
//播放列表
var playing_list = [];


//禁止滚动条滚动
function unScroll() {
    var top = $(document).scrollTop();
    bk_cover.show();
    $(document).on('scroll.unable', function (e) {
        $(document).scrollTop(top);
    })
}

//移除禁止滚动条滚动
function removeUnScroll() {
    bk_cover.hide();
    $(document).unbind("scroll.unable");
}

// 鼠标悬停进度条
var bk = $('.bk');
var cover = $('.cover');
var time = $('.time');
var mouse, nowT, nowM, nowS;
function hover(event) {
    mouse = event.clientX;
    nowT = audio.duration * (mouse / bk.outerWidth());
    nowM = Math.floor(nowT / 60);
    nowS = Math.floor(nowT - nowM * 60);
    if (nowM < 10)
        nowM = '0' + nowM;
    if (nowS < 10)
        nowS = '0' + nowS;
    time.text(nowM + ':' + nowS);
    time.css({ 'left': mouse, 'margin-left': '-20px' });

    var totalM = Math.floor(audio.duration / 60);
    var totalS = Math.floor(audio.duration - totalM * 60);
    if (totalM < 10)
        totalM = '0' + totalM;
    if (totalS < 10)
        totalS = '0' + totalS;
    endT.text(totalM + ':' + totalS);

    time.show();
    startT.show();
    endT.show();
}

// 鼠标离开进度条
function left() {
    time.hide();
    startT.hide();
    endT.hide();
}

// 鼠标点击进度条
function clickP() {
    if (!pop) {
        pop = 1;
        rotate();
        popbtn.addClass('change');
        audio.play();
    }
    audio.currentTime = nowT; // 设置音频播放时间 为当前鼠标点击的位置时间
    cover.width(mouse);
}

//进度条
function move() {
    var M = Math.floor(audio.currentTime / 60);
    var S = Math.floor(audio.currentTime - M * 60);
    if (M < 10)
        M = '0' + M;
    if (S < 10)
        S = '0' + S;
    startT.text(M + ':' + S);

    var coverP = (audio.currentTime / audio.duration) * 100;
    cover.width(coverP + '%');
}

function m_pop() {
    pop = (pop + 1) % 2;
    if (pop) {
        popbtn.addClass('change');
        audio.play();
    }
    else {
        popbtn.removeClass('change');
        audio.pause();
    }
    continuePlay();
}

//单播放音乐
function m_playId(id, flag) {
    var con = 0;//继续播放
    if (localStorage.getItem('nowId') != null && id == null) {
        id = localStorage.getItem('nowId');
        flag = localStorage.getItem('play');
        con = 1;
    }
    else if (localStorage.getItem('nowId') == null && id == null) {
        id = 8;
        flag = 0;
    }
    nowId = id;
    pop = flag;
    let data = { mu_id: id, user_name: localStorage.getItem('user_name') };
    $.ajax({
        url: '../users/playId',
        data,
        type: 'get',
        success({ message, status, data }) {
            $('.player .box .name').text(data.mu_name);
            $('.player .box .singer').text(data.singer);
            $('.player .box .img').css({
                'background': 'url(' + '..' + data.img_url + ') no-repeat',
                'background-size': '100% 100%'
            });

            if (data.user_name != null)
                $('.player .button .love').attr('src', './images/heart-fill.png');
            else
                $('.player .button .love').attr('src', './images/heart.png');

            nowId = data.mu_id;
            audio.src = data.url;
            audio.load();
            audio.currentTime = 0;
            if (con == 1)
                audio.currentTime = localStorage.getItem('muTime');

            resetLocal();

            if (flag == 1) {
                audio.play();
                popbtn.addClass('change');
                pop = 1;
            }

            // continuePlay();
        }
    });
}

//player歌曲收藏
$('.player .button .love').on('click', function (e) {
    let data = { user_name: localStorage.getItem('user_name'), mu_id: nowId };
    if ($('.player .button .love')[0].src == 'http://localhost:3000/images/heart.png') {
        $('.player .button .love').attr('src', './images/heart-fill.png');
        $.ajax({
            url: '../users/add_favorite_song',
            type: 'get',
            data,
            success({ message, status, data }) { }
        })
    }
    else {
        $('.player .button .love').attr('src', './images/heart.png');
        $.ajax({
            url: '../users/del_favorite_song',
            type: 'get',
            data,
            success({ message, status, data }) { }
        })
    }
})

//palyer circulate
$('.player .button .circulate').on('click', function () {
    // console.log($('.player .button .circulate')[0].src);
    if ($('.player .button .circulate')[0].src == 'http://localhost:3000/images/circulate1.png') {
        $('.player .button .circulate').attr('src', './images/circulate2.png');
        localStorage.setItem('circulate', 2);
    }
    else if ($('.player .button .circulate')[0].src == 'http://localhost:3000/images/circulate2.png') {
        $('.player .button .circulate').attr('src', './images/circulate3.png');
        localStorage.setItem('circulate', 3);
    }
    else {
        $('.player .button .circulate').attr('src', './images/circulate1.png');
        localStorage.setItem('circulate', 1);
    }
})

//单击图片跳转
$('.player .box .img').on('click', function () {
    play(nowId);
})

//下一首
function m_next() {
    let arr = localStorage.getItem('playing').split(',');
    let len = arr.length, p = 0;
    while (arr[p] != nowId && p < len)
        p++;

    let cir = localStorage.getItem('circulate');
    if (cir == 1)//列表播放
        p = (p + 1) % len;
    else if (cir == 2)//随机播放
        p = Math.floor(Math.random() * len);

    nowId = arr[p];
    m_playId(nowId, 1);
}
//上一首
function m_last() {
    let arr = localStorage.getItem('playing').split(',');
    let len = arr.length, p = 0;
    while (arr[p] != nowId && p < len)
        p++;

    let cir = localStorage.getItem('circulate');
    if (cir == 1) {//列表播放
        p--;
        if (p < 0)
            p = len - 1;
    }
    else if (cir == 2)//随机播放
        p = Math.floor(Math.random() * len);

    nowId = arr[p];
    m_playId(nowId, 1);
}

audio.addEventListener('ended', function () {
    m_next();
})

function end() {
    popbtn.removeClass('change');
    pop = 0;
}

function play(loc) {
    continuePlay();
    window.location.href = '/player.html?id=' + loc;
}

//搜索事件
search_input.on('focus blur', function () {
    search_input.on('keypress', function (event) {
        if (event.keyCode == 13) {
            input = search_input.val();
            continuePlay();
            window.location.href = '/search.html?search=' + input;
        }
    });
});

$('.search span').on('click', function () {
    input = $('input').val();
    continuePlay();
    window.location.href = '/search.html?search=' + input;
})

//返回上一级网页
function m_down() {
    continuePlay();
    window.location.href = '/index.html';
}

//mv跳转
$('.result').on('click', '.line .mv', (e) => {
    var p = e.currentTarget;
    var id = p.parentElement.lastElementChild.innerHTML;
    window.location.href = '/video.html?id=' + id;
})

//点击歌曲
$('.result').on('dblclick', '.line .pl', (e) => {//双击打开player
    var p = e.currentTarget;

    //加载播放列表
    playing_list.splice(0, playing_list.length);//清空数组
    let parent = p.parentElement.parentElement;
    let first_child = parent.firstElementChild;
    let last_child = parent.lastElementChild;
    while (first_child != last_child) {
        if (first_child.nodeType == 1)
            playing_list.push($(first_child.lastElementChild).text());
        first_child = first_child.nextSibling;
    }
    playing_list.push(first_child.lastElementChild.innerHTML);
    localStorage.setItem('playing', playing_list);

    play(p.parentElement.lastElementChild.innerHTML);
});

$('.result').on('click', '.line .pl', (e) => {//单击直接播放
    var p = e.currentTarget;

    playing_list.splice(0, playing_list.length);//清空数组
    let parent = p.parentElement.parentElement;
    let first_child = parent.firstElementChild;
    let last_child = parent.lastElementChild;
    while (first_child != last_child) {
        if (first_child.nodeType == 1)
            playing_list.push($(first_child.lastElementChild).text());
        first_child = first_child.nextSibling;
    }
    playing_list.push(first_child.lastElementChild.innerHTML);
    // console.log(playing_list);
    localStorage.setItem('playing', playing_list);

    m_playId(p.parentElement.lastElementChild.innerHTML, 1);
});

//增加喜欢的音乐
$('.result').on('click', '.line .love', (e) => {
    var p = e.currentTarget;
    var id = p.parentElement.lastElementChild.innerHTML;
    $(p).addClass('love2');
    $(p).removeClass('love');

    let data = { user_name: localStorage.getItem('user_name'), mu_id: id };
    $.ajax({
        url: '../users/add_favorite_song',
        type: 'get',
        data,
        success({ message, status, data }) { }
    })
});

//取消喜欢的音乐
$('.result').on('click', '.line .love2', (e) => {
    var p = e.currentTarget;
    var id = p.parentElement.lastElementChild.innerHTML;
    $(p).addClass('love');
    $(p).removeClass('love2');

    let data = { user_name: localStorage.getItem('user_name'), mu_id: id };
    $.ajax({
        url: '../users/del_favorite_song',
        type: 'get',
        data,
        success({ message, status, data }) { }
    })
});

//音乐进行播放（浏览器本地储存）
function continuePlay() {
    localStorage.setItem('nowId', nowId);
    localStorage.setItem('muTime', audio.currentTime);
    if (audio.played)
        localStorage.setItem('play', 1);
    else
        localStorage.setItem('play', 0);
}

$('.logo').on('click', function () {
    continuePlay();
    window.location.href = '/index.html';
})

//重置本地存储
function resetLocal() {
    localStorage.setItem('nowId', nowId);
    localStorage.setItem('play', 0);
    localStorage.setItem('muTime', 0);
}

if (localStorage.getItem('user_name') != null)
    user_name.text(localStorage.getItem('user_name'));

if (localStorage.getItem('circulate') != null) {
    let i = localStorage.getItem('circulate');
    $('.player .button .circulate').attr('src', './images/circulate' + i + '.png');
}

progress.mousemove(function (event) { hover(event); });
progress.mouseout(left);
progress.on('click', clickP);
$(audio).on('timeupdate', move);
// $(audio).on('ended', end);
