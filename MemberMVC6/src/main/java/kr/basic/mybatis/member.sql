create database mvc05db;
use mvc05db;
drop table member;
create table member(
 num int primary key auto_increment,
 id varchar(20) not null,
 pass varchar(20) not null,
 name varchar(30) not null,
 age int not null,
 email varchar(30) not null,
 phone varchar(30) not null,
 oFileName varchar(100),
 sFileName varchar(100),
 unique key(id)
);
desc member;
select * from member;

-- insert(저장)
insert into member(id, pass, name, age, email, phone)
values('admin','admin','관리자',40,'bit@naver.com','010-1111-1111');

insert into member(id, pass, name, age, email, phone) values('test1','1111','테스트1',31,'test1@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test2','2222','테스트2',32,'test2@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test3','3333','테스트3',33,'test3@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test4','4444','테스트4',34,'test4@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test5','5555','테스트5',35,'test5@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test6','6666','테스트6',36,'test6@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test7','7777','테스트7',37,'test7@test.com','010-1111-1234');
 