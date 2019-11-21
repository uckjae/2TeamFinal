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
	BIDX NUMBER NOT NULL, /* 글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	Title VARCHAR2(100) NOT NULL, /* 글제목 */
	Content VARCHAR2(4000) NOT NULL, /* 글내용 */
	WDate TIMESTAMP DEFAULT SYSTIMESTAMP, /* 작성일 */
	RNum NUMBER NOT NULL, /* 조회수 */
	BCode NUMBER NOT NULL /* 게시판코드 */
);

COMMENT ON TABLE Board IS 'Board';

COMMENT ON COLUMN Board.BIDX IS '글번호';

COMMENT ON COLUMN Board.ID IS '아이디';

COMMENT ON COLUMN Board.Title IS '글제목';

COMMENT ON COLUMN Board.Content IS '글내용';

COMMENT ON COLUMN Board.WDate IS '작성일';

COMMENT ON COLUMN Board.RNum IS '조회수';

COMMENT ON COLUMN Board.BCode IS '게시판코드';

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
	FIdx NUMBER NOT NULL, /* 자유게시판식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	Refer NUMBER NOT NULL, /* 그룹번호 */
	Depth NUMBER NOT NULL, /* 깊이번호 */
	Step NUMBER NOT NULL /* 스텝번호 */
);

COMMENT ON TABLE FreeBoard IS 'FreeBoard';

COMMENT ON COLUMN FreeBoard.FIdx IS '자유게시판식별번호';

COMMENT ON COLUMN FreeBoard.BIDX IS '글번호';

COMMENT ON COLUMN FreeBoard.Refer IS '그룹번호';

COMMENT ON COLUMN FreeBoard.Depth IS '깊이번호';

COMMENT ON COLUMN FreeBoard.Step IS '스텝번호';

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
	RIdx NUMBER NOT NULL, /* 댓글식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	RContent VARCHAR2(500) NOT NULL, /* 댓글내용 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	RWDate TIMESTAMP DEFAULT SYSTIMESTAMP /* 작성일 */
);

COMMENT ON TABLE Reply IS 'Reply';

COMMENT ON COLUMN Reply.RIdx IS '댓글식별번호';

COMMENT ON COLUMN Reply.BIDX IS '글번호';

COMMENT ON COLUMN Reply.RContent IS '댓글내용';

COMMENT ON COLUMN Reply.ID IS '아이디';

COMMENT ON COLUMN Reply.RWDate IS '작성일';

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
	BCode NUMBER NOT NULL, /* 게시판코드 */
	BName VARCHAR2(50) NOT NULL, /* 게시판 이름 */
	BType NUMBER NOT NULL /* 게시판형식번호 */
);

COMMENT ON TABLE BoardList IS 'BoardList';

COMMENT ON COLUMN BoardList.BCode IS '게시판코드';

COMMENT ON COLUMN BoardList.BName IS '게시판 이름';

COMMENT ON COLUMN BoardList.BType IS '게시판형식번호';

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
	BType NUMBER NOT NULL, /* 게시판형식번호 */
	BTypeName VARCHAR2(50) NOT NULL /* 게시판형식이름 */
);

COMMENT ON TABLE BoardType IS 'BoardType';

COMMENT ON COLUMN BoardType.BType IS '게시판형식번호';

COMMENT ON COLUMN BoardType.BTypeName IS '게시판형식이름';

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
	PhotoId NUMBER NOT NULL, /* 사진자료 식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	PhotoName VARCHAR2(50) NOT NULL /* 저장사진이름 */
);

COMMENT ON TABLE Photo IS 'Photo';

COMMENT ON COLUMN Photo.PhotoId IS '사진자료 식별번호';

COMMENT ON COLUMN Photo.BIDX IS '글번호';

COMMENT ON COLUMN Photo.PhotoName IS '저장사진이름';

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
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	PWD VARCHAR2(30) NOT NULL, /* 비밀번호 */
	Name VARCHAR2(15) NOT NULL, /* 이름 */
	Birth CHAR(6), /* 생년월일 */
	HireDate DATE DEFAULT SYSDATE, /* 가입일 */
	Gender CHAR(1), /* 성별 */
	Address VARCHAR2(50), /* 주소 */
	Email VARCHAR2(100), /* 이메일 */
	Kakao CHAR(1), /* 카카오계정연동여부 */
	isAdmin CHAR(1) NOT NULL /* 관리자여부 */
);

COMMENT ON TABLE Member IS 'Member';

COMMENT ON COLUMN Member.ID IS '아이디';

COMMENT ON COLUMN Member.PWD IS '비밀번호';

COMMENT ON COLUMN Member.Name IS '이름';

COMMENT ON COLUMN Member.Birth IS '생년월일';

COMMENT ON COLUMN Member.HireDate IS '가입일';

