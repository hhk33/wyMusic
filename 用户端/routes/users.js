var express = require('express');
var mysql = require('mysql');
var fs = require('fs');
const { send } = require('express/lib/response');
var router = express.Router();

// 连接数据库
var db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'music_website'
});
db.connect();


router.get('/playId', function (req, res, next) {
  console.log('进入palyId接口');
  const s = req.query;
  var str = "select A.*, B.user_name " +
    "from music as A left join (select * from favorite_music where user_name = '" + s.user_name + "') as B on A.mu_id=B.mu_id " +
    'where A.mu_id=' + s.mu_id + ' and state=1';
  db.query(str, (err, ress) => {
    if (err)
      return console.log(err);
    // console.log(ress[0]);
    fs.readFile('../code/public' + ress[0].word, 'utf8', function (rerr, dataStr) {
      if (rerr)
        console.log(rerr);
      ress[0].word = dataStr;
      // console.log(ress[0]);
      res.send({
        message: 'success',
        status: 1,
        data: ress[0]
      });
    })
  });
});

router.get('/count', function (req, res, next) {
  console.log('进入count接口');
  const id = req.query.id;
  var str = 'select count(mu_id) as total from music where state = 1';
  db.query(str, (err, ress) => {
    if (err)
      return console.log(err);
    console.log(ress[0].total);
    var num = ress[0].total;
    res.send({
      message: 'success',
      status: 1,
      data: num
    });
  });
});

router.get('/search', function (req, res, next) {
  console.log('进入search接口');
  const s = req.query;
  var str = "select A.*, B.user_name " +
    "from music as A left join (select * from favorite_music where user_name = '" + s.user_name + "') as B on A.mu_id=B.mu_id "
    + " where state=1 and( mu_name like '%" + s.input + "%' or " + "singer like '%" + s.input + "%')";
  db.query(str, (err, ress) => {
    if (err)
      return console.log(err);
    // console.log(ress);
    res.send({
      message: 'success',
      status: 1,
      data: ress
    });
  });
});

router.get('/comment_load', function (req, res, next) {
  console.log('进入comment_load接口');
  const s = req.query;
  var str1 = 'select A.* , B.user_name as flag ' +
    ' from comment as A left join (select * from love_comment where user_name = "' + s.user_name + '") as B on A.com_id=B.com_id ' +
    ' where mu_id=' + s.mu_id;
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);
    // console.log(ress);
    res.send({
      message: 'success',
      status: 1,
      data: ress
    });
  });
});

router.get('/comment_add', function (req, res, next) {
  console.log('进入comment_add接口');
  const s = req.query;
  console.log(s);
  let str1 = 'select count(*) as num from comment';
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);

    let str2 = 'insert into comment(com_id, mu_id, user_name, time, content, love)' +
      'values(' + (ress[0].num + 1) + ',' + s.mu_id + ',"' + s.user_name + '","' + s.time + '","' + s.content + '",' + 0 + ')';
    console.log(str2);
    db.query(str2, (err2, ress2) => {
      if (err2)
        return console.log(err2);
      res.send({
        message: 'success',
        status: 1,
      });
    });
  });
});

router.get('/comment_add_like', function (req, res, next) {
  console.log('进入comment_add_like接口');
  const s = req.query;
  let str1 = 'update comment set love=love+1 where com_id=' + s.com_id;
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);
  });
  let str2 = 'insert into love_comment(user_name,com_id)' +
    ' values("' + s.user_name + '",' + s.com_id + ' )';
  db.query(str2, (err, ress) => {
    if (err)
      return console.log(err);
  });
});

router.get('/comment_del_like', function (req, res, next) {
  console.log('进入comment_del_like接口');
  const s = req.query;
  let str1 = 'update comment set love=love-1 where com_id=' + s.com_id;
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);
  });
  let str2 = 'delete from love_comment' +
    ' where user_name="' + s.user_name + '" and com_id=' + s.com_id;
  db.query(str2, (err, ress) => {
    if (err)
      return console.log(err);
  });
});

router.post('/user_land', function (req, res, next) {
  console.log('进入user_land接口');
  const s = req.body;
  var str1 = 'select * from user where user_name="' + s.user_name + '" and password="' + s.password + '"';
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);
    let flag;
    if (ress[0] == null)
      flag = 0;
    else
      flag = 1;
    res.send({
      message: 'success',
      status: 1,
      data: flag
    });
  });
});

