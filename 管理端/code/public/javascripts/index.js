window.onload = function () {
    var banner = document.querySelector(".banner");
    var left_button = $('.banner .left');
    var right_button = $('.banner .right');
    var little = $('.banner .little');
    var li_music = $('.content .new_music li');
    var li_list = $('.content .rec_list li');
    var li_mv = $('.content .rec_mv li');
    var timer = setInterval(banner_next, 3000);
    const banner_num = 3;//轮播图数量
    var main = $('.menu .main');
    var mian_window = $('.main_window');
    var list = $('.list');
    var love_list = $('.menu .sl .love');
    var more = $('.menu .more');
    var build = $('.menu .more .build');
    var build_button = $('.menu .more .build .button')
    var list_title = $('.list .title h1');//歌单标签
    var author = $('.list .title .auther span');//歌单作者

    //登录页
    top_user.click(function () {
        if (localStorage.getItem('user_name') == null) {
            unScroll();
            user_login.css('display', 'flex');
        }
    })

    //个人信息，退出登录等
    top_user.hover(function () {
        if (localStorage.getItem('user_name') != null) {//in
            user_name.css('color', '#bf2d2d');
            $('.top .user .line').show();
            $('.top .user .img').css('background-color', '#fff');
        }
    }, function () {
        if (localStorage.getItem('user_name') != null) {
            user_name.css('color', '#fff');//out
            $('.top .user .line').hide();
            $('.top .user .img').css('background-color', '#4f4f4f');
        }
    })

    //退出登录
    $('.top .user .line .exit').on('click', function () {
        $('.menu .sl .line').empty();
        user_name.text("未登录");
        user_name.css('color', '#fff');
        $('.top .user .line').hide();
        $('.top .user .img').css('background-color', '#4f4f4f');
        localStorage.removeItem('user_name');
    })

    login_exit.click(function () {
        user_login.css('display', 'none');
        removeUnScroll();
        land.show();
        land_infor.hide();
        logon.hide();
    })

    log.click(function () {
        land.hide();
        logon.show();
    })

    //新建歌单
    more.on('click', function (e) {
        more.css('background-color', '#e3e3e3');
        build.show();
        e.stopPropagation();
        $('body').on('click', function () {
            more.css('background-color', '#fff');
            $('.menu .more .build input').val('');
            $('.menu .more .build span').text('');
            build.hide();
        })
    })

    build_button.on('click', function () {
        let list_name = $('.menu .more .build input').val();
        let str = '<div class="song_list">' +
            '<div class="col">' +
            '<div class="li">' +
            '<img src="./images/歌单.png" alt="">' + list_name +
            '</div>' +
            '<img src="./images/more.png" class="list_more">' +
            ' </div>' +
            '<div class="ability">' +
            '<div class="1">' +
            '<img src="./images/编辑.png">' +
            '<span>编辑信息</span>' +
            '</div>' +
            '<div class="1">' +
            '<img src="./images/分享.png" >' +
            '<span>分享</span>' +
            '</div>' +
            '<div class="list_del">' +
            '<img src="./images/删除.png">' +
            '<span>删除歌单</span>' +
            '</div>' +
            '</div>' +
            '</div>';

        let data = { user_name: localStorage.getItem('user_name'), list_name };
        if (list_name == '')
            $('.menu .more .build span').text('歌单名不能为空');
        else {
            $.ajax({
                url: '../users/build_list_music',
                type: 'get',
                data,
                success({ message, status, data }) {
                    if (data == 1) {
                        $('.menu .sl .line').append(str);
                        more.css('background-color', '#fff');
                        $('.menu .more .build span').text('');
                        $('.menu .more .build input').val('');
                        build.hide();
                    }
                    else
                        $('.menu .more .build span').text('歌单名已存在');
                }
            })
        }
    })

    //歌单 更多
    $('.menu .sl .line ').on('click', '.song_list .list_more', function (e) {
        var t = e.currentTarget;
        $(t).parent().next().toggle();
        e.stopPropagation();
        $('body').on('click', function () {
            $('.menu .line .song_list .ability').hide();
        })
    })

    //删除歌单
    $('.menu .sl .line').on('click', '.ability .list_del', e => {
        var t = e.currentTarget;
        $(t).parent().parent().remove();
        let data = { user_name: localStorage.getItem('user_name'), list_name: $(t).parent().parent().children(':first').children(':first').text() };
        $.ajax({
            url: '../users/delete_list_music',
            type: 'get',
            data
        })
    })

    //选择歌单
    $('.menu .sl').on('click', '.song_list .li', e => {
        main.css('background-color', '#fff');
        $('.menu .sl div').css('background-color', '#fff');
        var t = e.currentTarget;
        t.parentNode.style.background = '#e3e3e3';
        t.style.background = '#e3e3e3';
        load_list_music(t.innerText, localStorage.getItem('user_name'));//加载
    })

    //主页歌单
    li_list.on('click', function (e) {
        let t = e.currentTarget;
        load_list_music(t.lastElementChild.innerHTML, 'user1');
    })

    //喜欢的音乐
    love_list.on('click', function () {
        main.css('background-color', '#fff');
        $('.menu .sl div').css('background-color', '#fff');
        love_list.css('background-color', '#e3e3e3');
        mian_window.hide();
        list_title.text('我喜欢的音乐');
        author.text(localStorage.getItem('user_name'));
        list.show();

        let data = { user_name: localStorage.getItem('user_name') };
        $.ajax({
            url: '../users/load_favorite_song',
            type: 'get',
            data,
            success({ message, status, data }) {
                var add = '';
                data.forEach(item => {
                    add += ' <div class="line">' +
                        '<div class="pl"></div>' +
                        '<div class="play"></div>' +
                        '<div class="love2"></div>' +
                        '<span class="name">' + item.mu_name + '</span>' +
                        '<span class="singer">' + item.singer + '</span>' +
                        '<div class="mv"></div>' +
                        '<div class="more"></div>' +
                        '<div class="id">' + item.mu_id + '</div>' +
                        '</div>';
                });
                $('.result').empty();
                $('.result').append(add);
            }
        });
    })

    //发现音乐（主页）
    main.on('click', function () {
        main.css('background-color', '#e3e3e3');
        $('.menu .sl div').css('background-color', '#fff');
        list.hide();
        mian_window.show();
    })

    //歌单返回主页
    $('.list .title .left').on('click', function () {
        main.css('background-color', '#e3e3e3');
        $('.menu .sl div').css('background-color', '#fff');
        list.hide();
        mian_window.show();
    })

    //加载歌单音乐
    function load_list_music(lina, usna) {
        list_title.text(lina);
        mian_window.hide();
        list.show();
        author.text(usna);
        let data = { list_name: lina, user_name: usna };
        // console.log(data);
        $.ajax({
            url: '../users/load_list_music',
            type: 'get',
            data,
            success({ message, status, data }) {
                var add = '';
                data.forEach(item => {
                    if (item.user_name != null) {
                        add += ' <div class="line">' +
                            '<div class="pl"></div>' +
                            '<div class="play"></div>' +
                            '<div class="love2"></div>' +
                            '<span class="name">' + item.mu_name + '</span>' +
                            '<span class="singer">' + item.singer + '</span>' +
                            '<div class="del"></div>' +
                            '<div class="mv"></div>' +
                            '<div class="more"></div>' +
                            '<div class="id">' + item.mu_id + '</div>' +
                            '</div>';
                    }
                    else {
                        add += ' <div class="line">' +
                            '<div class="pl"></div>' +
                            '<div class="play"></div>' +
                            '<div class="love"></div>' +
                            '<span class="name">' + item.mu_name + '</span>' +
                            '<span class="singer">' + item.singer + '</span>' +
                            '<div class="del"></div>' +
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

    //轮播图
    var sz = Array();
    var lit = Array();
    for (var i = 1; i <= banner_num; i++) {
        var img = document.createElement('img');
        var li = document.createElement('li');
        img.src = "./images/ba" + i + ".jpg";
        li.append(img);
        banner.append(li);
        sz.push(img);
        if (i != banner_num)
            img.id = banner_num - i;
        else
            img.id = banner_num;
        var lt = document.createElement('span');
        lit.push(lt);
        little.append(lt);
        lt.id = i;
    }

    var len = sz.length - 1;
    sz[len - 2].style.left = '0';
    sz[len - 1].style.left = '260px';
    sz[len - 1].style.zIndex = 4;
    sz[len - 1].style.transform = "scale(1.3)";
    sz[len].style.left = '520px';
    lit[0].style.background = "#cf0000";

    function banner_next() {
        var give_up = sz[len];
        sz.pop();
        sz.unshift(give_up);
        for (var i = 0; i < sz.length; i++) {
            sz[i].style.zIndex = 1;
            sz[i].style.transform = "scale(1)";
            lit[i].style.background = "#c8c8c8";
        }
        sz[len - 2].style.left = '0';
        sz[len - 1].style.left = '260px';
        sz[len - 1].style.zIndex = 4;
        sz[len - 1].style.transform = "scale(1.3)";
        sz[len].style.left = '520px';
        lit[sz[len - 1].id - 1].style.background = "#cf0000";
    }

    function banner_pre() {
        var give_up = sz[0];
        sz.shift();
        sz.push(give_up);
        for (var i = 0; i < sz.length; i++) {
            sz[i].style.zIndex = 1;
            sz[i].style.transform = "scale(1)";
            lit[i].style.background = "#c8c8c8";
        }
        sz[len - 2].style.left = '0';
        sz[len - 1].style.left = '260px';
        sz[len - 1].style.zIndex = 4;
        sz[len - 1].style.transform = "scale(1.3)";
        sz[len].style.left = '520px';
        lit[sz[len - 1].id - 1].style.background = "#cf0000";
    }

    left_button.click(function () {
        clearInterval(timer);
        banner_pre();
        timer = setInterval(banner_next, 3000);
    });
    right_button.click(function () {
        clearInterval(timer);
        banner_next();
        timer = setInterval(banner_next, 3000);
    });

    for (let i = 0; i < lit.length; i++) {
        lit[i].onmouseenter = function () {
            // console.log(i);
            clearInterval(timer);
            var l1 = lit[i].id;
            var l2 = sz[len - 1].id;
            var dis = Math.abs(l1 - l2);
            if (l1 > l2)
                while (dis--)
                    banner_next();
            else
                while (dis--)
                    banner_pre();
            timer = setInterval(banner_next, 3000);
        }
    }

    //歌曲歌单内删除
    $('.list .result').on('click', '.line .del', function (e) {
        let p = e.currentTarget;
        $(p).parent().remove();
        let data = { user_name: localStorage.getItem('user_name'), list_name: $('.list h1').text(), mu_id: p.parentNode.lastElementChild.innerHTML };
        $.ajax({
            url: '../users/song_delete_lsit',
            type: 'get',
            data,
            success({ message, status, data }) { }
        });
    })

    li_mv.on('click', function (e) {
        let t = e.currentTarget;
        let id = t.lastElementChild.innerHTML;
        window.location.href = '/video.html?id=' + id;
    })

    //登录
    function land_succ(name) {
        localStorage.setItem('user_name', name);
        $('.user_login input').val('');
        land_infor.hide();
        user_login.hide();
        removeUnScroll();
        user_name.text(name);
        $.ajax({
            url: '../users/show_list',
            type: 'get',
            data: { name },
            success({ message, status, data }) {
                var add = '';
                data.forEach(item => {
                    add += '<div class="song_list">' +
                        '<div class="col">' +
                        '<div class="li">' +
                        '<img src="./images/歌单.png" alt="">' + item.list_name +
                        '</div>' +
                        '<img src="./images/more.png" class="list_more">' +
                        ' </div>' +
                        '<div class="ability">' +
                        '<div  class="1">' +
                        '<img src="./images/编辑.png">' +
                        '<span>编辑信息</span>' +
                        '</div>' +
                        '<div  class="1">' +
                        '<img src="./images/分享.png">' +
                        '<span>分享</span>' +
                        '</div>' +
                        '<div  class="list_del">' +
                        '<img src="./images/删除.png">' +
                        '<span>删除歌单</span>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                });
                $('.menu .sl .line').empty();
                $('.menu .sl .line').append(add);
            }
        });
    }

    function land_fail() {
        land_infor.show();
    }

    land_button.on('click', function () {
        let input_name = $('.user_login .land .input_name');
        let input_password = $('.user_login .land .input_password');
        let data = { user_name: input_name.val(), password: input_password.val() };
        $.ajax({
            url: '../users/user_land',
            type: 'post',
            data,
            success({ message, status, data }) {
                if (data == 0)
                    land_fail();
                else
                    land_succ(input_name.val());
            }
        });
    });

    //注册
    function login_succ(name) {
        localStorage.setItem('user_name', name);
        $('.user_login input').val('');
        land_infor.hide();
        user_login.hide();
        removeUnScroll();
        user_name.text(name);
        $('.menu .sl .line').empty();//清空
    }

    function login_fail(n) {//1用户名占用，2密码不足8位，3两次密码不同
        if (n == 1)
            login_infor.text('用户名已存在');
        else if (n == 2)
            login_infor.text('密码长度小于8位');
        else if (n == 3)
            login_infor.text('两次密码输入不一致');
        login_infor.show();
    }

    login_button.on('click', function () {
        if (login_pw1.val() != login_pw2.val())
            login_fail(3);
        else if (login_pw1.val().length < 8)
            login_fail(2);
        else {
            let data = { user_name: $('.user_login .login .input_name').val(), password: login_pw1.val() };
            $.ajax({
                url: '../users/user_login',
                type: 'get',
                data,
                success({ message, status, data }) {
                    if (data == 0)
                        login_fail(1);
                    else
                        login_succ($('.user_login .login .input_name').val());
                }
            })
        }
    })

    //注册输入监听
    login_pw2.on('input propertychange', function () {
        let t1 = login_pw1.val();
        let t2 = login_pw2.val();
        // console.log(t1 + " " + t2);
        if (t1 != t2)
            login_fail(3);
        else
            login_infor.hide();
    })

    //加载推荐音乐
    function load_main_music() {
        $.ajax({
            url: '../users/search',
            data: { input: '', user_name: localStorage.getItem('user_name') },
            type: 'get',
            success({ message, status, data }) {
                var add = '';
                let num = [8, 9, 12, 37, 39, 7, 22, 40];
                num.forEach(item => {
                    if (data[item - 1].user_name != null) {
                        add += '<li>' +
                            '<div class="bk"></div>' +
                            '<img src=".' + data[item - 1].img_url + '" alt="">' +
                            '<div class="text">' +
                            '<div class="title">' + data[item - 1].mu_name + '</div>' +
                            '<div class="singer">' + data[item - 1].singer + ' </div>' +
                            '</div>' +
                            '<div class="image">' +
                            '<img src="./images/heart-fill.png" alt=""  class="love">' +
                            '<img src="./images/more.png" alt="">' +
                            '</div>' +
                            '<span class="id">' + data[item - 1].mu_id + '</span>' +
                            '</li>';
                    }
                    else {
                        add += '<li>' +
                            '<div class="bk"></div>' +
                            '<img src=".' + data[item - 1].img_url + '" alt="">' +
                            '<div class="text">' +
                            '<div class="title">' + data[item - 1].mu_name + '</div>' +
                            '<div class="singer">' + data[item - 1].singer + ' </div>' +
                            '</div>' +
                            '<div class="image">' +
                            '<img src="./images/heart.png" alt="" class="love">' +
                            '<img src="./images/more.png" alt="">' +
                            '</div>' +
                            '<span class="id">' + data[item - 1].mu_id + '</span>' +
                            '</li>';
                    }
                });
                $('.new_music').empty();
                $('.new_music').append(add);
            }
        });
    }

    $('.content .new_music').on('click', 'li .bk', (e) => {
        var p = e.currentTarget;
        var id = p.parentElement.lastElementChild.innerHTML;
        localStorage.setItem('playing', id);
        m_playId(id, 1);
    })

    $('.content .new_music').on('dblclick', 'li .bk', (e) => {
        var p = e.currentTarget;
        localStorage.setItem('playing', id);
        play(p.parentElement.lastElementChild.innerHTML);
    })

    //主页推荐音乐喜欢
    $('.content .new_music').on('click', 'li .love', (e) => {
        var p = e.currentTarget;
        if (p.src == 'http://localhost:3000/images/heart-fill.png') {
            p.src = './images/heart.png';
            let id = p.parentElement.parentElement.lastElementChild.innerHTML;
            let data = { user_name: localStorage.getItem('user_name'), mu_id: id };
            // console.log(data);
            $.ajax({
                url: '../users/del_favorite_song',
                type: 'get',
                data,
                success({ message, status, data }) { }
            })
        }
        else {
            p.src = './images/heart-fill.png';
            let id = p.parentElement.parentElement.lastElementChild.innerHTML;
            let data = { user_name: localStorage.getItem('user_name'), mu_id: id };
            // console.log(data);
            $.ajax({
                url: '../users/add_favorite_song',
                type: 'get',
                data,
                success({ message, status, data }) { }
            })
        }
    })

    load_main_music();
    //音乐播放
    m_playId(null, 1);

    if (localStorage.getItem('user_name') != null)
        land_succ(localStorage.getItem('user_name'));

    nextbtn.on('click', m_next);
    lastbtn.on('click', m_last);
    popbtn.on('click', m_pop);
}

