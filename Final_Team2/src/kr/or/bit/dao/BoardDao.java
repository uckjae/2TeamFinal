package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.FreeBoard;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.MTLContent;
import kr.or.bit.dto.MTList;
import kr.or.bit.dto.NoticeBoard;
import kr.or.bit.dto.Photo;
import kr.or.bit.utils.DBHelper;

public class BoardDao {

	//자유 게시판 
	//자유 게시판 게시글 목록보기 
	public List<FreeBoard> freeBoardList() {
		return null;
	}	
	//자유 게시판 게시글 상세보기 
	public FreeBoard freeBoardContent() {
		return null;
	}
	//자유 게시판 글쓰기 
	public int freeContentWrite() {
		return 0;
	}
	//자유 게시판 게시글 조회수 증가 
	public boolean getFreeReadNum() {
		return false;
	}
	//자유 게시판 게시글 삭제하기 
	public int freeContentDelete() {
		return 0;
	}
	//자유 게시판 게시글 수정하기 
	public int freeContentEdit() {
		return 0;
	}
	//자유 게시판 댓글 달기 
	public int fBReplyWrite() {
		return 0;
	}
	//자유 게시판 댓글 삭제하기 
	public int fBReplyDelte() {
		return 0;
	}
	//자유 게시판 답글 달기 
	public int fBCommentWrite() {
		return 0;
	}
	//자유게시판 끝 
	
	
	//공지사항 
	//공지 게시판 게시글 목록보기 
	public List<NoticeBoard> noticeList() {
		return null;
	}	
	//공지  게시판 게시글 상세보기 
	public NoticeBoard noticeContent() {
		return null;
	}
	//공지  게시판 글쓰기 
	public int noticeWrite() {
		return 0;
	}
	//공지  게시판 게시글 조회수 증가 
	public boolean getNoticeReadNum() {
		return false;
	}
	//공지  게시판 게시글 삭제하기 
	public int noticeDelete() {
		return 0;
	}
	//공지  게시판 게시글 수정하기 
	public int noticeEdit() {
		return 0;
	}
	//공지사항 끝 
	
	//Q&A 
	//Q&A 게시판 게시글 목록보기 
	public List<Board> qnaBoardList() {
		return null;
	}	
	
	//Q&A 게시판 게시글 상세보기 
	public Board getQnABoard() {
		return null;
	}
	
	// Q&A 게시판 글쓰기
	public boolean insertQnABoard(String memberId, String title, String content) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql= "INSERT INTO BOARD (BIDX, WDATE, RNUM, BCODE, ID, TITLE, CONTENT) "
						+"VALUES (BIDX_SEQ.NEXTVAL, SYSDATE, 0, 2, ?, ?,?) ";
		
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, title);
			pstmt.setString(3, content);

			resultRow = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultRow > 0 ? true : false;
	}
	
	//Q&A  게시판 게시글 조회수 증가 
	public boolean getQnaReadNum() {
		return false;
	}
	
	//Q&A  게시판 게시글 삭제하기 
	public int deleteQnABoard() {
		return 0;
	}
	
	//Q&A  게시판 게시글 수정하기 
	public int updateQnABoard() {
		return 0;
	}
	
	////Q&A 게시판 끝 
	
	//포토게시판 
	//포토게시판 게시글 목록보기 
	public List<Photo> photoList() {
		return null;
	}	
	//포토 게시판 게시글 상세보기 
	public Photo photoContent() {
		return null;
	}
	//포토  게시판 글쓰기 
	public int photoWrite() {
		return 0;
	}
	//포토  게시판 게시글 조회수 증가 
	public boolean getPhotoReadNum() {
		return false;
	}
	//포토   게시판 게시글 삭제하기 
	public int photoDelete() {
		return 0;
	}
	//포토  게시판 게시글 수정하기 
	public int photoEdit() {
		return 0;
	}
	//포토게시판 끝 
	
	//나만의 코스 게시판 
	//나만의 코스 게시판 게시글 목록보기 
	public List<MCBoard> courseList() {
		return null;
	}	
	//나만의 코스 게시판 게시글 상세보기 
	public MCBoard courseContent() {
		return null;
	}
	//나만의 코스  게시판 글쓰기 
	public int courseWrite() {
		return 0;
	}
	//나만의 코스 게시판 게시글 조회수 증가 
	public boolean getCourseReadNum() {
		return false;
	}
	//나만의 코스   게시판 게시글 삭제하기 
	public int courseDelete() {
		return 0;
	}
	//나만의 코스  게시판 게시글 수정하기 
	public int courseEdit() {
		return 0;
	}
	//나만의 코스 게시판  끝 
	
	//내 여행리스트
	//여행리스트 폴더 보기 
	public List<MTList> mTLFolderList() {
		return null;
	}	
	//여행리스트  폴더 추가하기 
	public MTList mTLFolderAdd() {
		return null;
	}
	//여행리스트  폴더 삭제하기 
	public MTList mTLFolderDelete() {
		return null;
	}	
	//여행리스트 상세보기 
	public MTLContent mTListContent() {
		
		return null;
	}
	//여행리스트  추가하기 
	public int mTListContentAdd() {
		return 0;
	}
	//여행리스트 삭제하기
	public int mTListContentDelete() {
		return 0;
	}
	//내 여행리스트 끝 
	
}
