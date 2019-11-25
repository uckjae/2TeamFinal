package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.FreeBoard;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.MTLContent;
import kr.or.bit.dto.MTList;
import kr.or.bit.dto.NoticeBoard;
import kr.or.bit.dto.Photo;
import kr.or.bit.dto.QnABoard;
import kr.or.bit.dto.Reply;
import kr.or.bit.utils.DBHelper;

public class BoardDao {

	// 자유 게시판
	// 총 게시글 수 구하기
	public int freeBoardTotalBoardCount() {
		int totalcount = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			connection = DBHelper.getConnection(); 
			String sql="SELECT COUNT(*) CNT FROM FREEBOARD";
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				totalcount = resultSet.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBHelper.close(resultSet);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		return totalcount;
	}
	// 자유 게시판 게시글 목록보기
	public List<FreeBoard> freeBoardList() {
		List<FreeBoard> freeBoardList = new ArrayList<FreeBoard>();
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		String sql = "SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM, F.FIDX" 
					+ " FROM BOARD B JOIN FREEBOARD F ON B.BIDX = F.BIDX WHERE B.BCODE = 4";
		
		try {
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				FreeBoard freeBoard = new FreeBoard();
				
				freeBoard.setbIdx(resultSet.getInt(1));
				freeBoard.setId(resultSet.getString(2));
				freeBoard.setTitle(resultSet.getString(3));
				freeBoard.setContent(resultSet.getString(4));
				freeBoard.setwDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(resultSet.getString(5)));
				freeBoard.setrNum(resultSet.getInt(6));
				freeBoard.setfIdx(resultSet.getInt(7));

				freeBoardList.add(freeBoard);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBHelper.close(resultSet);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		return freeBoardList;
	}

	// 자유 게시판 게시글 상세보기
	public FreeBoard freeBoardDetail(int bIdx) {
		FreeBoard freeBoard = new FreeBoard();
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		String sql = "SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM, F.FIDX FROM FREEBOARD F JOIN BOARD B ON F.BIDX = B.BIDX WHERE B.BIDX=?";
		
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				freeBoard.setbIdx(resultSet.getInt(1));
				freeBoard.setId(resultSet.getString(2));
				freeBoard.setTitle(resultSet.getString(3));
				freeBoard.setContent(resultSet.getString(4));
				freeBoard.setwDate(resultSet.getDate(5));
				freeBoard.setrNum(resultSet.getInt(6));
				freeBoard.setfIdx(resultSet.getInt(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBHelper.close(resultSet);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		return freeBoard;
	}

	// 자유 게시판 글쓰기
	public int freeContentWrite(String id, String title, String content) {
		//System.out.println("content write");
		int resultRow = 0;
		int refer = 0;
		int bIdx = -1;
		Connection connection = DBHelper.getConnection();
		ResultSet resultSet = null;
		PreparedStatement pstmt = null;
		
		String referNum = "SELECT NVL(MAX(FIDX),0) FROM FREEBOARD";
		String sql1 = "INSERT INTO BOARD(BIDX, ID, TITLE, CONTENT, WDATE, RNUM, BCODE) VALUES(BIDX_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, 4)";
		String sql2 = "INSERT INTO FREEBOARD(FIDX, BIDX, REFER, DEPTH, STEP) VALUES(FIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, ?, 0, 0)";
		String bIdxsql = "SELECT BIDX_SEQ.CURRVAL FROM DUAL";
		
		try {
			//System.out.println("contentwrite try");
			pstmt = connection.prepareStatement(referNum);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				refer = resultSet.getInt(1) + 1;
			}
			//System.out.println("refer");
			connection.setAutoCommit(false);
			//System.out.println("autocommit false");
			pstmt = connection.prepareStatement(sql1);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			pstmt = connection.prepareStatement(sql2);
			pstmt.setInt(1, refer);
			resultRow = pstmt.executeUpdate();
			pstmt = connection.prepareStatement(bIdxsql);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				bIdx = resultSet.getInt(1);
			}
			connection.commit();
		} catch (Exception e) {
			try {
				connection.rollback();
			}catch (Exception e1) {
				e1.getStackTrace();
			}
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(resultSet);
			DBHelper.close(connection);
		}
		return bIdx;
	}
	
