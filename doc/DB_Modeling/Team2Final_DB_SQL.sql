/* Board */
DROP TABLE Board 
	CASCADE CONSTRAINTS;

/* FreeBoard */
DROP TABLE FreeBoard 
	CASCADE CONSTRAINTS;

/* Reply */
DROP TABLE Reply 
	CASCADE CONSTRAINTS;

/* BoardList */
DROP TABLE BoardList 
	CASCADE CONSTRAINTS;

/* BoardType */
DROP TABLE BoardType 
	CASCADE CONSTRAINTS;

/* Photo */
DROP TABLE Photo 
	CASCADE CONSTRAINTS;

/* Member */
DROP TABLE Member 
	CASCADE CONSTRAINTS;

/* MyTravelList */
DROP TABLE MTList 
	CASCADE CONSTRAINTS;

/* MyTravelListContent */
DROP TABLE MTLContent 
	CASCADE CONSTRAINTS;

/* NoticeBoard */
DROP TABLE NoticeBoard 
	CASCADE CONSTRAINTS;

/* MyCourseBoard */
DROP TABLE MCBoard 
	CASCADE CONSTRAINTS;

/* LikeMemberList */
DROP TABLE LMList 
	CASCADE CONSTRAINTS;

/* QnABoard */
DROP TABLE NoticeBoard2 
	CASCADE CONSTRAINTS;

/* Board */
CREATE TABLE Board (
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	Title VARCHAR2(100) NOT NULL, /* ������ */
	Content VARCHAR2(4000) NOT NULL, /* �۳��� */
	WDate TIMESTAMP DEFAULT SYSTIMESTAMP, /* �ۼ��� */
	RNum NUMBER NOT NULL, /* ��ȸ�� */
	BCode NUMBER NOT NULL /* �Խ����ڵ� */
);

COMMENT ON TABLE Board IS 'Board';

COMMENT ON COLUMN Board.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN Board.ID IS '���̵�';

COMMENT ON COLUMN Board.Title IS '������';

COMMENT ON COLUMN Board.Content IS '�۳���';

COMMENT ON COLUMN Board.WDate IS '�ۼ���';

COMMENT ON COLUMN Board.RNum IS '��ȸ��';

COMMENT ON COLUMN Board.BCode IS '�Խ����ڵ�';

CREATE UNIQUE INDEX PK_Board
	ON Board (
		BIDX ASC
	);

ALTER TABLE Board
	ADD
		CONSTRAINT PK_Board
		PRIMARY KEY (
			BIDX
		);

/* FreeBoard */
CREATE TABLE FreeBoard (
	FIdx NUMBER NOT NULL, /* �����Խ��ǽĺ���ȣ */
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	Refer NUMBER NOT NULL, /* �׷��ȣ */
	Depth NUMBER NOT NULL, /* ���̹�ȣ */
	Step NUMBER NOT NULL /* ���ܹ�ȣ */
);

COMMENT ON TABLE FreeBoard IS 'FreeBoard';

COMMENT ON COLUMN FreeBoard.FIdx IS '�����Խ��ǽĺ���ȣ';

COMMENT ON COLUMN FreeBoard.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN FreeBoard.Refer IS '�׷��ȣ';

COMMENT ON COLUMN FreeBoard.Depth IS '���̹�ȣ';

COMMENT ON COLUMN FreeBoard.Step IS '���ܹ�ȣ';

CREATE UNIQUE INDEX PK_FreeBoard
	ON FreeBoard (
		FIdx ASC
	);

ALTER TABLE FreeBoard
	ADD
		CONSTRAINT PK_FreeBoard
		PRIMARY KEY (
			FIdx
		);

/* Reply */
CREATE TABLE Reply (
	RIdx NUMBER NOT NULL, /* ��۽ĺ���ȣ */
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	RContent VARCHAR2(500) NOT NULL, /* ��۳��� */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	RWDate TIMESTAMP DEFAULT SYSTIMESTAMP /* �ۼ��� */
);

COMMENT ON TABLE Reply IS 'Reply';

COMMENT ON COLUMN Reply.RIdx IS '��۽ĺ���ȣ';

COMMENT ON COLUMN Reply.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN Reply.RContent IS '��۳���';

COMMENT ON COLUMN Reply.ID IS '���̵�';

COMMENT ON COLUMN Reply.RWDate IS '�ۼ���';

