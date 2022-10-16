##要求三

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

![GITHUB](https://img.onl/r3bpe4)

* 使用 SELECT 指令取得所有在 member 資料表中的會員資料，並按照 time 欄位，由近到遠排序。
~~~~sql
select * from member order by time desc;
~~~~
![GITHUB](https://img.onl/LURHSL)

* 使用 SELECT 指令取得 member 資料表中第 2 ~ 4 共三筆資料，並按照 time 欄位，由近到遠排序。
<font color=red>(並非編號 2、3、4 的資料，而是排序後的第2 ~ 4筆資料)</font>