	// 자유 게시판 답글쓰기
	public FreeBoard FreeBoardReWrite(String id, String title, String content, int bIdx) {
		int resultRow = 0;
		int refer = 0, depth = 0;
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		String referNum = "SELECT REFER, DEPTH FROM FREEBOARD WHERE BIDX=?";
		String stepNum = "SELECT STEP FROM FREEBOARD";
		String stepUp = "UPDATE FREEBOARD SET STEP = STEP+1 WHERE REFER=?";
		String sql1 = "INSERT INTO BOARD(BIDX, ID, TITLE, CONTENT, WDATE, RNUM, BCODE) VALUES(BIDX_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, 4)";
		String sql2 = "INSERT INTO FREEBOARD(FIDX, BIDX, REFER, DEPTH, STEP) VALUES(FIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, ?, ?, 0)";
		String bIdxsql = "SELECT BIDX_SEQ.CURRVAL FROM DAUL";
		
		try {
			pstmt = connection.prepareStatement(referNum);
			pstmt.setInt(1, bIdx);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				refer = resultSet.getInt(1);
				depth = resultSet.getInt(2);
			}
			
			pstmt = connection.prepareStatement(stepUp);
			pstmt.setInt(1, refer);
			resultSet = pstmt.executeQuery();
			
			
			connection.setAutoCommit(false);
			
			pstmt = connection.prepareStatement(sql1);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
			pstmt = connection.prepareStatement(sql2);
			pstmt.setInt(1, refer);
			pstmt.setInt(2, depth);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return null;
	}
	
	// 자유 게시판 게시글 조회수 증가
	public void FreeBoardAddReadNum(int bIdx) {
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET RNUM = RNUM+1 WHERE BIDX=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
	}

	// 자유 게시판 게시글 삭제하기
	public boolean freeBoardDelete(int bIdx) {
		int resultRow = 0;
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		
		String fsql = "DELETE FROM FREEBOARD WHERE BIDX=?";
		String bsql = "DELETE FROM BOARD WHERE BIDX=?";
		
		try {
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement(fsql);
			pstmt.setInt(1, bIdx);
			pstmt.executeUpdate();
			
			pstmt = connection.prepareStatement(bsql);
			pstmt.setInt(1, bIdx);
			resultRow = pstmt.executeUpdate();
			
			if(resultRow > 0) {
				connection.commit();
			}
		}catch(Exception e) {
			try {
				connection.rollback();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		return resultRow > 0 ? true : false;
	}

	// 자유 게시판 게시글 수정하기
	public boolean freeBoardEdit(String title, String content, int bIdx) {
		int resultRow = 0;
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		
		String bsql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE BIDX = ?";
		
		try {
			pstmt = connection.prepareStatement(bsql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bIdx);
			resultRow = pstmt.executeUpdate();
		} catch (Exception e) {
			try { 
				connection.rollback(); 
			}catch (SQLException e1) { 
				e1.printStackTrace(); 
			}
			e.printStackTrace();
		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		return resultRow > 0 ? true : false;
	}

	// 자유 게시판 댓글 달기
	public int fBReplyWrite() {
		return 0;
	}

	// 자유 게시판 댓글 삭제하기
	public int fBReplyDelte() {
		return 0;
	}
	// 자유게시판 끝

	// 공지사항
	// 공지 게시판 게시글 목록보기
		public List<NoticeBoard> noticeboardList() {
			List<NoticeBoard> noticeboardList = new ArrayList<>();;
			
			Connection connection = DBHelper.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM, N.NIDX, N.ISTOP"
						  +" FROM BOARD B JOIN NOTICEBOARD N ON B.BIDX = N.BIDX"
						  +" WHERE B.BCODE = 1";
			try {
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					NoticeBoard noticeBoard = new NoticeBoard();
					noticeBoard.setbIdx(rs.getInt(1));
					noticeBoard.setId(rs.getString(2));
					noticeBoard.setTitle(rs.getString(3));
					noticeBoard.setContent(rs.getString(4));
					noticeBoard.setwDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(5)));
					noticeBoard.setrNum(rs.getInt(6));
					noticeBoard.setnIdx(rs.getInt(7));
					noticeBoard.setTop(rs.getBoolean(8));
					
					noticeboardList.add(noticeBoard);
				}
				
			}catch (Exception e) {
				try {
					 connection.rollback();
					} 
				catch (SQLException e1) {
					 e1.printStackTrace();
					}
				e.printStackTrace();
			}finally {
				DBHelper.close(rs);
				DBHelper.close(pstmt);
				DBHelper.close(connection);
			}
			
			return noticeboardList;
		}
	// 공지 게시판 게시글 상세보기
	public NoticeBoard noticeDetail(int bIdx) {
		return null;
	}

