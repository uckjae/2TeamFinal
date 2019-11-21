package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.sun.xml.internal.ws.runtime.config.TubelineFeature;

import kr.or.bit.dto.Member;
import kr.or.bit.utils.DBHelper;

public class MemberDao {

	public Member login(String id, String pwd) {
		Member member = null;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT ID, ISADMIN FROM MEMBER WHERE ID=? AND PWD=?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getString(1));
				member.setAdmin(rs.getBoolean(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return member;
	}

	public boolean insertMemeber(Member member) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "";
		
		try {
			pstmt = connection.prepareStatement(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}

	public boolean updateMemeber(Member member) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "";

		try {
			pstmt = connection.prepareStatement(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return resultRow > 0 ? true : false;
	}

	public boolean deleteMemeberById(String id) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "";

		try {
			pstmt = connection.prepareStatement(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return resultRow > 0 ? true : false;
	}

	public Member getMemberById(String id) {
		Member member = new Member();

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {
			pstmt = connection.prepareStatement(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return member;
	}

	public List<Member> getMembers() {
		List<Member> members = null;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {
			pstmt = connection.prepareStatement(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}
		
		return members;
	}
}
