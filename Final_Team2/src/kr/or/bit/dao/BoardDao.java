package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
	// 총 게시글 수 구하기
	public int freeBoardTotalBoardCount() {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int totalcount = 0;
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
				freeBoard.setwDate(resultSet.getDate(5));
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
		
		String sql = "SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM FROM FREEBOARD F JOIN BOARD B ON F.BIDX = B.BIDX WHERE B.BIDX=?";
		
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
	public boolean freeContentWrite(String id, String title, String content) {
		int resultRow = 0;
		int refer = 0;
		Connection connection = DBHelper.getConnection();
		//select max(board_num) from board
		ResultSet resultSet = null;
		PreparedStatement pstmt = null;
		String referNum = "SELECT NVL(MAX(FIDX),0) FROM FREEBOARD";
		String sql1 = "INSERT INTO BOARD(BIDX, ID, TITLE, CONTENT, WDATE, RNUM, BCODE) VALUES(BIDX_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, 4)";
		String sql2 = "INSERT INTO FREEBOARD(FIDX, BIDX, REFER, DEPTH, STEP) VALUES(FIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, ?, 0, 0)";
		try {
			pstmt = connection.prepareStatement(referNum);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				refer = resultSet.getInt(1) + 1;
			}
		
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement(sql1);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			resultRow = pstmt.executeUpdate();
			pstmt = connection.prepareStatement(sql2);
			pstmt.setInt(1, refer);
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				connection.commit();
			}
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

		return resultRow > 0 ? true : false;
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
			List<NoticeBoard> nboard = new ArrayList<>();;
			
			Connection connection = DBHelper.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " SELECT B.BIDX, B.ID, B.TITLE, B.CONTENT, B.WDATE, B.RNUM, N.NIDX, N.ISTOP"
						  +"FROM BOARD B JOIN NOTICEBOARD N ON B.BIDX = N.BIDX"
						  +"WHERE B.BCODE = 1";
			try {
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					NoticeBoard board = new NoticeBoard();
					board.setbIdx(rs.getInt(1));
					board.setId(rs.getString(2));
					board.setTitle(rs.getString(3));
					board.setContent(rs.getString(4));
					board.setwDate(rs.getDate(5));
					board.setrNum(rs.getInt(6));
					board.setnIdx(rs.getInt(7));
					board.setTop(rs.getBoolean(8));
					
					nboard.add(board);
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
			
			return nboard;
		}
	// 공지 게시판 게시글 상세보기
	public NoticeBoard noticeContent() {
		return null;
	}

	// 공지 게시판 글쓰기
	// 공지 게시판 글쓰기	
			public boolean noticeWrite(String Id, String title, String content, boolean isTop) {
				int resultRow = 0;
				Connection connection = DBHelper.getConnection();
				PreparedStatement pstmt = null;

				String Sql1 = "INSERT INTO BOARD (BIDX,ID,TITLE,CONTENT,WDATE,RNUM,BCODE)"
						+ "VALUES (BIDX_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, 1) ";
				String Sql2 = "INSERT INTO NOTICEBOARD (NIDX, BIDX, ISTOP) "
						+ "VALUES (NIDX_SEQ.NEXTVAL, BIDX_SEQ.CURRVAL, 0) ";

				try {
					connection.setAutoCommit(false);

					pstmt = connection.prepareStatement(Sql1);
					pstmt.setString(1, Id);
					pstmt.setString(2, title);
					pstmt.setString(3, content);
					pstmt.executeUpdate();

					pstmt = connection.prepareStatement(Sql2);
					pstmt.setBoolean(0, isTop);

					resultRow = pstmt.executeUpdate();
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

				return resultRow > 0 ? true : false;
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
				board.setbIdx(rs.getInt(1));
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
	public int insertQnABoard(String memberId, String title, String content, boolean isPublic) {
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
			pstmt.setBoolean(1, isPublic);
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

	// 나만의 코스 게시판 게시글 상세보기
	public MCBoard courseContent() {
		return null;
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
	public int mTLFolderAdd(MTList mtFolder) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		String sql = "insert into MTLIST (tlidx,id,tlname) values (TLIdx_SEQ.nextval,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mtFolder.getId());
			pstmt.setString(2, mtFolder.gettLName());
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
	public int mTLFolderEdit(MTList mtFolder) {
		Connection conn = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		int resultRow = 0;
		String sql = "update mtlist set tlname= ? where id= ? and TLIdx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mtFolder.gettLName());
			pstmt.setString(2, mtFolder.getId());
			pstmt.setInt(3, mtFolder.gettLidx());
			resultRow =	pstmt.executeUpdate();
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
}
