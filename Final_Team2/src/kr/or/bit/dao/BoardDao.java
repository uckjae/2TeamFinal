package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.swing.internal.plaf.basic.resources.basic;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.FreeBoard;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.MTLContent;
import kr.or.bit.dto.MTList;
import kr.or.bit.dto.NoticeBoard;
import kr.or.bit.dto.Photo;
import kr.or.bit.dto.QnABoard;
import kr.or.bit.utils.DBHelper;

public class BoardDao {

	// 자유 게시판
	// 자유 게시판 게시글 목록보기
	public List<FreeBoard> freeBoardList() {
		return null;
	}

	// 자유 게시판 게시글 상세보기
	public FreeBoard freeBoardContent() {

		return null;
	}

	// 자유 게시판 글쓰기
	public int freeContentWrite() {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO BOARD(BIDX, ID, TITLE, CONTENT, WDATE, RNUM, BCODE) VALUE(BIDX_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, 4";

		try {
			pstmt = connection.prepareStatement(sql);

			pstmt.executeQuery();

		} catch (Exception e) {

		} finally {

		}

		return 0;
	}

	// 자유 게시판 게시글 조회수 증가
	public boolean getFreeReadNum() {
		return false;
	}

	// 자유 게시판 게시글 삭제하기
	public int freeContentDelete() {
		return 0;
	}

	// 자유 게시판 게시글 수정하기
	public int freeContentEdit() {
		return 0;
	}

	// 자유 게시판 댓글 달기
	public int fBReplyWrite() {
		return 0;
	}

	// 자유 게시판 댓글 삭제하기
	public int fBReplyDelte() {
		return 0;
	}

	// 자유 게시판 답글 달기
	public int fBCommentWrite() {
		return 0;
	}
	// 자유게시판 끝

	// 공지사항
	// 공지 게시판 게시글 목록보기
	public List<NoticeBoard> noticeList() {
		return null;
	}

	// 공지 게시판 게시글 상세보기
	public NoticeBoard noticeContent() {
		return null;
	}

	// 공지 게시판 글쓰기
	public int noticeWrite() {
		return 0;
	}

	// 공지 게시판 게시글 조회수 증가
	public boolean getNoticeReadNum() {
		return false;
	}

	// 공지 게시판 게시글 삭제하기
	public int noticeDelete() {
		return 0;
	}

	// 공지 게시판 게시글 수정하기
	public int noticeEdit() {
		return 0;
	}
	// 공지사항 끝

	// Q&A
	// Q&A 게시판 게시글 목록보기
	public List<QnABoard> getQnABoards() {
		List<QnABoard> boards = new ArrayList<>();;
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM, Q.QIDX, Q.ISPUBLIC "
						+"  	FROM BOARD B JOIN QNABOARD Q ON B.BIDX = Q.BIDX "
						+" WHERE B.BCODE = 2";
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnABoard board = new QnABoard();
				board.setbIndx(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setwDate(rs.getDate(5));
				board.setrNum(rs.getInt(6));
				board.setqIdx(rs.getInt(7));
				board.setPublic(rs.getBoolean(8));
				
				boards.add(board);
			}
			
		}catch (Exception e) {
			try { connection.rollback(); } 
			catch (SQLException e1) { e1.printStackTrace(); }

			e.printStackTrace();
		}finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return boards;
	}

	// Q&A 게시판 게시글 상세보기
	public Board getQnABoard() {
		return null;
	}

	// Q&A 게시판 글쓰기
	public boolean insertQnABoard(String memberId, String title, String content, boolean isPublic) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String boardSql = "INSERT INTO BOARD (BIDX, WDATE, RNUM, BCODE, ID, TITLE, CONTENT) "
				+ "VALUES (BIDX_SEQ.NEXTVAL, SYSDATE, 0, 2, ?, ?,?) ";
		String subSql = "INSERT INTO QNABOARD (QIDX, BIDX, ISPUBLIC) "
				+ "VALUES (QIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, ?) ";

		try {
			connection.setAutoCommit(false);

			pstmt = connection.prepareStatement(boardSql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();

			pstmt = connection.prepareStatement(subSql);
			pstmt.setBoolean(1, isPublic);

			resultRow = pstmt.executeUpdate();
			connection.commit();
		} catch (Exception e) {
			try { connection.rollback(); } 
			catch (SQLException e1) { e1.printStackTrace(); }

			e.printStackTrace();
		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}

	// Q&A 게시판 게시글 조회수 증가
	public boolean getQnaReadNum() {
		return false;
	}

	// Q&A 게시판 게시글 삭제하기
	public int deleteQnABoard() {
		return 0;
	}

	// Q&A 게시판 게시글 수정하기
	public int updateQnABoard() {
		return 0;
	}

	//// Q&A 게시판 끝

	// 포토게시판
	// 포토게시판 게시글 목록보기
	public List<Photo> photoList() {
		return null;
	}

	// 포토 게시판 게시글 상세보기
	public Photo photoContent() {
		return null;
	}

	// 포토 게시판 글쓰기
	public int photoWrite() {
		return 0;
	}

	// 포토 게시판 게시글 조회수 증가
	public boolean getPhotoReadNum() {
		return false;
	}

	// 포토 게시판 게시글 삭제하기
	public int photoDelete() {
		return 0;
	}

	// 포토 게시판 게시글 수정하기
	public int photoEdit() {
		return 0;
	}
	// 포토게시판 끝

	// 나만의 코스 게시판
	// 나만의 코스 게시판 게시글 목록보기
	public List<MCBoard> courseList() {
		return null;
	}

	// 나만의 코스 게시판 게시글 상세보기
	public MCBoard courseContent() {
		return null;
	}

	// 나만의 코스 게시판 글쓰기
	public int courseWrite() {
		return 0;
	}

	// 나만의 코스 게시판 게시글 조회수 증가
	public boolean getCourseReadNum() {
		return false;
	}

	// 나만의 코스 게시판 게시글 삭제하기
	public int courseDelete() {
		return 0;
	}

	// 나만의 코스 게시판 게시글 수정하기
	public int courseEdit() {
		return 0;
	}
	// 나만의 코스 게시판 끝

	// 내 여행리스트
	// 여행리스트 폴더 보기
	public List<MTList> mTLFolderList() {
		return null;
	}

	// 여행리스트 폴더 추가하기
	public MTList mTLFolderAdd() {
		return null;
	}

	// 여행리스트 폴더 삭제하기
	public MTList mTLFolderDelete() {
		return null;
	}

	// 여행리스트 상세보기
	public MTLContent mTListContent() {

		return null;
	}

	// 여행리스트 추가하기
	public int mTListContentAdd() {
		return 0;
	}

	// 여행리스트 삭제하기
	public int mTListContentDelete() {
		return 0;
	}
	// 내 여행리스트 끝

}
