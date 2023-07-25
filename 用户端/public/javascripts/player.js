var n = 5;
var rotateVal = 0;
var InterVal;
var musicImgs = $('.music-imgs');
var word = $('.word');
var pub = $('.pub');
var in_area = $('.in');
var in_ok = $('.in .button1');
var in_can = $('.in .button2');
var in_textarea = $('.in textarea');
var wordArr = new Array();//歌词存入
var ul = $('.content .word');
var fraction = 0.5;
var lineNo = 0;

// 图片旋转
function rotate() {
    InterVal = setInterval(function () {
        var img = document.getElementById('img')
        rotateVal += 1;
        img.style.transform = 'rotate(' + rotateVal + 'deg)';
        img.style.transition = '0.1s linear';
    }, 100);
};

musicImgs.click(function () {
    musicImgs.hide();
    word.show();
})

word.click(function () {
    word.hide();
    musicImgs.show();
})

function songPlay(num) {
    var id = num;
    var con = 0;
    if (id == localStorage.getItem('nowId'))
        con = 1;
    let data = { mu_id: id, user_name: localStorage.getItem('user_name') };
    $.ajax({
        url: '../users/playId',
        data,
        type: 'get',
        success({ message, status, data }) {
            $('.title .name').text(data.mu_name);
            $('.title .singer').text(data.singer);
            audio.src = data.url;
            $('.content .music-imgs .img').css({
                'background': 'url(' + '..' + data.img_url + ') no-repeat',
                'background-size': '100% 100%'
            });
            $('.content .background').css({
                'background': 'url(' + '..' + data.img_url + ') no-repeat',
                'background-size': '100% 100%'
            });

            //音量
            let now_volume = localStorage.getItem('volume');
            console.log(now_volume);
            if (now_volume != null) {
                audio.volume = now_volume;
                adjust_cover.width(70 * now_volume);
            }
            // $('.content .word').text(data.word)
            //歌词处理
            let word = data.word.split('\n');
            $.each(word, function (i, item) {
                var t = item.substring(item.indexOf("[") + 1, item.indexOf("]"));
                if (item.substring(item.indexOf("]") + 1, item.length) != '' && item.substring(item.indexOf("]") + 1, item.length) != '\r') {
                    wordArr.push({
                        t: (t.split(":")[0] * 60 + parseFloat(t.split(":")[1])).toFixed(3),
                        c: item.substring(item.indexOf("]") + 1, item.length)
                    });
                }
            });

            let add = '';
            $.each(wordArr, function (i, item) {
                add += "<li>" + item.c + "</li>";
            });
            ul.append(add);
            console.log(wordArr);

            if (data.user_name != null)
                $('.player .button .love').attr('src', './images/heart-fill.png');
            else
                $('.player .button .love').attr('src', './images/heart.png');

            if (con == 1)
                audio.currentTime = localStorage.getItem('muTime');

            resetLocal();

            if (pop)
                clearInterval(InterVal);
            rotateVal = 0;
            popbtn.addClass('change');
            rotate();
            audio.play();
            pop = 1;

            nowId = id;
            continuePlay();

            ul.find("li").removeClass("lineheight");
            if (audio.currentTime.toFixed(3) > parseFloat(wordArr[lineNo + 1].t)) {//快进
                while (lineNo < (wordArr.length - 1) && audio.currentTime.toFixed(3) > parseFloat(wordArr[lineNo + 1].t)) {
                    lineNo++;
                }
            }
            else if (lineNo > 0 && audio.currentTime.toFixed(3) < parseFloat(wordArr[lineNo - 1].t)) {//倒退
                while (lineNo > 0 && audio.currentTime.toFixed(3) < parseFloat(wordArr[lineNo - 1].t)) {
                    lineNo--;
                }
            }
            console.log("lineno", lineNo);
            lineHeight(lineNo);
        }
    });
    comment_load();
}