CREATE UNIQUE INDEX PK_Reply
	ON Reply (
		RIdx ASC
	);

ALTER TABLE Reply
	ADD
		CONSTRAINT PK_Reply
		PRIMARY KEY (
			RIdx
		);

/* BoardList */
CREATE TABLE BoardList (
	BCode NUMBER NOT NULL, /* �Խ����ڵ� */
	BName VARCHAR2(50) NOT NULL, /* �Խ��� �̸� */
	BType NUMBER NOT NULL /* �Խ������Ĺ�ȣ */
);

COMMENT ON TABLE BoardList IS 'BoardList';

COMMENT ON COLUMN BoardList.BCode IS '�Խ����ڵ�';

COMMENT ON COLUMN BoardList.BName IS '�Խ��� �̸�';

COMMENT ON COLUMN BoardList.BType IS '�Խ������Ĺ�ȣ';

CREATE UNIQUE INDEX PK_BoardList
	ON BoardList (
		BCode ASC
	);

ALTER TABLE BoardList
	ADD
		CONSTRAINT PK_BoardList
		PRIMARY KEY (
			BCode
		);

/* BoardType */
CREATE TABLE BoardType (
	BType NUMBER NOT NULL, /* �Խ������Ĺ�ȣ */
	BTypeName VARCHAR2(50) NOT NULL /* �Խ��������̸� */
);

COMMENT ON TABLE BoardType IS 'BoardType';

COMMENT ON COLUMN BoardType.BType IS '�Խ������Ĺ�ȣ';

COMMENT ON COLUMN BoardType.BTypeName IS '�Խ��������̸�';

CREATE UNIQUE INDEX PK_BoardType
	ON BoardType (
		BType ASC
	);

ALTER TABLE BoardType
	ADD
		CONSTRAINT PK_BoardType
		PRIMARY KEY (
			BType
		);

/* Photo */
CREATE TABLE Photo (
	PhotoId NUMBER NOT NULL, /* �����ڷ� �ĺ���ȣ */
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	PhotoName VARCHAR2(50) NOT NULL /* ��������̸� */
);

COMMENT ON TABLE Photo IS 'Photo';

COMMENT ON COLUMN Photo.PhotoId IS '�����ڷ� �ĺ���ȣ';

COMMENT ON COLUMN Photo.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN Photo.PhotoName IS '��������̸�';

CREATE UNIQUE INDEX PK_Photo
	ON Photo (
		PhotoId ASC
	);

ALTER TABLE Photo
	ADD
		CONSTRAINT PK_Photo
		PRIMARY KEY (
			PhotoId
		);

/* Member */
CREATE TABLE Member (
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	PWD VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	Name VARCHAR2(15) NOT NULL, /* �̸� */
	Birth CHAR(6), /* ������� */
	HireDate DATE DEFAULT SYSDATE, /* ������ */
	Gender CHAR(1), /* ���� */
	Address VARCHAR2(50), /* �ּ� */
	Email VARCHAR2(100), /* �̸��� */
	Kakao CHAR(1), /* īī�������������� */
	isAdmin CHAR(1) NOT NULL /* �����ڿ��� */
);

COMMENT ON TABLE Member IS 'Member';

COMMENT ON COLUMN Member.ID IS '���̵�';

COMMENT ON COLUMN Member.PWD IS '��й�ȣ';

COMMENT ON COLUMN Member.Name IS '�̸�';

COMMENT ON COLUMN Member.Birth IS '�������';

COMMENT ON COLUMN Member.HireDate IS '������';

COMMENT ON COLUMN Member.Gender IS '����';

COMMENT ON COLUMN Member.Address IS '�ּ�';

COMMENT ON COLUMN Member.Email IS '�̸���';

COMMENT ON COLUMN Member.Kakao IS 'īī��������������';

COMMENT ON COLUMN Member.isAdmin IS '�����ڿ���';

CREATE UNIQUE INDEX PK_Member
	ON Member (
		ID ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			ID
		);

/* MyTravelList */
CREATE TABLE MTList (
	TLIdx NUMBER NOT NULL, /* ���ฮ��Ʈ�ĺ���ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	TLName VARCHAR2(50) NOT NULL /* ����Ʈ�̸� */
);

COMMENT ON TABLE MTList IS 'MyTravelList';

COMMENT ON COLUMN MTList.TLIdx IS '���ฮ��Ʈ�ĺ���ȣ';