COMMENT ON COLUMN Member.Gender IS '성별';

COMMENT ON COLUMN Member.Address IS '주소';

COMMENT ON COLUMN Member.Email IS '이메일';

COMMENT ON COLUMN Member.Kakao IS '카카오계정연동여부';

COMMENT ON COLUMN Member.isAdmin IS '관리자여부';

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
	TLIdx NUMBER NOT NULL, /* 여행리스트식별번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	TLName VARCHAR2(50) NOT NULL /* 리스트이름 */
);

COMMENT ON TABLE MTList IS 'MyTravelList';

COMMENT ON COLUMN MTList.TLIdx IS '여행리스트식별번호';

COMMENT ON COLUMN MTList.ID IS '아이디';

COMMENT ON COLUMN MTList.TLName IS '리스트이름';

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
	TLCIdx NUMBER NOT NULL, /* 여행리스트내용식별번호 */
	TLIdx NUMBER NOT NULL, /* 여행리스트식별번호 */
	SpotName VARCHAR2(50) NOT NULL, /* 여행지 이름 */
	Image VARCHAR2(200), /* 대표이미지(이미지소스링크) */
	SpotDate DATE, /* 날짜 */
	SpotAddr VARCHAR2(50) NOT NULL, /* 장소 */
	SpotLink VARCHAR2(200) /* 참조사이트 */
);

COMMENT ON TABLE MTLContent IS 'MyTravelListContent';

COMMENT ON COLUMN MTLContent.TLCIdx IS '여행리스트내용식별번호';

COMMENT ON COLUMN MTLContent.TLIdx IS '여행리스트식별번호';

COMMENT ON COLUMN MTLContent.SpotName IS '여행지 이름';

COMMENT ON COLUMN MTLContent.Image IS '대표이미지(이미지소스링크)';

COMMENT ON COLUMN MTLContent.SpotDate IS '날짜';

COMMENT ON COLUMN MTLContent.SpotAddr IS '장소';

COMMENT ON COLUMN MTLContent.SpotLink IS '참조사이트';

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
	NIdx NUMBER NOT NULL, /* 공지사항게시판식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	isTop CHAR(1) NOT NULL /* 상단위치여부 */
);

COMMENT ON TABLE NoticeBoard IS 'NoticeBoard';

COMMENT ON COLUMN NoticeBoard.NIdx IS '공지사항게시판식별번호';

COMMENT ON COLUMN NoticeBoard.BIDX IS '글번호';

COMMENT ON COLUMN NoticeBoard.isTop IS '상단위치여부';

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
	MCIdx NUMBER NOT NULL, /* 나만의코스게시판식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	LikeNum NUMBER NOT NULL /* 추천수 */
);

COMMENT ON TABLE MCBoard IS 'MyCourseBoard';

COMMENT ON COLUMN MCBoard.MCIdx IS '나만의코스게시판식별번호';

COMMENT ON COLUMN MCBoard.BIDX IS '글번호';

COMMENT ON COLUMN MCBoard.LikeNum IS '추천수';

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
	MCIdx NUMBER, /* 나만의코스게시판식별번호 */
	ID VARCHAR2(20), /* 아이디 */
	isLike CHAR(1) /* 추천여부 */
);

COMMENT ON TABLE LMList IS 'LikeMemberList';

COMMENT ON COLUMN LMList.MCIdx IS '나만의코스게시판식별번호';

COMMENT ON COLUMN LMList.ID IS '아이디';

COMMENT ON COLUMN LMList.isLike IS '추천여부';

/* QnABoard */
CREATE TABLE NoticeBoard2 (
	NIdx NUMBER NOT NULL, /* 공지사항게시판식별번호 */
	BIDX NUMBER NOT NULL, /* 글번호 */
	isPublic CHAR(1) NOT NULL /* 공개여부 */
);

COMMENT ON TABLE NoticeBoard2 IS 'QnABoard';

COMMENT ON COLUMN NoticeBoard2.NIdx IS '공지사항게시판식별번호';

COMMENT ON COLUMN NoticeBoard2.BIDX IS '글번호';

COMMENT ON COLUMN NoticeBoard2.isPublic IS '공개여부';

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

CREATE SEQUENCE BIdx_SEQ;--게시판
CREATE SEQUENCE FIdx_SEQ;--자유게시판
CREATE SEQUENCE QIdx_SEQ;--QnA게시판
CREATE SEQUENCE NIdx_SEQ;--공지사항게시판
CREATE SEQUENCE MCIdx_SEQ;--나만의코스 게시판
CREATE SEQUENCE TLIdx_SEQ;--나의여행리스트
CREATE SEQUENCE TLCIdx_SEQ;--나의여행리스트 내용
CREATE SEQUENCE RIdx_SEQ;--댓글
CREATE SEQUENCE PhotoId_SEQ;--사진
COMMIT;