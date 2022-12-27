desc hospital_board

create sequence hospital_board_seq
start with 1
increment by 1
nocache; 

drop sequence hospital_board_seq

DROP INDEX hospital_board;

/* �������� */
DROP TABLE hospital_board
   CASCADE CONSTRAINTS;

/* �������� */
CREATE TABLE hospital_board(
   cnum NUMBER(8) NOT NULL, /* �۹�ȣ */
   nick_fk VARCHAR2(30), /* �г��� */
   cpss VARCHAR2(20), /* �ۺ�й�ȣ */
   title VARCHAR2(200), /* ������ */
   content VARCHAR2(2000), /* �۳��� */
   wdate DATE, /* �ۼ��� */
   cnt NUMBER(8), /* ��ȸ�� */
   filename VARCHAR2(500), /* ÷�����ϸ� */
   old_filename VARCHAR2(200), /* �������ϸ� */
   filesize NUMBER(8) /* ÷������ ũ�� */
);

COMMENT ON TABLE hospital_board IS '��������';

COMMENT ON COLUMN hospital_board.cnum IS '�۹�ȣ';

COMMENT ON COLUMN hospital_board.nick_fk IS '�г���';

COMMENT ON COLUMN hospital_board.cpss IS '�ۺ�й�ȣ';

COMMENT ON COLUMN hospital_board.title IS '������';

COMMENT ON COLUMN hospital_board.content IS '�۳���';

COMMENT ON COLUMN hospital_board.wdate IS '�ۼ���';

COMMENT ON COLUMN hospital_board.cnt IS '��ȸ��';

COMMENT ON COLUMN hospital_board.filename IS '÷�����ϸ�';

COMMENT ON COLUMN hospital_board.old_filename IS '�������ϸ�';

COMMENT ON COLUMN hospital_board.filesize IS '÷������ ũ��';

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
      