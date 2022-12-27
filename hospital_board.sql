desc hospital_board

create sequence hospital_board_seq
start with 1
increment by 1
nocache; 

drop sequence hospital_board_seq

DROP INDEX hospital_board;

/* 병원정보 */
DROP TABLE hospital_board
   CASCADE CONSTRAINTS;

/* 병원정보 */
CREATE TABLE hospital_board(
   cnum NUMBER(8) NOT NULL, /* 글번호 */
   nick_fk VARCHAR2(30), /* 닉네임 */
   cpss VARCHAR2(20), /* 글비밀번호 */
   title VARCHAR2(200), /* 글제목 */
   content VARCHAR2(2000), /* 글내용 */
   wdate DATE, /* 작성일 */
   cnt NUMBER(8), /* 조회수 */
   filename VARCHAR2(500), /* 첨부파일명 */
   old_filename VARCHAR2(200), /* 원본파일명 */
   filesize NUMBER(8) /* 첨부파일 크기 */
);

COMMENT ON TABLE hospital_board IS '병원정보';

COMMENT ON COLUMN hospital_board.cnum IS '글번호';

COMMENT ON COLUMN hospital_board.nick_fk IS '닉네임';

COMMENT ON COLUMN hospital_board.cpss IS '글비밀번호';

COMMENT ON COLUMN hospital_board.title IS '글제목';

COMMENT ON COLUMN hospital_board.content IS '글내용';

COMMENT ON COLUMN hospital_board.wdate IS '작성일';

COMMENT ON COLUMN hospital_board.cnt IS '조회수';

COMMENT ON COLUMN hospital_board.filename IS '첨부파일명';

COMMENT ON COLUMN hospital_board.old_filename IS '원본파일명';

COMMENT ON COLUMN hospital_board.filesize IS '첨부파일 크기';

CREATE UNIQUE INDEX hospital_board
   ON hospital_board (
      cnum ASC
   );

ALTER TABLE hospital_board
   ADD
      CONSTRAINT hospital_board
      PRIMARY KEY (
         cnum
      );
      
commit
      