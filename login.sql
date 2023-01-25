select * from members;

select name, userid, status, nick from members 
where userid='test2' and pwd='test2';

update MEMBERS SET STATUS = 99 WHERE userid='admin';

alter table MEMBERS modify pwd varchar2(100);