router.get('/show_list', function (req, res, next) {
  console.log('进入show_list接口');
  const s = req.query;
  var str1 = 'select list_name from list where user_name="' + s.name + '"';
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);
    // console.log(ress);
    res.send({
      message: 'success',
      status: 1,
      data: ress
    });
  });
});

router.get('/load_list_music', function (req, res, next) {
  console.log('进入load_list_music接口');
  const s = req.query;
  var str1 = 'select A.*, B.user_name ' +
    ' from music as A left join (select * from favorite_music where user_name = "' + s.user_name + '") as B on A.mu_id=B.mu_id ' +
    ' where A.mu_id in(select mu_id from song_list where user_name="' + s.user_name + '" and list_name="' + s.list_name + '") and state=1';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      return console.log(err);
    // console.log(ress);
    res.send({
      message: 'success',
      status: 1,
      data: ress
    });
  });
});

router.get('/user_login', function (req, res, next) {
  console.log('进入user_login接口');
  const s = req.query;
  let str1 = 'insert into user(user_name,password) ' +
    'values("' + s.user_name + '",' + s.password + ')';
  let flag = 1;
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      flag = 0;
    // console.log(ress);
    res.send({
      message: 'success',
      status: 1,
      data: flag
    });
  });
});

router.get('/build_list_music', function (req, res, next) {
  console.log('进入build_list_music接口');
  const s = req.query;
  let flag = 1;
  let str1 = 'insert into list(user_name, list_name) ' +
    'values("' + s.user_name + '","' + s.list_name + '")';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      flag = 0;
    // console.log(flag);
    res.send({
      message: 'success',
      status: 1,
      data: flag
    });
  });
});

router.get('/delete_list_music', function (req, res, next) {
  console.log('进入delete_list_music接口');
  const s = req.query;
  let str1 = 'delete from list where' +
    ' user_name="' + s.user_name + '" and list_name="' + s.list_name + '"';
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
  });
  let str2 = 'delete from song_list where' +
    ' user_name="' + s.user_name + '" and list_name="' + s.list_name + '"';
  db.query(str2, (err, ress) => {
    if (err)
      console.log(err);
  });
});

router.get('/song_collect_list', function (req, res, next) {
  console.log('进入song_collect_list接口');
  const s = req.query;
  let str1 = 'select * from song_list ' +
    ' where user_name="' + s.user_name + '" and list_name="' + s.list_name + '" and mu_id="' + s.mu_id + '"';
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
    if (ress[0] == null) {
      let str2 = 'insert into song_list(user_name,list_name,mu_id)' +
        ' values("' + s.user_name + '","' + s.list_name + '","' + s.mu_id + '")';
      db.query(str2, (err, ress) => {
        if (err)
          console.log(err);
      });
    }
  });
});

router.get('/song_delete_lsit', function (req, res, next) {
  console.log('进入song_delete_lsit接口');
  const s = req.query;
  let str1 = 'delete from song_list where ' +
    ' user_name="' + s.user_name + '" and list_name="' + s.list_name + '" and mu_id="' + s.mu_id + '"';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
  });
});

router.get('/load_favorite_song', function (req, res, next) {
  console.log('进入load_favorite_song接口');
  const s = req.query;
  let str1 = 'select * ' +
    ' from favorite_music left join music on music.mu_id = favorite_music.mu_id where user_name="' + s.user_name + '"';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
    res.send({
      message: 'success',
      status: 1,
      data: ress
    });
  });
});

router.get('/add_favorite_song', function (req, res, next) {
  console.log('进入add_favorite_song接口');
  const s = req.query;
  let str1 = 'insert into favorite_music(user_name, mu_id) ' +
    ' values("' + s.user_name + '","' + s.mu_id + '")';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
  });
});

router.get('/del_favorite_song', function (req, res, next) {
  console.log('进入del_favorite_song接口');
  const s = req.query;
  let str1 = 'delete from favorite_music where' +
    ' user_name="' + s.user_name + '" and mu_id="' + s.mu_id + '"';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
  });
});

router.get('/load_mv', function (req, res, next) {
  console.log('进入load_mv接口');
  const s = req.query;
  let str1 = 'select * ' +
    ' from mv where mu_id="' + s.mu_id + '"';
  // console.log(str1);
  db.query(str1, (err, ress) => {
    if (err)
      console.log(err);
    res.send({
      message: 'success',
      status: 1,
      data: ress[0]
    });
  });
});

module.exports = router;
