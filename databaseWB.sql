
show databases;
create database wish;
use wish;
show tables;
#table1
create table usertable(userid varchar(7),firstname varchar(20),lastname varchar(25),
passwordd varchar(20),yearr varchar(4),regno varchar(10),course varchar(10),
brance varchar(20),aboutme varchar(500));

select * from usertable;

DELETE FROM usertable
WHERE userid=-100 or userid=-67 or userid=12563 or userid=12740 or userid=12956 or userid=2627 or userid=23900 or userid=16835 or userid=16835 or 16820 or userid=14897 or userid=13670 or userid=13667;

Select * from usertable where userid=13460;
SET SQL_SAFE_UPDATES = 0;

delete from usertable;

alter table usertable add primary key (userid);
desc usertable;

#table2
create table wishes(userid varchar(7),wish varchar(1000),
foreign key(userid) references usertable(userid));
desc wishes;
insert into wishes values('13472','I am searching for private room with cost of 5000 per month can someone give me information',default);
####truncate table wishes;
SELECT COUNT(*) FROM wishes;
select wish from wishes;
select wish from wishes where userid=13472;

ALTER TABLE wishes
ADD wid int auto_increment primary key;

DELETE FROM wishes
WHERE wid=1;
select * from wishes;

#table3
###drop table respond;
###truncate table respond;
create table respond
					(resid int auto_increment primary key,
					senderid varchar(7),
                    receiverid varchar(7),
                    replay varchar(500),datetimee datetime DEFAULT current_timestamp,
                    foreign key(senderid) references usertable(userid),
                    foreign key(receiverid) references usertable(userid));
insert into respond VALUES(DEFAULT,'13472','13472',"hello all",default);
desc respond;

select senderid from respond where receiverid=13472;
select * from respond;
select	* from respond where senderid=13400 and receiverid=13472 union
select * from respond where senderid=13472 and receiverid=13400 order by current_timestamp;
select	* from respond where senderid=13400 and receiverid=13472 union
select * from respond where senderid=13472 and receiverid=13400;

# we can use datetimee datetime DEFAULT current_timestamp

#table4
create table rating(rating_given_by varchar(7),rating_given_to varchar(7),rating varchar(5),
					foreign key(rating_given_by) references usertable(userid),
                    foreign key(rating_given_to) references usertable(userid),
                    primary key(rating_given_by,rating_given_to));
desc rating; 