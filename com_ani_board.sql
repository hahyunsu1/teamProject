/* ���� */
DROP TABLE com_ani_board 
   CASCADE CONSTRAINTS;

/* ���� */
CREATE TABLE com_ani_board (
   cnum NUMBER(8) NOT NULL, /* �۹�ȣ */
   nick_fk VARCHAR2(30) NOT NULL, /* �г��� */
   cpass VARCHAR2(20), /* �ۺ�й�ȣ */
   title VARCHAR2(200) NOT NULL, /* ������ */
   content VARCHAR2(2000), /* �۳��� */
   wdate DATE default sysdate, /* �ۼ��� */
   cnt NUMBER(8) default 0, /* ��ȸ�� */
   filename VARCHAR2(500), /* ÷�����ϸ� */
   originFilename VARCHAR2(500), /* �������ϸ� */
   filesize NUMBER(8), /* ÷������ ũ�� */
   pet VARCHAR2(30), /* ���� */
   price NUMBER(8), /* ����(���û���) */
   myaddr VARCHAR2(30) /* �����ٵ��� */
);

COMMENT ON TABLE com_ani_board IS '����';



COMMENT ON COLUMN com_ani_board.cnum IS '�۹�ȣ';

COMMENT ON COLUMN com_ani_board.nick_fk IS '�г���';

COMMENT ON COLUMN com_ani_board.cpss IS '�ۺ�й�ȣ';

COMMENT ON COLUMN com_ani_board.title IS '������';

COMMENT ON COLUMN com_ani_board.content IS '�۳���';

COMMENT ON COLUMN com_ani_board.wdate IS '�ۼ���';

COMMENT ON COLUMN com_ani_board.cnt IS '��ȸ��';

COMMENT ON COLUMN com_ani_board.filename IS '÷�����ϸ�';

COMMENT ON COLUMN com_ani_board.old_filename IS '�������ϸ�';

COMMENT ON COLUMN com_ani_board.filesize IS '÷������ ũ��';

COMMENT ON COLUMN com_ani_board.pet IS '����';

COMMENT ON COLUMN com_ani_board.price IS '����(���û���)';

COMMENT ON COLUMN com_ani_board.myaddr IS '�����ٵ���';

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