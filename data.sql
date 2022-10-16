SHOW DATABASES;
create database website;
use website;
show tables;
create table member(
id bigint primary key auto_increment,
name varchar(255) not null,
username varchar(255) not null,
password varchar(255) not null,
follower_count int unsigned not null default 0,
time datetime not null default now()
);

insert into member(name,username,password,follower_count) values('任','test','test',100);
insert into member(name,username,password,follower_count,time) values('與','yu','yu',500,'2000-01-31 00:30:15');
insert into member(name,username,password,follower_count,time) values('陳','chen','chen',50,'2018-08-28 08:48:48');
insert into member(name,username,password,follower_count,time) values('晨','chenchen','chenchen',800,'2020-02-09 14:09:15');
insert into member(name,username,password,follower_count,time) values('芯','xin','xin',1000,'2004-06-16 06:30:30');
select * from member;

select * from member order by time desc;
select * from member order by time desc limit 1,3;
select * from member where username='test' and password='test';
update member set name='test2' where username='test';

select count(*) as 總共有幾筆資料 from member;
select sum(follower_count) as follower_count欄位總和 from member;
select avg(follower_count) as follower_count欄位平均 from member;

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

select member.name,message.content from member inner join message on member.id=message.member_id;
select member.name,message.content from member inner join message on member.id=message.member_id where username='test';
select avg(like_count) as test留言平均按讚數 from member inner join message on member.id=message.member_id where username='test';
