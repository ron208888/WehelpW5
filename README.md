## 要求三

* 使用 INSERT 指令新增⼀筆資料到 member 資料表中，這筆資料的 username 和
password 欄位必須是 test。接著繼續新增至少 4 筆隨意的資料。
* 使用 SELECT 指令取得所有在 member 資料表中的會員資料。
~~~~sql
insert into member(name,username,password,follower_count) values('任','test','test',100);
insert into member(name,username,password,follower_count,time) values('與','yu','yu',500,'2000-01-31 00:30:15');
insert into member(name,username,password,follower_count,time) values('陳','chen','chen',50,'2018-08-28 08:48:48');
insert into member(name,username,password,follower_count,time) values('晨','chenchen','chenchen',800,'2020-02-09 14:09:15');
insert into member(name,username,password,follower_count,time) values('芯','xin','xin',1000,'2004-06-16 06:30:30');
select * from member; 
~~~~

![](https://img.onl/r3bpe4)

* 使用 SELECT 指令取得所有在 member 資料表中的會員資料，並按照 time 欄位，由近到遠排序。
~~~~sql
select * from member order by time desc;
~~~~
![](https://img.onl/LURHSL)

* 使用 SELECT 指令取得 member 資料表中第 2 ~ 4 共三筆資料，並按照 time 欄位，由近到遠排序。(並非編號 2、3、4 的資料，而是排序後的第2 ~ 4筆資料)
~~~~sql
select * from member order by time desc limit 1,3;
~~~~
![](https://img.onl/w0uYD)

* 使用 SELECT 指令取得欄位 username 是 test 的會員資料。
~~~~sql
select * from member where username='test';
~~~~
![](https://img.onl/PvcT1K)

* 使用 SELECT 指令取得欄位 username 是 test、且欄位 password 也是 test 的資料。
~~~~sql
select * from member where username='test' and password='test';
~~~~
![](https://img.onl/hLliiO)

* 使用 UPDATE 指令更新欄位 username 是 test 的會員資料，將資料中的 name 欄位改
成 test2。
~~~~sql
update member set name='test2' where username='test';
~~~~
![](https://img.onl/WDVHW3)

## 要求四

* 取得 member 資料表中，總共有幾筆資料(幾位會員)。
~~~~sql
select count(*) as 總共有幾筆資料 from member;
~~~~
![](https://img.onl/RXr6HJ)

* 取得 member 資料表中，所有會員 follower_count 欄位的總和。
~~~~sql
select sum(follower_count) as follower_count欄位總和 from member;
~~~~
![](https://img.onl/jNysmb)

* 取得 member 資料表中，所有會員 follower_count 欄位的平均數。
~~~~sql
select avg(follower_count) as follower_count欄位平均 from member;
~~~~
![](https://img.onl/U6WALt)

## 要求五
*  在資料庫中，建立新資料表紀錄留言資訊，取名字為 message。資料表中必須包含以
下欄位設定：
~~~~sql
create table message(
id bigint primary key auto_increment,
member_id bigint not null ,
content varchar(255) not null,
like_count int unsigned not null default 0,
time datetime not null default now(),
foreign key(member_id) references member(id)
);

insert into message(member_id,content,like_count) values(1,'滑起來囉寶貝',500);
insert into message(member_id,content,like_count) values(2,'一刀殺進去',800);
insert into message(member_id,content,like_count) values(3,'喔是喔真的假的555',10);
insert into message(member_id,content,like_count) values(4,'靠我力量!',1000);
insert into message(member_id,content,like_count) values(5,'這個叫什麼!',1200);
select * from message;
~~~~
![](https://img.onl/22GLmL)

* 使用SELECT搭配JOIN語法，取得所有留言，結果須包含留言者會員的姓名。
~~~~sql
select member.name,message.content from member inner join message on member.id=message.member_id;
~~~~
![](https://img.onl/5wCcP6)

* 使用 SELECT 搭配 JOIN 語法，取得 member 資料表中欄位 username 是 test 的所有
留言，資料中須包含留言者會員的姓名。
~~~~sql
select member.name,message.content from member inner join message on member.id=message.member_id where username='test';
~~~~
![](https://img.onl/IhANSU)

* 使用 SELECT、SQL Aggregate Functions 搭配 JOIN 語法，取得 member 資料表中
欄位 username 是 test 的所有留言平均按讚數。
~~~~sql
select avg(like_count) as test留言平均按讚數 from member inner join message on member.id=message.member_id where username='test';
~~~~
![](https://img.onl/cuH4S4)
