//app_server_00/app.js
//0:下载mysql express模块
//1:引入二个模块 mysql express
const mysql = require("mysql");
const express = require("express");
//1.1 引入模块 cors
const cors = require("cors");

//2:创建连接池 很大提高效率方法
var pool = mysql.createPool({
  host     : process.env.MYSQL_HOST,
  port     : process.env.MYSQL_PORT,
  user     : process.env.ACCESSKEY,
  password : process.env.SECRETKEY,
  database : 'app_' + process.env.APPNAME
});
//3:创建express对象
var server = express();
//3.1 配置允许访问列 脚手架8080
server.use(cors({
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true
}));
//3.11:加载模块 express-session
const session = require("express-session");
server.use(session({
  secret:"128位随机字符串",
  resave:false,
  saveUninitialized:true,
  cookie:{
    maxAge:1000*60*60
  }
}))
//3.12:配置模块


//3.2 配置静态资源目录 public
server.use(express.static("public"));
//3.3配置一个第三方中间件
const bodyParser=require("body-parser");
//3.4配置json是否自动转换
server.use(bodyParser.urlencoded({extended:false}))

//4:为express对象绑定监听端口 3000
server.listen(5050);

//功能一:用户登录
//1:用户post 请求路径/login
server.post("/login",(req,res)=>{
  //2:获取二个参数 uname upwd
  var uname = req.body.uname;
  var upwd = req.body.upwd;
  //3:创建sql
  var sql = "SELECT * FROM user";
  sql+=" WHERE uname = ? AND upwd = md5(?)";
  //4:执行sql
  pool.query(sql,[uname,upwd],(err,result)=>{
      if(err)throw err;
      //5:获取数据库返回结果
      //6:返回客户数据
      if(result.length==0){
        res.send({code:2,msg:"用户名或密码有误"});
      }else{
        //登陆成功
        //获取当前登录用户id
        console.log(result[0])
        var uid=result[0].uid;
        //保存session对象中
        req.session.uid=uid;
        res.send({code:1,msg:"登录成功"});
      }
  })
});
// 2.首页轮播图
server.get('/imglist',(req,res)=>{
  var sql="select pic from index_lunbo";
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
    res.send(result);
  });
});
//3.首页九宫格
server.get("/grid",(req,res)=>{
  var sql="select img,title from index_ge";
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
    res.send(result);
  });
});
//4.宠物秀
server.get("/show",(req,res)=>{
  var sql="select img,title from pets_show";
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
    res.send(result);
  });
})
//5.宠物医院
server.get('/hospital',(req,res)=>{
var sql="select title,img,tel from pets_hospital";
pool.query(sql,[],(err,result)=>{
  if(err)throw err;
  res.send(result);
});
})
// 6.商品列表-->功能二
server.get('/goodlist',(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno){pno=1}
  if(!pageSize){pageSize=6}
  var sql="SELECT lid,img,title,price FROM food_comment LIMIT ?,?";
  var offset=(pno-1)*pageSize;
  pageSize=parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
})
//7.模糊查询
server.get('/search',(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno){pno=1}
  if(!pageSize){pageSize=6}
  var title=req.query.title;
  var sql="SELECT lid,img,title,price FROM food_comment WHERE title LIKE concat('%',?,'%') LIMIT ?,?";
  var offset = (pno-1)*pageSize;
  pageSize = parseInt(pageSize);
  pool.query(sql,[title,offset,pageSize],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
})
//8.狗粮详情页轮播
server.get('/lunbo',(req,res)=>{
  var lid=req.query.lid;
  var sql="select lid,pic from food_lunbo where lid=?";
  pool.query(sql,[lid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})
//9.狗粮详情页标题..详情
server.get('/comment',(req,res)=>{
  var lid=req.query.lid;
  var sql="select lid,title,price,subtitle,spe,formula,applylicable,age,img from food_comment where lid=?";
  pool.query(sql,[lid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})
//9.狗粮详情页标题..详情
server.get('/foodPic',(req,res)=>{
  var lid=req.query.lid;
  var sql="select lid,pic from food_pic where lid=?";
  pool.query(sql,[lid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})
//10.用户点击添加购物车按钮,及修改,查找
server.get('/addcart',(req,res)=>{
  var uid=req.session.uid;
  // console.log(uid);
  var pid=req.query.pid;
  var pname=req.query.pname;
  var price=req.query.price;
  var pic=req.query.pic;
  //查询当前用户是否添加过此商品
  var sql="select id from shopcart where uid=? and pid=?";
  pool.query(sql,[uid,pid],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      //如果没有查询结果添加此商品
      var sql=`insert into shopcart values(null,${uid},${pid},${price},'${pname}',1,'${pic}')`;
    }else{
      //创建sql语句如果有结果更新数量
      var sql=`update shopcart set count=count+1 where uid=${uid} and pid=${pid}`;
    }
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"添加成功"})
    })
  })
})
//11.订单住址
server.get('/addr',(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
    }
    var id=req.query.id;
    var sql="select id,name,tel,place from addr where id=? and uid=?"
    if(!id){id=2}
  pool.query(sql,[id,uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
})
//12.加入购物车的列表
server.get('/shop',(req,res)=>{
  var uid=req.session.uid;
  console.log(uid);
  if(!uid){
  res.send({code:-1,msg:"请登录"});
  return;
  }
  var sql="select id,pid,price,pname,pic from shopcart where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
})
//13.查看用户名
server.get('/use',(req,res)=>{
  var uid=req.session.uid;
  // console.log(uid);
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
    }
  var sql="select uname from user where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
})
// 14 查询所有住址
server.get('/allr',(req,res)=>{
  var sql="select id,name,tel,place from addr"
  pool.query(sql,[],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})
//15.删除住址
server.get('/delr',(req,res)=>{
  var id=req.query.id;
  var sql="delete from addr where id=?"
  pool.query(sql,[id],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})
// 16.修改地址
server.post('/updater',(req,res)=>{
  var id=req.body.id;
  var name=req.body.name;
  var tel=req.body.tel;
  var place=req.body.place;
  var sql=`update addr set name='${name}',tel='${tel}',place='${place}' where id=?`;
  pool.query(sql,[id],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"添加成功"})
  })
})
// 17添加地址
server.post('/insert',(req,res)=>{
  var uid=req.session.uid;
  var name=req.body.name;
  var tel=req.body.tel;
  var place=req.body.place;
  var sql=`insert into addr values(null,${uid},?,?,?)`;
  pool.query(sql,[name,tel,place],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"添加成功"})
  })
})
//18删除选中商品
server.post("/removeItem",(req,res)=>{
  var id=req.body.id;
  var sql="delete from shopcart where id=?";
  id=parseInt(id);
  pool.query(sql,[id],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"})
    }else{
      res.send({code:-1,msg:"删除失败"});
    }
  })
})  
//19.注册
server.post('/zhuce',(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  var phone=req.body.phone;
  var sql="insert into user values(null,?,?,?)";
  pool.query(sql,[uname,upwd,phone],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"添加成功"})
  })
})                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              