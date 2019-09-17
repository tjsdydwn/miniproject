CREATE USER java IDENTIFIED BY dkdlxl;
GRANT CONNECT, DBA, RESOURCE to java;

CREATE TABLE servlet_member(
    name varchar2(30) not null,
    id varchar2(30) primary key,
    pwd varchar2(30) not null,
    gender varchar2(3),
    email1 varchar2(20),
    email2 varchar2(20),
    tel1 varchar2(10),
    tel2 varchar2(10),
    tel3 varchar2(10),
    zipcode varchar2(10),
    addr1 varchar2(100),
    addr2 varchar2(100),
    logtime date
);
drop table servlet_member;

CREATE TABLE imageboard(
     seq NUMBER PRIMARY KEY,               
     imageId VARCHAR2(20) NOT NULL,     -- 상품코드  
     imageName VARCHAR2(40) NOT NULL, -- 상품명
     imagePrice  NUMBER NOT NULL,      -- 단가
     imageQty    NUMBER NOT NULL,      -- 개수
     imageContent VARCHAR2(4000) NOT NULL,      
     image1 varchar2(200),   
     logtime DATE DEFAULT SYSDATE
);
SELECT * FROM imageboard;
delete from imageboard;
commit;
drop sequence seq_imageboard;
create sequence seq_imageboard  nocache nocycle;

create table board(
    seq number primary key,
    id varchar2(20) not null,
    name varchar2(40) not null,
    email varchar2(40),
    subject varchar2(255) not null,
    content varchar2(4000) not null,
    ref number not null,
    lev number default 0 not null,
    step number default 0 not null,
    pseq number default 0 not null,
    reply number default 0 not null,
    hit number default 0,
    logtime date
);

SELECT * FROM 
		(SELECT rownum rn, tt.* FROM (SELECT * FROM board WHERE id = ord} ORDER BY ref DESC, step ASC) tt)
		WHERE rn >= #{startNum} and rn <= #{endNum}

drop table board;

create SEQUENCE seq_board nocache nocycle;