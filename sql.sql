create table tbl_customer (
	customerid char(4) not null primary key,
	name varchar2(20),
	jumin char(13),
	phone char(20),
	address varchar2(20),
	email varchar2(30)
);
	
create table tbl_performance (
	p_number char(5) not null primary key,
	customerid char(4),
	grade char(1),
	menucode_1 varchar2(3),
	menucode_2 varchar2(3),
	menucode_3 varchar2(3),
	visitdate number(6)
);
	
create table tbl_menu (
	menucode char(3) not null primary key,
	menuname varchar2(30),
	menutype char(1),
	price number(20)
);
	
	
	
insert into tbl_customer values ('C001', '김고객', '790102111111', '010-0000-1111', '서울시', 'kim@abc.com');
insert into tbl_customer values ('C002', '이고객', '790102111112', '010-0000-1112', '용인시', 'lee@abc.com');
insert into tbl_customer values ('C003', '박고객', '790102111113', '010-0000-1113', '성남시', 'park@abc.com');
insert into tbl_customer values ('C004', '정고객', '790102111114', '010-0000-1114', '부천시', 'jung@abc.com');
insert into tbl_customer values ('C005', '최고객', '790102111115', '010-0000-1115', '의정부시', 'choi@abc.com');	
insert into tbl_customer values ('C006', '장고객', '790102111116', '010-0000-1116', '동두천시', 'jang@abc.com');
	
insert into tbl_performance values ('1', 'C001', 'V', 'N00', 'P01', 'E00', 230801);
insert into tbl_performance values ('2', 'C002', 'G', 'N01', 'P02', 'E00', 230801);
insert into tbl_performance values ('3', 'C003', 'S', 'N00', 'P00', 'E01', 230802);
insert into tbl_performance values ('4', 'C004', 'G', 'N03', 'P03', 'E00', 230802);
insert into tbl_performance values ('5', 'C005', 'V', 'N04', 'P04', 'E00', 230803);
insert into tbl_performance values ('6', 'C006', 'S', 'N05', 'P05', 'E00', 230803);
insert into tbl_performance values ('7', 'C001', 'V', 'N00', 'P00', 'E01', 230804);
insert into tbl_performance values ('8', 'C002', 'G', 'N01', 'P00', 'E01', 230804);
	
insert into tbl_menu values ('N00', '해당없음', 'N', 0);	
insert into tbl_menu values ('N01', '풀코트', 'N', 20000);
insert into tbl_menu values ('N02', '아트/라인아트', 'N', 15000);
insert into tbl_menu values ('N03', '굴리트', 'N', 10000);
insert into tbl_menu values ('N04', '글라데이션', 'N', 10000);
insert into tbl_menu values ('N05', '프렌치', 'N', 10000);
insert into tbl_menu values ('P00', '해당없음', 'P', 0);
insert into tbl_menu values ('P01', '풀코트', 'P', 20000);
insert into tbl_menu values ('P02', '아트/라인아트', 'P', 15000);
insert into tbl_menu values ('P03', '굴리트', 'P', 10000);
insert into tbl_menu values ('P04', '글라데이션', 'P', 10000);
insert into tbl_menu values ('P05', '프렌치', 'P', 10000);
insert into tbl_menu values ('E00', '해당없음', 'E', 0);
insert into tbl_menu values ('E01', '손/발 기본 케어', 'E', 30000);

	

SELECT menucode, menuname, menutype,
TO_CHAR(price, '999,999,999') as price_price
FROM tbl_menu;



SELECT p.p_number, p.customerid, c.name, c.address, p.menucode_1, p.menucode_2, p.menucode_3, p.visitdate, m.menuname,
m2.menuname as voel, m3.menuname as zlxk, p.grade
FROM tbl_customer c
join tbl_performance p on c.customerid = p.customerid
join tbl_menu m on p.menucode_1 = m.menucode
join tbl_menu m2 on p.menucode_2 = m2.menucode
join tbl_menu m3 on p.menucode_3 = m3.menucode
order by p.p_number asc;



SELECT p.visitdate,
COUNT(*) as total,
TO_CHAR(SUM(CASE
WHEN p.grade = 'V' THEN m1.price * 0.9
WHEN p.grade = 'S' THEN m1.price * 0.8
ELSE m1.price end), '999,999,999') as to_total
from tbl_performance p
join tbl_menu m1 on p.menucode_1 = m1.menucode
where m1.menutype = 'N'
group by p.visitdate
order by p.visitdate;





































