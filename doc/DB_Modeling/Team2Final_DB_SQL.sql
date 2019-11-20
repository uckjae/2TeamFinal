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
DROP TABLE MTL 
	CASCADE CONSTRAINTS;

/* MyTravelListContent */
DROP TABLE MTLC 
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

/* Board */
CREATE TABLE Board (
	BIDX NUMBER NOT NULL, /* 글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	Title VARCHAR2(100) NOT NULL, /* 글제목 */
	Contnent VARCHAR2(4000) NOT NULL, /* 글내용 */
	WDate DATE NOT NULL, /* 작성일 */
	RNum NUMBER NOT NULL, /* 조회수 */
	BCode NUMBER NOT NULL /* 게시판코드 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_Board
	ON Board (
		BIDX ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE Board
	ADD
		CONSTRAINT PK_Board
		PRIMARY KEY (
			BIDX
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* FreeBoard */
CREATE TABLE FreeBoard (
	FIdx NUMBER NOT NULL, /* 자유게시판식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	Refer NUMBER NOT NULL, /* 그룹번호 */
	Depth NUMBER NOT NULL, /* 깊이번호 */
	Step NUMBER NOT NULL /* 스텝번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_FreeBoard
	ON FreeBoard (
		FIdx ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE FreeBoard
	ADD
		CONSTRAINT PK_FreeBoard
		PRIMARY KEY (
			FIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* Reply */
CREATE TABLE Reply (
	RIdx NUMBER NOT NULL, /* 댓글식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	RContent VARCHAR2(500) NOT NULL, /* 댓글내용 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	RWDate DATE NOT NULL /* 작성일 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_Reply
	ON Reply (
		RIdx ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE Reply
	ADD
		CONSTRAINT PK_Reply
		PRIMARY KEY (
			RIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* BoardList */
CREATE TABLE BoardList (
	BCode NUMBER NOT NULL, /* 게시판코드 */
	BName VARCHAR2(50) NOT NULL, /* 게시판 이름 */
	BType NUMBER NOT NULL /* 게시판형식번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_BoardList
	ON BoardList (
		BCode ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE BoardList
	ADD
		CONSTRAINT PK_BoardList
		PRIMARY KEY (
			BCode
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* BoardType */
CREATE TABLE BoardType (
	BType NUMBER NOT NULL, /* 게시판형식번호 */
	BTypeName VARCHAR2(50) NOT NULL /* 게시판형식이름 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_BoardType
	ON BoardType (
		BType ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE BoardType
	ADD
		CONSTRAINT PK_BoardType
		PRIMARY KEY (
			BType
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* Photo */
CREATE TABLE Photo (
	PhotoId NUMBER NOT NULL, /* 사진자료 식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	PhotoName VARCHAR2(50) NOT NULL /* 저장사진이름 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_Photo
	ON Photo (
		PhotoId ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE Photo
	ADD
		CONSTRAINT PK_Photo
		PRIMARY KEY (
			PhotoId
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* Member */
CREATE TABLE Member (
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	PWD CHAR(15) NOT NULL, /* 비밀번호 */
	Name VARCHAR2(15) NOT NULL, /* 이름 */
	Birth CHAR(6), /* 생년월일 */
	Gender CHAR(1), /* 성별 */
	Address VARCHAR2(50), /* 주소 */
	Email VARCHAR2(100), /* 이메일 */
	HireDate Date DEFAULT SYSDATE,/* 가입일 */
	Kakao CHAR(1), /* 카카오계정연동여부 */
	isAdmin CHAR(1) NOT NULL /* 관리자여부 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_Member
	ON Member (
		ID ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			ID
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* MyTravelList */
CREATE TABLE MTL (
	TLIdx NUMBER NOT NULL, /* 여행리스트식별번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	TLName VARCHAR2(50) NOT NULL /* 리스트이름 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_MTL
	ON MTL (
		TLIdx ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE MTL
	ADD
		CONSTRAINT PK_MTL
		PRIMARY KEY (
			TLIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* MyTravelListContent */
CREATE TABLE MTLC (
	TLCIdx NUMBER NOT NULL, /* 여행리스트내용식별번호 */
	TLIdx NUMBER NOT NULL, /* 여행리스트식별번호 */
	SpotName VARCHAR2(50) NOT NULL, /* 여행지 이름 */
	Image VARCHAR2(200), /* 대표이미지(이미지소스링크) */
	SpotDate DATE, /* 날짜 */
	SpotAddr VARCHAR2(50) NOT NULL, /* 장소 */
	SpotLink VARCHAR2(200) /* 참조사이트 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_MTLC
	ON MTLC (
		TLCIdx ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE MTLC
	ADD
		CONSTRAINT PK_MTLC
		PRIMARY KEY (
			TLCIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* NoticeBoard */
CREATE TABLE NoticeBoard (
	NIdx NUMBER NOT NULL, /* 공지사항게시판식별번호 */
	BIDX NUMBER, /* 글번호 */
	isTop CHAR(1) /* 상단위치여부 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_NoticeBoard
	ON NoticeBoard (
		NIdx ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE NoticeBoard
	ADD
		CONSTRAINT PK_NoticeBoard
		PRIMARY KEY (
			NIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* MyCourseBoard */
CREATE TABLE MCBoard (
	MCIdx NUMBER NOT NULL, /* 나만의코스게시판식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	LikeNum NUMBER NOT NULL /* 추천수 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

CREATE UNIQUE INDEX PK_MCBoard
	ON MCBoard (
		MCIdx ASC
	)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	NOLOGGING
	NOCOMPRESS
	SORT
	NOPARALLEL;

ALTER TABLE MCBoard
	ADD
		CONSTRAINT PK_MCBoard
		PRIMARY KEY (
			MCIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

/* LikeMemberList */
CREATE TABLE LMList (
	MCIdx NUMBER, /* 나만의코스게시판식별번호 */
	ID VARCHAR2(20), /* 아이디 */
	isLike CHAR(1) /* 추천여부 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE Board
	ADD
		CONSTRAINT FK_BoardList_TO_Board
		FOREIGN KEY (
			BCode
		)
		REFERENCES BoardList (
			BCode
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE Board
	ADD
		CONSTRAINT FK_Member_TO_Board
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE FreeBoard
	ADD
		CONSTRAINT FK_Board_TO_FreeBoard
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE Reply
	ADD
		CONSTRAINT FK_Board_TO_Reply
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE Reply
	ADD
		CONSTRAINT FK_Member_TO_Reply
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE BoardList
	ADD
		CONSTRAINT FK_BoardType_TO_BoardList
		FOREIGN KEY (
			BType
		)
		REFERENCES BoardType (
			BType
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE Photo
	ADD
		CONSTRAINT FK_Board_TO_Photo
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE MTL
	ADD
		CONSTRAINT FK_Member_TO_MTL
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE MTLC
	ADD
		CONSTRAINT FK_MTL_TO_MTLC
		FOREIGN KEY (
			TLIdx
		)
		REFERENCES MTL (
			TLIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE NoticeBoard
	ADD
		CONSTRAINT FK_Board_TO_NoticeBoard
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE MCBoard
	ADD
		CONSTRAINT FK_Board_TO_MCBoard
		FOREIGN KEY (
			BIDX
		)
		REFERENCES Board (
			BIDX
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE LMList
	ADD
		CONSTRAINT FK_MCBoard_TO_LMList
		FOREIGN KEY (
			MCIdx
		)
		REFERENCES MCBoard (
			MCIdx
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;

ALTER TABLE LMList
	ADD
		CONSTRAINT FK_Member_TO_LMList
		FOREIGN KEY (
			ID
		)
		REFERENCES Member (
			ID
		)
		NOT DEFERRABLE
		INITIALLY IMMEDIATE
		ENABLE
		VALIDATE;
		
/* INIT DATA */		
INSERT INTO BOARDTYPE(BTYPE,BTYPENAME) VALUES(10, '일반');
INSERT INTO BOARDTYPE(BTYPE,BTYPENAME) VALUES(20, '계층');
INSERT INTO BOARDTYPE(BTYPE,BTYPENAME) VALUES(30, '포토');

INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(1, 10, '공지사항');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(2, 10, 'QnA');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(3, 10, '나만의 코스');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(4, 20, '자유게시판');
INSERT INTO BOARDLIST (BCODE, BTYPE, BNAME) VALUES(5, 30, '포토게시판');

INSERT INTO MEMBER (ID, NAME, PWD, ISADMIN) VALUES('admin','관리자', '1004', 1);
COMMIT;		