//歌词高亮
function lineHeight(lineno) {
    var $ul = document.querySelector('.content .word');
    // 令正在唱的那一行高亮显示
    if (lineno > 0) {
        $(ul.find("li").get(lineno - 1)).removeClass("lineheight");
    }
    var nowline = ul.find("li").get(lineno);
    $(nowline).addClass("lineheight");

    // 实现文字滚动
    var _scrollTop;
    $ul.scrollTop = 0;
    // console.log($ul.clientHeight * fraction, nowline.offsetTop);
    if ($ul.clientHeight * fraction > (nowline.offsetTop + 65)) {
        _scrollTop = 0;
    } else if ((nowline.offsetTop + 65) > ($ul.scrollHeight - $ul.clientHeight * (1 - fraction))) {
        _scrollTop = $ul.scrollHeight - $ul.clientHeight + 65;
    } else {
        _scrollTop = nowline.offsetTop - $ul.clientHeight * fraction + 65;
    }
    $ul.scrollTop = _scrollTop;

}

//歌词滚动监听
audio.ontimeupdate = function () {
    // console.log(lineNo, parseFloat(wordArr[lineNo].t));
    if (lineNo == wordArr.length - 1 && audio.currentTime.toFixed(3) >= parseFloat(wordArr[lineNo].t)) {
        lineHeight(lineNo);
    }
    if (parseFloat(wordArr[lineNo].t) <= audio.currentTime.toFixed(3) &&
        audio.currentTime.toFixed(3) <= parseFloat(wordArr[lineNo + 1].t)) {
        lineHeight(lineNo);
        lineNo++;
    }
};

function ply_clickP() {
    if (!pop) {
        pop = 1;
        rotate();
        popbtn.addClass('change');
        audio.play();
    }

    ul.find("li").removeClass("lineheight");
    if (audio.currentTime.toFixed(3) < nowT)//快进
        while (lineNo < (wordArr.length - 1) && parseFloat(wordArr[lineNo + 1].t) < nowT) {
            lineNo++;
        }
    else if (audio.currentTime.toFixed(3) > nowT)//倒退
        while (lineNo > 0 && parseFloat(wordArr[lineNo - 1].t) > nowT) {
            lineNo--;
        }

    audio.currentTime = nowT; // 设置音频播放时间 为当前鼠标点击的位置时间
    cover.width(mouse);

    // console.log( parseFloat(wordArr[lineNo].t) , audio.currentTime.toFixed(3));
    lineHeight(lineNo);
}

//评论加载
function comment_load() {
    let id = nowId;
    let data = { user_name: localStorage.getItem('user_name'), mu_id: id };
    $.ajax({
        url: '../users/comment_load',
        data,
        type: 'get',
        success({ message, status, data }) {
            var add = '';
            data.forEach(item => {
                if (item.flag != null) {
                    add += '<div class="line"> <span class="comm_id">' + item.com_id +
                        '</span> <h1 class="name">' + item.user_name +
                        '</h1><p>' + item.content +
                        '</p><div class="date">' + item.time + '</div><div class="like"><div class="lik2">' +
                        '</div><div class="num">' + item.love + '</div></div></div>'
                }
                else {
                    add += '<div class="line"> <span class="comm_id">' + item.com_id +
                        '</span> <h1 class="name">' + item.user_name +
                        '</h1><p>' + item.content +
                        '</p><div class="date">' + item.time + '</div><div class="like"><div class="lik1">' +
                        '</div><div class="num">' + item.love + '</div></div></div>'
                }
            });
            $('.comment .li').empty();
            $('.comment .li').append(add);
        }
    });
}

//评论点赞
$('.comment .li').on('click', '.lik1', (e) => {
    var p = e.currentTarget;
    var id = p.parentElement.parentElement.firstElementChild.innerHTML;
    $(p).addClass('lik2');
    $(p).removeClass('lik1');
    let num = parseInt($(p).next().text()) + 1;
    $(p).next().text(num);

    let data = { user_name: localStorage.getItem('user_name'), com_id: id };
    $.ajax({
        url: '../users/comment_add_like',
        type: 'get',
        data,
        success({ message, status, data }) { }
    })
});