	// 공지 게시판 글쓰기	
			public int noticeWrite(String memberId, String title, String summernote, int isTop) {
				ResultSet rs = null;
				Connection connection = DBHelper.getConnection();
				PreparedStatement pstmt = null;
				int bIdx = -1;
				
				String Sql1 = "INSERT INTO BOARD (BIDX,ID,TITLE,CONTENT,WDATE,RNUM,BCODE)"
						+ "VALUES (BIDX_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, 1) ";
				String Sql2 = "INSERT INTO NOTICEBOARD (NIDX, BIDX, ISTOP) "
						+ "VALUES (NIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, ?) ";

				
				
				try {
					connection.setAutoCommit(false);

					pstmt = connection.prepareStatement(Sql1);
					pstmt.setString(1, memberId);
					pstmt.setString(2, title);
					pstmt.setString(3, summernote);
					pstmt.executeUpdate();

					pstmt = connection.prepareStatement(Sql2);
					pstmt.setInt(1, isTop);
					pstmt.executeUpdate();
					
					String bIdxSql ="SELECT BIDX_SEQ.CURRVAL FROM DUAL";
					pstmt = connection.prepareStatement(bIdxSql);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						bIdx = rs.getInt(1);
					}
					connection.commit();
				} catch (Exception e) {
					try {
						connection.rollback();
						} 
					catch (SQLException e1) {
						e1.printStackTrace();
						}

					e.printStackTrace();
				}finally {
					DBHelper.close(pstmt);
					DBHelper.close(connection);
				}