COMMENT ON COLUMN MTList.ID IS '���̵�';

COMMENT ON COLUMN MTList.TLName IS '����Ʈ�̸�';

CREATE UNIQUE INDEX PK_MTList
	ON MTList (
		TLIdx ASC
	);

ALTER TABLE MTList
	ADD
		CONSTRAINT PK_MTList
		PRIMARY KEY (
			TLIdx
		);

/* MyTravelListContent */
CREATE TABLE MTLContent (
	TLCIdx NUMBER NOT NULL, /* ���ฮ��Ʈ����ĺ���ȣ */
	TLIdx NUMBER NOT NULL, /* ���ฮ��Ʈ�ĺ���ȣ */
	SpotName VARCHAR2(50) NOT NULL, /* ������ �̸� */
	Image VARCHAR2(200), /* ��ǥ�̹���(�̹����ҽ���ũ) */
	SpotDate DATE, /* ��¥ */
	SpotAddr VARCHAR2(50) NOT NULL, /* ��� */
	SpotLink VARCHAR2(200) /* ��������Ʈ */
);

COMMENT ON TABLE MTLContent IS 'MyTravelListContent';

COMMENT ON COLUMN MTLContent.TLCIdx IS '���ฮ��Ʈ����ĺ���ȣ';

COMMENT ON COLUMN MTLContent.TLIdx IS '���ฮ��Ʈ�ĺ���ȣ';

COMMENT ON COLUMN MTLContent.SpotName IS '������ �̸�';

COMMENT ON COLUMN MTLContent.Image IS '��ǥ�̹���(�̹����ҽ���ũ)';

COMMENT ON COLUMN MTLContent.SpotDate IS '��¥';

COMMENT ON COLUMN MTLContent.SpotAddr IS '���';

COMMENT ON COLUMN MTLContent.SpotLink IS '��������Ʈ';

CREATE UNIQUE INDEX PK_MTLContent
	ON MTLContent (
		TLCIdx ASC
	);

ALTER TABLE MTLContent
	ADD
		CONSTRAINT PK_MTLContent
		PRIMARY KEY (
			TLCIdx
		);

/* NoticeBoard */
CREATE TABLE NoticeBoard (
	NIdx NUMBER NOT NULL, /* �������װԽ��ǽĺ���ȣ */
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	isTop CHAR(1) NOT NULL /* �����ġ���� */
);

COMMENT ON TABLE NoticeBoard IS 'NoticeBoard';

COMMENT ON COLUMN NoticeBoard.NIdx IS '�������װԽ��ǽĺ���ȣ';

COMMENT ON COLUMN NoticeBoard.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN NoticeBoard.isTop IS '�����ġ����';

CREATE UNIQUE INDEX PK_NoticeBoard
	ON NoticeBoard (
		NIdx ASC
	);

ALTER TABLE NoticeBoard
	ADD
		CONSTRAINT PK_NoticeBoard
		PRIMARY KEY (
			NIdx
		);

/* MyCourseBoard */
CREATE TABLE MCBoard (
	MCIdx NUMBER NOT NULL, /* �������ڽ��Խ��ǽĺ���ȣ */
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	LikeNum NUMBER NOT NULL /* ��õ�� */
);

COMMENT ON TABLE MCBoard IS 'MyCourseBoard';

COMMENT ON COLUMN MCBoard.MCIdx IS '�������ڽ��Խ��ǽĺ���ȣ';

COMMENT ON COLUMN MCBoard.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN MCBoard.LikeNum IS '��õ��';

CREATE UNIQUE INDEX PK_MCBoard
	ON MCBoard (
		MCIdx ASC
	);

ALTER TABLE MCBoard
	ADD
		CONSTRAINT PK_MCBoard
		PRIMARY KEY (
			MCIdx
		);

/* LikeMemberList */
CREATE TABLE LMList (
	MCIdx NUMBER, /* �������ڽ��Խ��ǽĺ���ȣ */
	ID VARCHAR2(20), /* ���̵� */
	isLike CHAR(1) /* ��õ���� */
);

COMMENT ON TABLE LMList IS 'LikeMemberList';

COMMENT ON COLUMN LMList.MCIdx IS '�������ڽ��Խ��ǽĺ���ȣ';

COMMENT ON COLUMN LMList.ID IS '���̵�';

