-- member.sql : 회원정보 테이블 
drop table member
create table member (
   id varchar2(20) primary key,
   pass varchar2(20),
   name varchar2(20),
   gender number(1),
   tel varchar2(20),
   email varchar2(100),
   picture varchar2(200)
)

select * from member

delete from member where id=''