				return bIdx;
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
	public boolean noticeEdit(int bIdx, String title, String content, int isTop) {
		int resultRow=0;
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		
		String Sql1 = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE BIDX = ?";
		String Sql2 = "UPDATE NOTICEBOARD SET ISTOP = ? WHERE BIDX = ? ";
		
		try {
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement(Sql1);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bIdx);
			pstmt.executeUpdate();
			
			pstmt = connection.prepareStatement(Sql2);
			pstmt.setInt(1, isTop);
			pstmt.setInt(2, bIdx);
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
				board.setbIdx(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setwDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(5)));
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
	public QnABoard getQnABoard(int bIdx) {
		System.out.println("init");
		QnABoard board = null;
		System.out.println("bIdx "+bIdx);
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql =" SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM, Q.QIDX, Q.ISPUBLIC "
						+ "  FROM QNABOARD Q JOIN BOARD B ON Q.BIDX = B.BIDX "
						+ "WHERE B.BIDX=?";
		
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new QnABoard();
				board.setbIdx(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setwDate(rs.getDate(5));
				board.setrNum(rs.getInt(6));
				board.setqIdx(rs.getInt(7));
				board.setPublic(rs.getBoolean(8));
				board.setReplies(getRepliesByBIdx(bIdx));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return board;
	}

	// Q&A 게시판 글쓰기
	public int insertQnABoard(String memberId, String title, String content, int isPublic) {
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String boardSql = "INSERT INTO BOARD (BIDX, WDATE, RNUM, BCODE, ID, TITLE, CONTENT) "
								+ "VALUES (BIDX_SEQ.NEXTVAL, SYSDATE, 0, 2, ?, ?,?) ";
		String subSql = "INSERT INTO QNABOARD (QIDX, BIDX, ISPUBLIC) "
							+ "VALUES (QIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, ?) ";
		
		int bIdx = -1;
		
		try {
			connection.setAutoCommit(false);

			pstmt = connection.prepareStatement(boardSql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();

			pstmt = connection.prepareStatement(subSql);
			pstmt.setInt(1, isPublic);
			pstmt.executeUpdate();

			String bIdxSql = "SELECT BIDX_SEQ.CURRVAL FROM DUAL";
			pstmt = connection.prepareStatement(bIdxSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bIdx = rs.getInt(1);
			}

			connection.commit();
		} catch (Exception e) {
			try { connection.rollback(); } 
			catch (SQLException e1) { e1.printStackTrace(); }

			e.printStackTrace();
		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return bIdx;
	}

	// Q&A 게시판 게시글 조회수 증가
	public boolean getQnaReadNum() {
		return false;
	}

	// Q&A 게시판 게시글 삭제하기
	public boolean deleteQnABoard(int bIdx) {
		int resultRow = 0;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		
		String qnaSql ="DELETE FROM QNABOARD WHERE BIDX=?";
		String boardSql ="DELETE FROM BOARD WHERE BIDX=?";
		
		try {
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement(qnaSql);
			pstmt.setInt(1, bIdx);
			pstmt.executeUpdate();
			
			pstmt = connection.prepareStatement(boardSql);
			pstmt.setInt(1, bIdx);
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

	// Q&A 게시판 게시글 수정하기
	public boolean updateQnABoard(int bIdx, String title, String content, int isPublic) {
		int resultRow=0;
		
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		
		String boardSql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE BIDX = ?";
		String qnaSql = "UPDATE QNABOARD SET ISPUBLIC = ? WHERE BIDX = ? ";
		
		try {
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement(boardSql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bIdx);
			pstmt.executeUpdate();
			
			pstmt = connection.prepareStatement(qnaSql);
			pstmt.setInt(1, isPublic);
			pstmt.setInt(2, bIdx);
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

	//// Q&A 게시판 끝

	// 포토게시판
	// 포토게시판 게시글 목록보기
	public List<Photo> photoList() {
		List<Photo> photolist = new ArrayList<Photo>();
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT B.BIDX, B.ID , B.TITLE , B.CONTENT, B.WDATE, B.RNUM, P.BIDX , P.PHOTOID ,"
						+ " P.PHOTONAME FROM BOARD B JOIN PHOTO P ON B.BIDX = P.BIDX WHERE B.BCODE = 5";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Photo photo = new Photo();
				photo.setbIdx(rs.getInt(1));
				photo.setId(rs.getString(2));
				photo.setTitle(rs.getString(3));
				photo.setContent(rs.getString(4));
				photo.setwDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(5)));
				photo.setrNum(rs.getInt(6));
				photo.setPhotoId(rs.getInt(7));
				photo.setPhotoName(rs.getString(8));
				
				photolist.add(photo);
			}
			
			
			
		}catch (Exception e) {
			System.out.println("e : " + e.getMessage());
		}finally {
			DBHelper.close(conn);
			DBHelper.close(pstmt);
			DBHelper.close(rs);
		}
		
		return photolist;
	}

	// 포토 게시판 게시글 상세보기
	public Photo photoContent(int bIdx) {
		Photo photo = null;
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT B.BIDX, B.ID , B.TITLE , B.CONTENT, B.WDATE, B.RNUM, P.BIDX , P.PHOTOID ,"
				+ " P.PHOTONAME FROM BOARD B JOIN PHOTO P ON B.BIDX = P.BIDX WHERE B.BIdx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				photo = new Photo();
				photo.setbIdx(rs.getInt(1));
				photo.setId(rs.getString(2));
				photo.setTitle(rs.getString(3));
				photo.setContent(rs.getString(4));
				photo.setwDate(rs.getDate(5));
				photo.setrNum(rs.getInt(6));
				photo.setPhotoId(rs.getInt(7));
				photo.setPhotoName(rs.getString(8));
			}
		}catch (Exception e) {
			System.out.println("상세 : " + e.getMessage());
		}finally {
			DBHelper.close(conn);
			DBHelper.close(pstmt);
			DBHelper.close(rs);
		}
		
		
		return photo;
	}

	// 포토 게시판 글쓰기
	public int photoWrite(String memberId,String title, String content, String photoName) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String bsql = "insert into Board (BIDX, WDATE, RNUM, BCODE, ID, TITLE, CONTENT)" + 
					 "VALUES (BIDX_SEQ.NEXTVAL, SYSDATE, 0, 5, ?, ?,?)";
		String photoSql = "insert into photo (PHOTOID , BIDX , PHOTONAME)" + "VALUES (PHOTOID_SEQ.NEXTVAL , BIDX_SEQ.CURRVAL, ?)";
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(bsql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			System.out.println("title : " + title);
			
			pstmt = conn.prepareStatement(photoSql);
			pstmt.setString(1, photoName);
			
			result = pstmt.executeUpdate();
			
			conn.commit();
			
		}catch (Exception e) {
			try {
				conn.rollback();
			}catch (SQLException s) {
				System.out.println("s : " + s.getMessage());
			}
			
			System.out.println("e : " + e.getMessage());
		}finally {
			DBHelper.close(conn);
			DBHelper.close(pstmt);
		}
		
		return result;
	}

