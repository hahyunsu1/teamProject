drop sequence animalcare_board_seq;
drop table animalcare_board;

/* �������� */
CREATE TABLE animalcare_board (
   num NUMBER(8) NOT NULL, /* �۹�ȣ */
   nick_fk VARCHAR2(30), /* �г��� */
   passwd VARCHAR2(20), /* �ۺ�й�ȣ */
   subject VARCHAR2(200), /* ������ */
   content VARCHAR2(2000), /* �۳��� */
   wdate DATE, /* �ۼ��� */
   readnum NUMBER(8), /* ��ȸ�� */
   filename VARCHAR2(500), /* ÷�����ϸ� */
   originFilename VARCHAR2(200), /* �������ϸ� */
   filesize NUMBER(8), /* ÷������ ũ�� */
   refer NUMBER(8), /* �� �׷� ��ȣ */
   lev NUMBER(8), /* �亯 ���� */
   sunbun NUMBER(8) /* ���� �׷� ���� ���� */
);

COMMENT ON TABLE animalcare_board IS '��������';

COMMENT ON COLUMN animalcare_board.num IS '�۹�ȣ';

COMMENT ON COLUMN animalcare_board.nick_fk IS '�г���';

COMMENT ON COLUMN animalcare_board.passwd IS '�ۺ�й�ȣ';

COMMENT ON COLUMN animalcare_board.subject IS '������';

COMMENT ON COLUMN animalcare_board.content IS '�۳���';

COMMENT ON COLUMN animalcare_board.wdate IS '�ۼ���';

COMMENT ON COLUMN animalcare_board.readnum IS '��ȸ��';

COMMENT ON COLUMN animalcare_board.filename IS '÷�����ϸ�';

COMMENT ON COLUMN animalcare_board.originFilename IS '�������ϸ�';

COMMENT ON COLUMN animalcare_board.filesize IS '÷������ ũ��';

COMMENT ON COLUMN animalcare_board.refer IS '�� �׷� ��ȣ';

COMMENT ON COLUMN animalcare_board.lev IS '�亯 ����';

COMMENT ON COLUMN animalcare_board.sunbun IS '���� �׷� ���� ����';

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