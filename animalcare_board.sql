drop sequence animalcare_board_seq;
drop table animalcare_board;

/* 동물육아 */
CREATE TABLE animalcare_board (
   num NUMBER(8) NOT NULL, /* 글번호 */
   nick_fk VARCHAR2(30), /* 닉네임 */
   passwd VARCHAR2(20), /* 글비밀번호 */
   subject VARCHAR2(200), /* 글제목 */
   content VARCHAR2(2000), /* 글내용 */
   wdate DATE, /* 작성일 */
   readnum NUMBER(8), /* 조회수 */
   filename VARCHAR2(500), /* 첨부파일명 */
   originFilename VARCHAR2(200), /* 원본파일명 */
   filesize NUMBER(8), /* 첨부파일 크기 */
   refer NUMBER(8), /* 글 그룹 번호 */
   lev NUMBER(8), /* 답변 레벨 */
   sunbun NUMBER(8) /* 같은 그룹 내의 순서 */
);

COMMENT ON TABLE animalcare_board IS '동물육아';

COMMENT ON COLUMN animalcare_board.num IS '글번호';

COMMENT ON COLUMN animalcare_board.nick_fk IS '닉네임';

COMMENT ON COLUMN animalcare_board.passwd IS '글비밀번호';

COMMENT ON COLUMN animalcare_board.subject IS '글제목';

COMMENT ON COLUMN animalcare_board.content IS '글내용';

COMMENT ON COLUMN animalcare_board.wdate IS '작성일';

COMMENT ON COLUMN animalcare_board.readnum IS '조회수';

COMMENT ON COLUMN animalcare_board.filename IS '첨부파일명';

COMMENT ON COLUMN animalcare_board.originFilename IS '원본파일명';

COMMENT ON COLUMN animalcare_board.filesize IS '첨부파일 크기';

COMMENT ON COLUMN animalcare_board.refer IS '글 그룹 번호';

COMMENT ON COLUMN animalcare_board.lev IS '답변 레벨';

COMMENT ON COLUMN animalcare_board.sunbun IS '같은 그룹 내의 순서';

CREATE UNIQUE INDEX PK_animalcare_board
   ON animalcare_board (
      num ASC
   );

ALTER TABLE animalcare_board
   ADD
      CONSTRAINT PK_animalcare_board
      PRIMARY KEY (
         num
      );
      
create sequence animalcare_board_seq
start with 1
increment by 1
nocache;

commit;