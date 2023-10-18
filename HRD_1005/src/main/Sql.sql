DROP TABLE TBL_VOTE_202005;


create table TBL_VOTE_202005(
	V_JUMIN CHAR(13) NOT NULL PRIMARY KEY,
	V_NAME VARCHAR2(20) ,
	M_NO CHAR(1),
	V_TIME CHAR(4) ,
	V_AREA CHAR(20) ,
	V_CONFIRM CHAR(1)
);

CREATE TABLE TBL_MEMBER_202005 (
    M_NO CHAR(1) NOT NULL PRIMARY KEY,
    M_NAME VARCHAR2(20),
    P_CODE CHAR(2),      
    P_SCHOOL CHAR(1),    
    M_JUMIN CHAR(13),    
    M_CITY VARCHAR2(20) 
);



SELECT * FROM TBL_VOTE_202005;
SELECT * FROM TBL_MEMBER_202005;
SELECT * FROM TBL_PARTY_202005;

insert into TBL_VOTE_202005 values('99010110001','김유권' ,'1','0930','제1투표장','N');
insert into TBL_VOTE_202005 values('89010120002','이유권' ,'2','0930','제1투표장','N');
insert into TBL_VOTE_202005 values('69010110003','박유권' ,'3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('59010120004','홍유권' ,'4','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('79010110005','조유권' ,'5','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('89010120001','최유권' ,'1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('59010110007','지유권' ,'1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('49010120008','장유권' ,'3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('79010110009','정유권' ,'3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('89010120010','강유권' ,'4','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('99010110011','신유권' ,'5','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('79010110012','오유권' ,'1','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('69010110013','현유권' ,'4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('89010110014','왕유권' ,'2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('99010110015','유유권' ,'3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('79010110016','한유권' ,'2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('99010110017','문유권' ,'4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('89010110018','양유권' ,'2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('99010110019','구유권' ,'4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('79010110020','황유권' ,'5','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('69010110021','배유권' ,'3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('79010110022','전유권' ,'3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('99010110023','고유권' ,'1','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('59010110024','권유권' ,'3','1330','제2투표장','Y');


insert into TBL_MEMBER_202005 values('1','김후보' ,'P1','1','6603011999991','수선화동');
insert into TBL_MEMBER_202005 values('2','이후보' ,'P2','3','5503011999992','민들레동');
insert into TBL_MEMBER_202005 values('3','박후보' ,'P3','2','7703011999993','나딸꽃동');
insert into TBL_MEMBER_202005 values('4','조후보' ,'P4','2','8803011999994','진달래동');
insert into TBL_MEMBER_202005 values('5','최후보' ,'P5','3','9903011999995','개나리동');






CREATE TABLE TBL_PARTY_202005 (
    P_CODE CHAR(2) NOT NULL PRIMARY KEY,
    P_NAME VARCHAR2(20),
    P_INDATE DATE,
    P_READER VARCHAR2(20),
    P_TEL1 CHAR(3),
    P_TEL2 CHAR(4),
    P_TEL3 CHAR(4)
);

insert into TBL_PARTY_202005 values('P1','A정당' ,'2010-01-01','위대포','02','1111','0001');
insert into TBL_PARTY_202005 values('P2','B정당' ,'2010-02-01','명대포','02','1111','0002');
insert into TBL_PARTY_202005 values('P3','C정당' ,'2010-03-01','기대표','02','1111','0003');
insert into TBL_PARTY_202005 values('P4','D정당' ,'2010-04-01','옥대표','02','1111','0004');
insert into TBL_PARTY_202005 values('P5','E정당' ,'2010-05-01','임대표','02','1111','0005');


SELECT M.M_NO, M.M_NAME, P.P_NAME, 
    CASE M.P_SCHOOL
        WHEN '1' THEN '고졸'
        WHEN '2' THEN '학사'
        WHEN '3' THEN '석사'
        WHEN '4' THEN '박사'
    END AS P_SCHOOL, 
    SUBSTR(M.M_JUMIN, 1, 6) ||'-'|| 
    SUBSTR(M.M_JUMIN, 7, 13) AS B_JUMIN, 
    M.M_CITY, 
    P.P_TEL1 || '-' || P.P_TEL2 || '-' || P.P_TEL3 AS P_TEL 
FROM TBL_MEMBER_202005 M, TBL_PARTY_202005 P 
WHERE M.P_CODE = P.P_CODE;

select V_NAME as 성명, '19' substr(V_JUMIN,1,2) '년' substr(V_JUMIN,3,2) '월' substr(V_JUMIN,5,2) '일생' as 생년월일,
          '만 '  trunc(months_between(SYSDATE, to_date(substr('19'  V_JUMIN,1,8), 'yyyymmdd'))/12)  '세' as 나이,
          case when substr(V_JUMIN,7,1) = '1' then '남' else '여'end as 성별, M_NO as 후보번호, substr(V_TIME, 1,2) ':'|| substr(V_TIME, 3,2) as 투표시간,
          case when V_CONFIRM = 'Y' then '확인' else '미확인' end as 유권자확인 
from tbl_vote_202005

SELECT V.D

from TBL_VOTE_202005 V, TBL_MEMBER_202005 M





	