	// 포토 게시판 게시글 조회수 증가
	public boolean getPhotoReadNum() {
		return false;
	}

	// 포토 게시판 게시글 삭제하기
	public int photoDelete(int bIdx) {
		int result = 0;
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		
		String photoSql ="DELETE FROM PHOTO WHERE BIDX=?";
		String Sql ="DELETE FROM BOARD WHERE BIDX=?";
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(photoSql);
			pstmt.setInt(1, bIdx);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(Sql);
			pstmt.setInt(1, bIdx);
			result = pstmt.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			try { 
				conn.rollback(); 
			
			}catch(SQLException e1){ 
				System.out.println(e1.getMessage());
			}

		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		return result;
	}

	// 포토 게시판 게시글 수정하기
	public int photoEdit() {
		return 0;
	}
	// 포토게시판 끝

	// 나만의 코스 게시판
	// 나만의 코스 게시판 게시글 목록보기
	public List<MCBoard> courseList() {
		List<MCBoard> mCBoardLists = new ArrayList<MCBoard>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT B.BIDX,B.ID,B.TITLE,B.CONTENT,B.WDATE,B.RNUM, MC.MCIDX, MC.LIKENUM FROM BOARD B JOIN MCBOARD MC ON B.BIDX = MC.BIDX";
			conn = DBHelper.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MCBoard board = new MCBoard();
				board.setbIdx(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setwDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(5)));
				board.setrNum(rs.getInt(6));
				board.setmCidx(rs.getInt(7));
				board.setLikeNum(rs.getInt(8));
				mCBoardLists.add(board);
			}
			
		}catch(Exception e) {//sqlexception, parseexception
			System.out.println("courseList() : "+e);
		}finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		
		return mCBoardLists;
	}
	
	//나만의코스 메인 사진
	public List<Photo> courseListPhotos(){
		List<Photo> photos = new ArrayList<Photo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int[] top5LikeNum = new int[4];// 좋아요 값 상위 4개 뽑아서 그것들 사진 하나씩만 가져오는 작업
		Arrays.fill(top5LikeNum, -1);
		List<Integer> top5BIdx = new ArrayList<Integer>();
		
		List<MCBoard> boardLists = courseList();
		for(int i=0; i<boardLists.size(); i++) {
			for(int j=0; j < top5LikeNum.length; j++) {
				if(boardLists.get(i).getLikeNum()>top5LikeNum[j]) {
					top5LikeNum[j] = boardLists.get(i).getLikeNum();
					top5BIdx.add(boardLists.get(i).getbIdx());
					break;
				}
			}
		}
		
		String sql = "SELECT PHOTOID, BIDX, PHOTONAME FROM PHOTO WHERE BIDX = ? AND ROWNUM=1";
		
		
			
		try {
			conn = DBHelper.getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<top5BIdx.size(); i++) {
				pstmt.setInt(1, top5BIdx.get(i));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Photo photo = new Photo();
					photo.setPhotoId(rs.getInt(1));
					photo.setbIdx(rs.getInt(2));
					photo.setPhotoName(rs.getString(3));
					System.out.println("board dao courselistphotos()"+photo.toString());
					photos.add(photo);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return photos;
	}

	// 나만의 코스 게시판 게시글 상세보기
	public MCBoard courseContent(int bIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT B.BIDX,B.ID,B.TITLE,B.CONTENT,B.WDATE, B.RNUM, B.BCODE, MC.MCIDX,"
				+ " MC.LIKENUM FROM BOARD B JOIN MCBOARD MC ON B.BIDX = MC.BIDX WHERE B.BIDX=?";
		MCBoard mCBoard = new MCBoard();
		try {
			conn = DBHelper.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mCBoard.setbIdx(rs.getInt(1));
				mCBoard.setId(rs.getString(2));
				mCBoard.setTitle(rs.getString(3));
				mCBoard.setContent(rs.getString(4));
				mCBoard.setwDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(5)));
				mCBoard.setrNum(rs.getInt(6));
				mCBoard.setbCode(rs.getInt(7));
				mCBoard.setmCidx(rs.getInt(8));
				mCBoard.setLikeNum(rs.getInt(9));
			}
		}catch(Exception e) {
			System.out.println("BoardDao courseContent()"+e.getMessage());
		}
		
		return mCBoard;
	}
	
	//나만의 코스 상세보기 사진
	public List<Photo> courseDetailPhoto(int bidx){
		List<Photo> photos = new ArrayList<Photo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT PHOTOID, BIDX, PHOTONAME FROM PHOTO WHERE BIDX=?";
			conn = DBHelper.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Photo photo = new Photo();
				photo.setPhotoId(rs.getInt(1));
				photo.setbIdx(rs.getInt(2));
				photo.setPhotoName(rs.getString(3));
				
				photos.add(photo);
			}
		
			
		}catch(Exception e) {
			System.out.println("boardDao courseDetailPhoto()" + e.getMessage());
		}finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		
		return photos;
	}

	// 나만의 코스 게시판 글쓰기
	public int courseWrite(Board board,MCBoard mCBoard,List<Photo> photos) {
		int resultRow = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String boardSql = "INSERT INTO BOARD (BIDX, WDATE, RNUM, BCODE, ID, TITLE, CONTENT) "
				+ "VALUES (BIDX_SEQ.NEXTVAL, SYSDATE, 0, 3, ?, ?,?) ";
		String mCBSql = "INSERT INTO MCBOARD (MCIDX,BIDX,LIKENUM) "
				+ "VALUES (MCIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, 0)";
		String photoSql = "INSERT INTO PHOTO (PHOTOID, BIDX, PHOTONAME) "
				+ "VALUES (PHOTOID_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL,?)";
		try {
			conn = DBHelper.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(boardSql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			resultRow*=pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(mCBSql);
			resultRow*=pstmt.executeUpdate();
			
			for(Photo photo : photos) {
				pstmt = conn.prepareStatement(photoSql);
				pstmt.setString(1, photo.getPhotoName());
				resultRow *= pstmt.executeUpdate();
			}
			
			conn.commit();
		}catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				System.out.println("BoardDao mCBWrite");
				System.out.println(e1.getMessage());
				e1.printStackTrace();
			}
			System.out.println("BoardDao mCBWrite2 " + e.getMessage());
		}finally {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		return resultRow;
	}
	
	// 나만의 코스 게시판 좋아요 증가
	public int getCourseLikeNum(int mCIdx, String id) {
		int likeNum = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String checkSql = "SELECT MCIdx, ID, ISLIKE FROM LMLIST WHER MCIDX=?";
			conn = DBHelper.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(checkSql);
			pstmt.setInt(1, mCIdx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String deleteLikeMemberSql = "DELETE FROM LMLIST WHER ID=?";
				pstmt = conn.prepareStatement(deleteLikeMemberSql);
				pstmt.setString(1, id);
				int deleteLikeMember = pstmt.executeUpdate();
				System.out.println("boardDao getCourseLikenum() 실패면 0 되면 1"+ deleteLikeMember);
				
				String decreaseLikeNumSql = "UPDATE MCBOARD SET LIKENUM = (SELECT LIKENUM FROM MCBOARD WHERE MCIDX=?)-1 WHERE MCIDX=?";
				pstmt = conn.prepareStatement(decreaseLikeNumSql);
				pstmt.setInt(1, mCIdx);
				pstmt.setInt(2, mCIdx);
				int decreaseLikeNum = pstmt.executeUpdate();
				System.out.println("boardDao getCourseLikeNum() 실패면 0 되면 1"+decreaseLikeNum);
			}
			else {
				String addLikeMemberSql = "INSERT INTO LMLIST (MCIDX, ID, ISLIKE) VALUES(?, ?, 1)";
				pstmt = conn.prepareStatement(addLikeMemberSql);
				pstmt.setInt(1, mCIdx);
				pstmt.setString(2, id);
				int addLikeMember = pstmt.executeUpdate();
				System.out.println("boardDao getCourseLikeNum() 실패면 0 되면 1" + addLikeMember);
				
				String increaseLikeNumSql = "UPDATE MCBOARD SET LIKENUM = (SELECT LIKENUM FROM MCBOARD WHERE MCIDX=?)+1 WHERE MCIDX=?";
				pstmt = conn.prepareStatement(increaseLikeNumSql);
				pstmt.setInt(1, mCIdx);
				pstmt.setInt(2, mCIdx);
				int increaseLikeNum = pstmt.executeUpdate();
				System.out.println("boardDao getCourseLikeNum() 실패면 0 되면 1" + increaseLikeNum);
				
			}
			
			String getLikeNumSql = "SELECT LIKENUM FROM MCBOARD WHER MCIDX=?";
			pstmt = conn.prepareStatement(getLikeNumSql);
			pstmt.setInt(1, mCIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				likeNum = rs.getInt(1);
			}
			
			
		}catch(SQLException e) {
			System.out.println("boardDao getCourseLikeNum() : " + e.getMessage());
		}finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		
		return likeNum;
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
	public List<MTList> mTLFolderList(String id) {
		List<MTList> mtFolderList = new ArrayList<MTList>();
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		String sql = "select tlidx,id,tlname from MTLIST where id = ? order by tlidx";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {			
				MTList mtFolder = new MTList();
				mtFolder.settLidx(rs.getInt(1));
				mtFolder.setId(rs.getString(2));
				mtFolder.settLName(rs.getString(3));
				mtFolderList.add(mtFolder);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {		
			DBHelper.close(pstmt);
			DBHelper.close(rs);
			DBHelper.close(conn);
		}
		return mtFolderList;
	}
	//여행리스트  폴더 만들기
	public int mTLFolderAdd(String id, String tlname) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		String sql = "insert into MTLIST (tlidx,id,tlname) values (TLIdx_SEQ.nextval,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, tlname);
			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		return resultRow;
	}
	//여행리스트 폴더 수정하기
	public int mTLFolderEdit(int tLidx,String tLname) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		ResultSet rs = null;
		String sql = "update mtlist set tlname= ? where TLIdx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tLidx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pstmt.setString(1, tLname);
				resultRow =	pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}		
		return resultRow;
	}

	// 여행리스트 폴더 삭제하기
	//계층형 삭제 여행리스트 먼저 삭제하고 폴더 삭제하기
	public int mTLFolderDelete(int tLidx) {
		Connection  conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		String sql_content = "delete from mtlcontent where tlidx =?";
		String sql_folder = "delete from mtlist where tlidx = ? ";
		
		try {
			//폴더 안에 여행 리스트 삭제 
			pstmt = conn.prepareStatement(sql_content);
			pstmt.setInt(1, tLidx);
			pstmt.executeUpdate();
			//폴더 삭제 
			pstmt = conn.prepareStatement(sql_folder);
			pstmt.setInt(1,tLidx);
			
			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); 
		} finally  {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}
		return resultRow;
	}

	// 여행리스트 상세보기
	public List<MTLContent> mTListContent(int tLidx) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MTLContent> mTLContentList = new ArrayList<MTLContent>();
		String sql = "select tlcidx,tlidx,spotname,image,spotdate,spotaddr,spotlink from mtlcontent where tlidx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tLidx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MTLContent mTLContent = new MTLContent();
				mTLContent.settLCidx(rs.getInt(1));
				mTLContent.settLidx(rs.getInt(2));
				mTLContent.setSpotName(rs.getString(3));
				mTLContent.setImage(rs.getString(4));
				mTLContent.setSpotDate(rs.getDate(5));
				mTLContent.setSpotAddr(rs.getString(6));
				mTLContent.setSpotLink(rs.getString(7));			
				mTLContentList.add(mTLContent);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(rs);
			DBHelper.close(conn);
		}		
		return mTLContentList;
	}
	// 여행리스트 추가하기
	public int mTListContentAdd(MTLContent mTLContent) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		String sql = "insert into mtlcontent (tlcidx,tlidx,spotname,image,spotdate,spotaddr,spotlink) values \r\n" + 
				"(TLCIdx_SEQ.nextval,?,?,?,to_date(?,'mm/dd'),?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mTLContent.gettLidx());
			pstmt.setString(2, mTLContent.getSpotName());
			pstmt.setString(3, mTLContent.getImage());
			pstmt.setDate(4, (Date) mTLContent.getSpotDate());
			pstmt.setString(5, mTLContent.getSpotAddr());
			pstmt.setString(6, mTLContent.getSpotLink());
			
			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}		
		return resultRow;
	}

	// 여행리스트 삭제하기
	public int mTListContentDelete(int tLCidx) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		String sql = "delete from mtlcontent where tLCidx = ?";	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tLCidx);
			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}		
		return resultRow;
	}
	// 내 여행리스트 끝
	
	
	// 댓글
	public int insertReply(int bIdx, String id, String content) {
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int rIdx = -1;
		String sql = "INSERT INTO REPLY (RIDX, BIDX, ID, RCONTENT) VALUES( RIDX_SEQ.NEXTVAL, ?, ?, ?)";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			
			int resultRow = pstmt.executeUpdate();
			if(resultRow>0) {
				String rIdxSql = "SELECT RIDX_SEQ.CURRVAL FROM DUAL";
				pstmt = connection.prepareStatement(rIdxSql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					rIdx = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return rIdx;
	}
	
	public List<Reply> getRepliesByBIdx(int bIdx) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Reply> replies = new ArrayList<Reply>();
		String sql = " SELECT RIDX, RCONTENT, ID, RWDATE FROM REPLY "
						+ " WHERE BIDX = ? ORDER BY RIDX ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
		
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setrIdx(rs.getInt(1));
				reply.setrContent(rs.getString(2));
				reply.setId(rs.getString(3));
				reply.setrWDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(4)));
				reply.setbIdx(bIdx);
				
				replies.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}		
		
		return replies;
	}
	
	public Reply getReply(int rIdx) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Reply reply = new Reply();
		String sql = " SELECT BIDX, RCONTENT, ID, RWDATE FROM REPLY "
						+ " WHERE RIDX = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rIdx);
		
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				reply.setrIdx(rIdx);
				reply.setbIdx(rs.getInt(1));
				reply.setrContent(rs.getString(2));
				reply.setId(rs.getString(3));
				reply.setrWDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(conn);
		}		
		
		return reply;
	}
}