//取消点赞
$('.comment .li').on('click', '.lik2', (e) => {
    var p = e.currentTarget;
    var id = p.parentElement.parentElement.firstElementChild.innerHTML;
    $(p).addClass('lik1');
    $(p).removeClass('lik2');
    let num = parseInt($(p).next().text()) - 1;
    $(p).next().text(num);

    let data = { user_name: localStorage.getItem('user_name'), com_id: id };
    $.ajax({
        url: '../users/comment_del_like',
        type: 'get',
        data,
        success({ message, status, data }) { }
    })
});

function popPlay() {
    pop = (pop + 1) % 2;
    if (pop) {
        rotate();
        popbtn.addClass('change');
        audio.play();
    }
    else {
        clearInterval(InterVal);
        popbtn.removeClass('change');
        audio.pause();
    }
    continuePlay();
}

function count() {
    $.ajax({
        url: '../users/count',
        type: 'get',
        success({ message, status, data }) {
            totalMusic = data;//总数获取
        }
    });
}

function next() {
    resetLocal();

    let arr = localStorage.getItem('playing').split(',');
    if (arr == '')
        arr = [nowId];
    let len = arr.length, p = 0;
    while (arr[p] != nowId && p < len)
        p++;

    let cir = localStorage.getItem('circulate');
    if (cir == 1)//列表播放
        p = (p + 1) % len;
    else if (cir == 2)//随机播放
        p = Math.floor(Math.random() * len);

    nowId = arr[p];

    songPlay(nowId);

}

function last() {
    resetLocal();

    let arr = localStorage.getItem('playing').split(',');
    if (arr == '')
        arr = [nowId];
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

    songPlay(nowId);
}

//返回上一页面
function down() {
    continuePlay();
    window.location = document.referrer;
}

//播放完毕下一首
audio.addEventListener('ended', function () {
    next();
})

//滚动到评论 显示
window.addEventListener('scroll', function () {
    var np = $(this).scrollTop();//当前位置
    var tp = 170;//目标位置
    if (np > tp)
        pub.fadeIn(500);
    else {
        pub.fadeOut(160);
        in_area.fadeOut(250);
    }
});
//发布评论
pub.on('click', function () {
    in_area.show();
})

in_ok.on('click', function () {
    let comm_txt = in_textarea.val();
    let user_name = $('.top .user span').text();
    let d = new Date();
    let y = d.getFullYear(), m = d.getMonth() + 1, dd = d.getDate();
    let date = y + "." + m + "." + dd;
    let comment_data = {
        com_id: 0,
        mu_id: nowId,
        user_name,
        content: comm_txt,
        time: date,
        love: 0
    };
    var content = '<div class="line"> <span class="comm_id">' + 0 + '</span> <h1 class="name">' + user_name + '</h1><p>' + comm_txt +
        '</p><div class="date">' + date + '</div><div class="like"><div class="lik1">' +
        '</div><div class="num"> 0</div></div></div>'
    $('.comment').append(content);
    in_textarea.val('');
    in_area.hide();

    $.ajax({
        url: '../users/comment_add',
        data: comment_data,
        type: 'get'
    });
})
in_can.on('click', function () {
    in_textarea.val('');
    in_area.hide();
})

function init() {
    var loc = location.href;//获取整个跳转地址内容
    var n1 = loc.length;//地址的总长
    var n2 = loc.indexOf("?");
    var parameter = decodeURI(loc.substr(n2 + 1, n1 - n2));
    var parameters = parameter.split("&");//从&处拆分，返回字符串数组
    var m1 = parameters[0].length;//获得每个键值对的长度
    var m2 = parameters[0].indexOf("=");//获得每个键值对=号的位置
    var value = parameters[0].substr(m2 + 1, m1 - m2);//获取每个键值对=号后面具体的值
    nowId = value;

    songPlay(nowId);

    let now_volume = localStorage.getItem('volume');
    if (now_volume != null) {
        audio.volume = now_volume;
        adjust_cover.width(70 * now_volume);
    }
}

nextbtn.on('click', next);
lastbtn.on('click', last);
popbtn.on('click', popPlay);
$('.down').on('click', down);
progress.on('click', ply_clickP);

init();