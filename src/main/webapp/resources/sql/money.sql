create table moneynote(
	no INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email varchar(30),
	money INTEGER,
	in_out char(3),
	note varchar(20),
	iodate date,
	memo varchar(50),
	confirm char(1) default 'N'
);


insert into moneynote(email, money, in_out, note, iodate, memo) values("bob1@ab.cp", 120000, "in", "�˹ٱ޿�", "2021.04.17", "4�� �˹ٱ޿� ����sdddddddddddddddddddddddddddddddd");

select * from moneynote;






drop table moneynote;
