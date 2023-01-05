/* 돌봄 */
DROP TABLE com_ani_board 
   CASCADE CONSTRAINTS;

/* 돌봄 */
CREATE TABLE com_ani_board (
   cnum NUMBER(8) NOT NULL, /* 글번호 */
   nick_fk VARCHAR2(30) NOT NULL, /* 닉네임 */
   cpass VARCHAR2(20), /* 글비밀번호 */
   title VARCHAR2(200) NOT NULL, /* 글제목 */
   content VARCHAR2(2000), /* 글내용 */
   wdate DATE default sysdate, /* 작성일 */
   cnt NUMBER(8) default 0, /* 조회수 */
   filename VARCHAR2(500), /* 첨부파일명 */
   originFilename VARCHAR2(500), /* 원본파일명 */
   filesize NUMBER(8), /* 첨부파일 크기 */
   pet VARCHAR2(30), /* 동물 */
   price NUMBER(8), /* 가격(선택사항) */
   myaddr VARCHAR2(30) /* 보여줄동네 */
);

COMMENT ON TABLE com_ani_board IS '돌봄';



COMMENT ON COLUMN com_ani_board.cnum IS '글번호';

COMMENT ON COLUMN com_ani_board.nick_fk IS '닉네임';

COMMENT ON COLUMN com_ani_board.cpss IS '글비밀번호';

COMMENT ON COLUMN com_ani_board.title IS '글제목';

COMMENT ON COLUMN com_ani_board.content IS '글내용';

COMMENT ON COLUMN com_ani_board.wdate IS '작성일';

COMMENT ON COLUMN com_ani_board.cnt IS '조회수';

COMMENT ON COLUMN com_ani_board.filename IS '첨부파일명';

COMMENT ON COLUMN com_ani_board.old_filename IS '원본파일명';

COMMENT ON COLUMN com_ani_board.filesize IS '첨부파일 크기';

COMMENT ON COLUMN com_ani_board.pet IS '동물';

COMMENT ON COLUMN com_ani_board.price IS '가격(선택사항)';

COMMENT ON COLUMN com_ani_board.myaddr IS '보여줄동네';

CREATE UNIQUE INDEX PK_com_ani_board
   ON com_ani_board (
      cnum ASC
   );

ALTER TABLE com_ani_board
   ADD
      CONSTRAINT PK_com_ani_board
      PRIMARY KEY (
         cnum
      );
      
DROP TABLE com_ani_board_seq
   CASCADE CONSTRAINTS;
   
create sequence com_ani_board_seq
start with 1
increment by 1
nocache;

create user animal identified by 123456;

grant connect,resource,dba to animal;

select * from com_ani_board;

select * from
(select row_number() over(order by cnum desc) rn,
com_ani_board.* from com_ani_board)		
where rn >0 and rn<6;
        
select count(cnum) from com_ani_board;