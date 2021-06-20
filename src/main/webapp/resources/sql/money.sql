create table moneynote(
	no INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email varchar(30),
	money INTEGER,
	in_out char(3),
	note varchar(20),
	iodate date,
	memo varchar(50),
	confirm char(1) default 'N'
)default CHARSET=utf8;


insert into moneynote(email, money, in_out, note, iodate, memo) values("bob1@ab.cp", 120000, "in", "5�˹ٱ޿�", "2021.04.17", "4�� �˹ٱ޿� ����2");

select * from moneynote;






drop table moneynote;