COMMENT ON COLUMN LMList.isLike IS '��õ����';

/* QnABoard */
CREATE TABLE NoticeBoard2 (
	NIdx NUMBER NOT NULL, /* �������װԽ��ǽĺ���ȣ */
	BIDX NUMBER NOT NULL, /* �۹�ȣ */
	isPublic CHAR(1) NOT NULL /* �������� */
);

COMMENT ON TABLE NoticeBoard2 IS 'QnABoard';

COMMENT ON COLUMN NoticeBoard2.NIdx IS '�������װԽ��ǽĺ���ȣ';

COMMENT ON COLUMN NoticeBoard2.BIDX IS '�۹�ȣ';

COMMENT ON COLUMN NoticeBoard2.isPublic IS '��������';

CREATE UNIQUE INDEX PK_NoticeBoard2
	ON NoticeBoard2 (
		NIdx ASC
	);

ALTER TABLE NoticeBoard2
	ADD
		CONSTRAINT PK_NoticeBoard2
		PRIMARY KEY (
			NIdx
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_BoardList_TO_Board
		FOREIGN KEY (
			BCode
		)
		REFERENCES BoardList (
			BCode
		);

ALTER TABLE Board
	ADD
		CONSTRAINT FK_Member_TO_Board
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		);

ALTER TABLE FreeBoard
	ADD
		CONSTRAINT FK_Board_TO_FreeBoard
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		);

ALTER TABLE Reply
	ADD
		CONSTRAINT FK_Board_TO_Reply
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		);

ALTER TABLE Reply
	ADD
		CONSTRAINT FK_Member_TO_Reply
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		);

ALTER TABLE BoardList
	ADD
		CONSTRAINT FK_BoardType_TO_BoardList
		FOREIGN KEY (
			BType
		)
		REFERENCES BoardType (
			BType
		);

ALTER TABLE Photo
	ADD
		CONSTRAINT FK_Board_TO_Photo
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		);

ALTER TABLE MTList
	ADD
		CONSTRAINT FK_Member_TO_MTList
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		);

ALTER TABLE MTLContent
	ADD
		CONSTRAINT FK_MTList_TO_MTLContent
		FOREIGN KEY (
			TLIdx
		)
		REFERENCES MTList (
			TLIdx
		);

ALTER TABLE NoticeBoard
	ADD
		CONSTRAINT FK_Board_TO_NoticeBoard
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		);

ALTER TABLE MCBoard
	ADD
		CONSTRAINT FK_Board_TO_MCBoard
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		);

ALTER TABLE LMList
	ADD
		CONSTRAINT FK_MCBoard_TO_LMList
		FOREIGN KEY (
			MCIdx
		)
		REFERENCES MCBoard (
			MCIdx
		);

ALTER TABLE LMList
	ADD
		CONSTRAINT FK_Member_TO_LMList
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		);

ALTER TABLE NoticeBoard2
	ADD
		CONSTRAINT FK_Board_TO_NoticeBoard2
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		);
		
/* INIT DATA */		
INSERT INTO BOARDTYPE(BTYPE,BTYPENAME) VALUES(10, '�Ϲ�');
INSERT INTO BOARDTYPE(BTYPE,BTYPENAME) VALUES(20, '����');
INSERT INTO BOARDTYPE(BTYPE,BTYPENAME) VALUES(30, '����');

INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(1, 10, '��������');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(2, 10, 'QnA');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(3, 10, '������ �ڽ�');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(4, 20, '�����Խ���');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(5, 30, '����Խ���');

INSERT INTO MEMBER (ID, NAME, PWD, ISADMIN) VALUES('admin','������', '1004', 1);
COMMIT;		

CREATE SEQUENCE BIdx_SEQ;--�Խ���
CREATE SEQUENCE FIdx_SEQ;--�����Խ���
CREATE SEQUENCE QIdx_SEQ;--QnA�Խ���
CREATE SEQUENCE NIdx_SEQ;--�������װԽ���
CREATE SEQUENCE MCIdx_SEQ;--�������ڽ� �Խ���
CREATE SEQUENCE TLIdx_SEQ;--���ǿ��ฮ��Ʈ
CREATE SEQUENCE TLCIdx_SEQ;--���ǿ��ฮ��Ʈ ����
CREATE SEQUENCE RIdx_SEQ;--���
CREATE SEQUENCE PhotoId_SEQ;--����
COMMIT;