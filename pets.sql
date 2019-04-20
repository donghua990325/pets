/*客户信息*/
CREATE TABLE user(
uid INT PRIMARY KEY AUTO_INCREMENT,	
uname VARCHAR(16),
upwd VARCHAR(32),
phone VARCHAR(11)
);
/*首页轮播*/
CREATE TABLE index_lunbo(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(52) #首页轮播图片
);
/****首页九宫格*******/
CREATE TABLE index_ge(
    gid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(36),  #九宫格标题
    img VARCHAR(52) #九宫格图片
);
/*****宠物秀********/
CREATE TABLE pets_show(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(36),  #宠物标题
    img VARCHAR(52) #宠物图片
);
/******宠物医院*******/
CREATE TABLE pets_hospital(
    hid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),  #医院名
    img VARCHAR(52), #图片
    tel VARCHAR(14) #联系电话
);
/******狗/猫粮 详情****xz_laptop*/
CREATE TABLE food_comment(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),#标题
    img VARCHAR(52), #粮食图片
    price DECIMAL(10,2),#价格
    subtitle VARCHAR(32),#所属品牌
    spe VARCHAR(32),#产品规格
    formula VARCHAR(32),#配方
    applylicable VARCHAR(64),#使用犬种
    age VARCHAR(16) #适用年龄 
);
/******狗/猫粮 轮播*******/
CREATE TABLE food_lunbo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lid INT(3),     #获取对应的lid值
    pic VARCHAR(52) #粮食图片1
);
/******狗/猫粮 详情图片*******/
CREATE TABLE food_pic(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lid INT(3),     #获取对应的lid值
    pic VARCHAR(52) #粮食图片1
);
/******************/
/*****数据导入******/
/********************/
/***用户信息****/
INSERT INTO user VALUES
(NULL,"ming",md5('123456'),'12345678932'),
(NULL,"hua",md5('6789561'),'18137196326'),
(NULL,"qin",md5('abcdefg'),'13545696352'),
(NULL,"xiao",md5('456789'),'13547569422'),
(NULL,"dingding",md5('0987654'),'15488632145'),
(NULL,"dangdang",md5('fdasdxzc'),'13894542633'),
(NULL,"yao",md5('51913151'),'17895426225'),
(NULL, 'doudou',md5('123456'),'13501234569'),
(NULL, "yaya",md5('123456'),'13501234560'),
(NULL, 'aaaa',md5('123456'),'13505464215'),
(NULL, 'babba',md5('123456'),'13501234560'),
(NULL, 'haha',md5('123456'),'13501234560'),
(NULL, 'dede',md5('123456'),'13501234560');
/****首页轮播*****/
INSERT INTO index_lunbo VALUES
(NULL,'img/lunbo.jpg'),
(NULL,'img/lunbo4.jpg'),
(NULL,'img/lunbo2.jpg'),
(NULL,'img/lunbo3.jpg');
/*****九宫格******/
INSERT INTO index_ge VALUES
(NULL,'宠物猫','img/im1.png'),
(NULL,'主粮精选','img/im6.png'),
(NULL,'宠物狗','img/im3.png');
/*****宠物秀*****/
INSERT INTO pets_show VALUES
(NULL,'恶霸犬一脸茫然，呆萌的眼神好可爱','img/show_2.jpg'),
(NULL,'西高地白梗：觉得我可爱的请举个爪','img/show_01.jpg'),
(NUll,'头顶着一颗爱心，无时无刻都在证明你爱我','img/show_09.jpg'),
(NULL,'看不够的可爱金毛崽','img/show_03.jpg'),
(NUll,'颓废的周一','img/show_10.jpg'),
(NUll,'被小二哈包围，小拉布拉多一脸委屈','img/show_05.jpg'),
(NUll,'拳师犬的千姿百态','img/show_06.jpg'),
(NUll,'大风中的博美犬:吹啊吹啊，我的骄傲放纵','img/show_07.jpg'),
(NUll,'来萌拍 喵～','img/show_08.jpg'),
(NULL,'哈士奇的爱情，简单又甜蜜','img/show_04.jpg'),
(NULL,'玩偶精神','img/show_11.jpg');
INSERT INTO pets_hospital VALUES
(NULL,'犬家福宠物诊所','img/hospital01.jpg','021-37799918'),
(NULL,'天使宠物医院(洛川中路店)','img/hospital02.jpg','021-56031628'),
(NULL,'顽皮家族(虹桥路总店)','img/hospital03.jpg','021-62689507'),
(NULL,'朋朋宠物之家','img/hospital04.jpg','021-62948542');
/******狗/猫粮列表轮播*********/
INSERT INTO food_lunbo VALUES
(NULL,1,'img/dog-liang1.jpg'),
(NULL,1,'img/dog-liang-a-2.jpg'),
(NULL,1,'img/dog-liang-a-3.jpg'),
(NULL,2,'img/dog-liang-b-1.jpg'),
(NULL,2,'img/dog-liang-b-2.jpg'),
(NULL,2,'img/dog-liang-b-3.jpg'),
(NULL,3,'img/dog-liang-c-1.jpg'),
(NULL,3,'img/dog-liang-c-2.jpg'),
(NULL,3,'img/dog-liang-c-3.jpg'),
(NULL,4,'img/dog-liang-d-1.jpg'),
(NULL,4,'img/dog-liang-d-2.jpg'),
(NULL,4,'img/dog-liang-d-3.jpg'),
(NULL,5,'img/dog-liang-e-1.jpg'),
(NULL,5,'img/dog-liang-e-2.jpg'),
(NULL,5,'img/dog-liang-e-3.jpg'),
(NULL,6,'img/cat-liang-f-1.jpg'),
(NULL,6,'img/cat-liang-f-2.jpg'),
(NULL,6,'img/cat-liang-f-3.jpg'),
(NULL,7,'img/cat-liang-g-1.jpg'),
(NULL,7,'img/cat-liang-g-2.jpg'),
(NULL,7,'img/cat-liang-g-3.jpg'),
(NULL,8,'img/cat-liang-h-1.jpg'),
(NULL,8,'img/cat-liang-h-2.jpg'),
(NULL,8,'img/cat-liang-h-3.jpg'),
(NULL,9,'img/cat-liang-i-1.jpg'),
(NULL,9,'img/cat-liang-i-2.jpg'),
(NULL,9,'img/cat-liang-i-3.jpg'),
(NULL,10,'img/cat-liang-j-1.jpg'),
(NULL,10,'img/cat-liang-j-2.jpg'),
(NULL,10,'img/cat-liang-j-3.jpg'),
(NULL,11,'img/cat-liang-k-1.jpg'),
(NULL,11,'img/cat-liang-k-2.jpg'),
(NULL,11,'img/cat-liang-k-3.jpg'),
(NULL,12,'img/cat-liang-l-1.jpg'),
(NULL,12,'img/cat-liang-l-2.jpg'),
(NULL,12,'img/cat-liang-l-3.jpg');
/*****狗/猫粮列表详情******/
INSERT INTO food_comment VALUES
(NULL,'比瑞吉 博美成犬粮','img/dog-liang1.jpg','139.00','比瑞吉','12kg','北欧配方天然食材','主要在室内生活的博美成犬','成犬喂食'), 
(NULL,'法国皇家ROYAL CANIN','img/dog-liang-b-1.jpg','553.00','法国皇家','15kg','NULL','中型犬成犬','12月龄以上'),
(NULL,'优基能量果小型犬','img/dog-liang-c-1.jpg','120.00','优基','1.5kg','鹿肉蛋黄能量果配方','小型犬','幼犬'),
(NULL,'法国皇家 金毛','img/dog-liang-d-1.jpg','744.00','法国皇家','14kg','小麦、肉及肉类副产品（禽肉及禽肉副产品等）、大米、动物脂肪、小麦谷朊粉、动物源性品味增强剂纤维粉、甜菜粕、鱼油、大豆油、沸石粉、车前籽壳、果寡糖、矿物质（碳酸钙等）','金毛幼犬','15月龄以下'),
(NULL,'Fromm福摩 全犬粮','img/dog-liang-e-1.jpg','239.00','Fromm福摩','2.27kg','鸭肉甜薯','全犬','成犬喂食'),
(NULL,'皇家ROYAL CANIN 室内成猫猫粮','img/cat-liang-f-1.jpg','136.00','皇家ROYAL CANIN','2kg','小麦、肉及肉类副产品（禽肉及禽肉副产品等）、大米','主要在室内生活的成猫','1-7岁'),
(NULL,'怡亲Yoken 猫用吞拿鱼鸡肉配方猫罐头','img/cat-liang-g-1.jpg','65.00','怡亲Yoken','80G*10','吞拿鱼鸡肉','猫咪','12月龄以上'),
(NULL,'荒野盛宴 特选风味烤鹿肉烟熏三文鱼配方','img/cat-liang-h-1.jpg','419.00','荒野盛宴','6.8kg','鸡肉','全猫','12月龄以上'),
(NULL,'伟嘉 成猫粮海洋鱼味猫粮','img/cat-liang-i-1.jpg','42.90','伟嘉','1.3kg','海洋鱼味','普通成猫','12月龄以上'),
(NULL,'美毛及理想体态室内爱猫粮','img/cat-liang-j-1.jpg','116.00','佩玛思特','2kg','格品鱼粉（欧米茄-3多不饱和脂肪酸天然来源）、鸡肉粉、米及浓缩米蛋白、玉米及玉米蛋白、精选动物脂肪、可溶性膳食纤维、有机矿物质、益生元、丝兰汁、维生素E、牛磺酸、DL-蛋氨酸、磷酸二钙、矿物rfm（铜、铁、锌）','主要在室内生活的猫咪','建议室内猫咪喂食'),
(NULL,'皇家ROYAL CANIN 12月以下及怀孕期母猫幼猫粮','img/cat-liang-k-1.jpg','138.00','皇家ROYAL CANIN','2kg','米及浓缩米蛋白、玉米及玉米蛋白、精选动物脂肪、可溶性膳食纤维、有机矿物质、益生元、丝兰汁、维生素E、牛磺酸、DL-蛋氨酸、磷酸二钙、矿物rfm（铜、铁、锌）','猫咪','幼猫'),
(NULL,'妙多乐CatChow 成猫粮均衡营养猫粮','img/cat-liang-l-1.jpg','138.00','妙多乐CatChow','10kg','高品质蛋白质和维生素，有助于肌肉强健；含有适量钙，帮助强化骨骼与牙齿；高品质五谷，天然纤维有助于消化系统健康；可保持猫尿液的微酸性，有助于维护猫泌尿道的健康。','成猫','12月龄以上');
/******狗/猫粮 详情图片*******/
INSERT INTO food_pic VALUES
(NULL,1,'img/shopimgFile1544515567.jpg'),
(NULL,1,'img/shopimgFile1544515568.jpg'),
(NULL,1,'img/shopimgFile1544515569.jpg'),
(NULL,1,'img/shopimgFile1544515570.jpg'),
(NULL,1,'img/shopimgFile1544515571.jpg'),
(NULL,1,'img/shopimgFile1544515572.jpg'),
(NULL,1,'img/shopimgFile1544515573.jpg'),
(NULL,1,'img/shopimgFile1544515574.jpg'),
(NULL,1,'img/shopimgFile1544515575.jpg'),
(NULL,1,'img/shopimgFile1544515576.jpg'),
(NULL,2,'img/shopimgFile1472818450.jpg'),
(NULL,2,'img/shopimgFile1472818451.jpg'),
(NULL,2,'img/shopimgFile1472818452.jpg'),
(NULL,2,'img/shopimgFile1472818453.jpg'),
(NULL,2,'img/shopimgFile1472818454.jpg'),
(NULL,2,'img/shopimgFile1472818455.jpg'),
(NULL,2,'img/shopimgFile1472818456.jpg'),
(NULL,3,'img/shopimgFile1494492817.jpg'),
(NULL,3,'img/shopimgFile1494492818.jpg'),
(NULL,3,'img/shopimgFile1494492819.jpg'),
(NULL,3,'img/shopimgFile1494492820.jpg'),
(NULL,3,'img/shopimgFile1494492821.jpg'),
(NULL,3,'img/shopimgFile1494492822.jpg'),
(NULL,3,'img/shopimgFile1494492823.jpg'),
(NULL,3,'img/shopimgFile1494492824.jpg'),
(NULL,3,'img/shopimgFile1494492825.jpg'),
(NULL,3,'img/shopimgFile1494492826.jpg'),
(NULL,4,'img/shopimgFile1474539628.jpg'),
(NULL,4,'img/shopimgFile1474539629.jpg'),
(NULL,4,'img/shopimgFile1474539630.jpg'),
(NULL,4,'img/shopimgFile1474539631.jpg'),
(NULL,4,'img/shopimgFile1474539632.jpg'),
(NULL,4,'img/shopimgFile1474539633.jpg'),
(NULL,4,'img/shopimgFile1474539634.jpg'),
(NULL,4,'img/shopimgFile1474539635.jpg'),
(NULL,4,'img/shopimgFile1474539636.jpg'),
(NULL,5,'img/shopimgFile1474959924.jpg'),
(NULL,5,'img/shopimgFile1474959925.jpg'),
(NULL,5,'img/shopimgFile1474959926.jpg'),
(NULL,5,'img/shopimgFile1474959927.jpg'),
(NULL,5,'img/shopimgFile1474959928.jpg'),
(NULL,5,'img/shopimgFile1474959929.jpg'),
(NULL,5,'img/shopimgFile1474959930.jpg'),
(NULL,5,'img/shopimgFile1474959931.jpg'),
(NULL,5,'img/shopimgFile1474959932.jpg'),
(NULL,5,'img/shopimgFile1474959933.jpg'),
(NULL,6,'img/shopimgFile1537340564.jpg'),
(NULL,6,'img/shopimgFile1537340565.jpg'),
(NULL,6,'img/shopimgFile1537340566.jpg'),
(NULL,6,'img/shopimgFile1537340567.jpg'),
(NULL,6,'img/shopimgFile1537340568.jpg'),
(NULL,6,'img/shopimgFile1537340569.jpg'),
(NULL,6,'img/shopimgFile1537340570.jpg'),
(NULL,6,'img/shopimgFile1537340571.jpg'),
(NULL,6,'img/shopimgFile1537340572.jpg'),
(NULL,6,'img/shopimgFile1537340573.jpg'),
(NULL,6,'img/shopimgFile1537340574.jpg'),
(NULL,6,'img/shopimgFile1537340575.jpg'),
(NULL,6,'img/shopimgFile1537340576.jpg'),
(NULL,6,'img/shopimgFile1537340577.jpg'),
(NULL,7,'img/shopimgFile1515735436.jpg'),
(NULL,7,'img/shopimgFile1515735437.jpg'),
(NULL,7,'img/shopimgFile1515735438.jpg'),
(NULL,7,'img/shopimgFile1515735439.jpg'),
(NULL,7,'img/shopimgFile1515735440.jpg'),
(NULL,7,'img/shopimgFile1515735441.jpg'),
(NULL,7,'img/shopimgFile1515735442.jpg'),
(NULL,7,'img/shopimgFile1515735443.jpg'),
(NULL,7,'img/shopimgFile1515735444.jpg'),
(NULL,7,'img/shopimgFile1515735445.jpg'),
(NULL,7,'img/shopimgFile1515735446.jpg'),
(NULL,7,'img/shopimgFile1515735447.jpg'),
(NULL,7,'img/shopimgFile1515735448.jpg'),
(NULL,7,'img/shopimgFile1515735449.jpg'),
(NULL,7,'img/shopimgFile1515735450.jpg'),
(NULL,7,'img/shopimgFile1515735451.jpg'),
(NULL,7,'img/shopimgFile1515735452.jpg'),
(NULL,8,'img/shopimgFile1509615716.jpg'),
(NULL,8,'img/shopimgFile1509615717.jpg'),
(NULL,8,'img/shopimgFile1509615718.jpg'),
(NULL,8,'img/shopimgFile1509615719.jpg'),
(NULL,8,'img/shopimgFile1509615720.jpg'),
(NULL,8,'img/shopimgFile1509615721.jpg'),
(NULL,8,'img/shopimgFile1509615722.jpg'),
(NULL,8,'img/shopimgFile1509615723.jpg'),
(NULL,8,'img/shopimgFile1509615724.jpg'),
(NULL,8,'img/shopimgFile1509615725.jpg'),
(NULL,8,'img/shopimgFile1509615726.jpg'),
(NULL,8,'img/shopimgFile1509615727.jpg'),
(NULL,8,'img/shopimgFile1509615728.jpg'),
(NULL,8,'img/shopimgFile1509615729.jpg'),
(NULL,8,'img/shopimgFile1509615730.jpg'),
(NULL,9,'img/shopimgFile1465980161.jpg'),
(NULL,9,'img/shopimgFile1465980162.jpg'),
(NULL,9,'img/shopimgFile1465980163.jpg'),
(NULL,9,'img/shopimgFile1465980164.jpg'),
(NULL,9,'img/shopimgFile1465980165.jpg'),
(NULL,9,'img/shopimgFile1465980166.jpg'),
(NULL,9,'img/shopimgFile1465980167.jpg'),
(NULL,9,'img/shopimgFile1465980168.jpg'),
(NULL,9,'img/shopimgFile1465980169.jpg'),
(NULL,9,'img/shopimgFile1465980170.jpg');
/******添加购物车表单*******/
CREATE TABLE shopcart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT(3),     #当前用户的id
    pid INT(3),     #相应的商品id
    price DECIMAL(10,2), #对应的商品价格
    pname VARCHAR(32),  #对应的商品标题
    count INT(5),        #数量值
    pic VARCHAR(32)     #商品图片
);
/******添加购物车表单内容*******/
INSERT INTO shopcart VALUES
(NULL,1,1,'139.00','比瑞吉 博美成犬粮',1,'img/dog-liang1.jpg'),
(NULL,1,2,'553.00','法国皇家ROYAL CANIN',6,'img/dog-liang-b-1.jpg');
/******订单发送地址*******/
CREATE TABLE addr(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    name VARCHAR(10),   #收获人的名字
    tel VARCHAR(15),    #收获人的手机号
    place VARCHAR(54)   #收获人地址
);
INSERT INTO addr VALUES
(NULL,1,'家明','15517731923','河南省郑州市金水区东风街道...'),
(NULL,1,'家明','15517731923','河南省郑州市金水区东风街道...');



