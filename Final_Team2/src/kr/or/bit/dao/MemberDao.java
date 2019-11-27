package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.crypto.provider.RSACipher;
import com.sun.xml.internal.ws.runtime.config.TubelineFeature;

import kr.or.bit.dto.Member;
import kr.or.bit.utils.DBHelper;
import sun.awt.util.IdentityArrayList;

public class MemberDao {

	public Member login(String id, String pwd) {
		Member member = null;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT ID, ISADMIN, ISDISABLE FROM MEMBER WHERE ID=? AND PWD=?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getString(1));
				member.setAdmin(rs.getBoolean(2));
				member.setDisable(rs.getBoolean(3));
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

		String sql = "INSERT INTO MEMBER (ID, PWD, NAME, BIRTH, GENDER, ADDRESS, EMAIL, ISADMIN) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, 0)";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setBoolean(5, member.isGender());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getEmail());

			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}

	public boolean updateMemeber(String id, String name, String pwd, String address, int isDisable) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE MEMBER SET NAME = ?, PWD = ?, ADDRESS = ?, ISDISABLE = ? WHERE ID = ?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, pwd);
			pstmt.setString(3, address);
			pstmt.setInt(4, isDisable);
			pstmt.setString(5, id);

			resultRow = pstmt.executeUpdate();
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

		String sql = "DELETE FROM MEMBER WHERE ID = ?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}

	public Member getMemberById(String id) {
		Member member = null;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT ID, PWD, NAME, BIRTH, HIREDATE, GENDER, ADDRESS, EMAIL, ISDISABLE, ISADMIN FROM MEMBER "
				+ "WHERE ID = ? AND ISADMIN ! = 1";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member();
				member.setId(id);
				member.setPwd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getString(4));
				member.setHireDate(rs.getDate(5));
				member.setGender(rs.getBoolean(6));
				member.setAddress(rs.getString(7));
				member.setEmail(rs.getString(8));
				member.setDisable(rs.getBoolean(9));
				member.setAdmin(rs.getBoolean(10));
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

	public String getMemberIdByEmail(String email) {
		String id = null;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT ID FROM MEMBER " + "WHERE EMAIL = ?	AND ISADMIN ! = 1";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return id;
	}

	public List<Member> getMembersByIsAdmin(boolean isAdmin) {
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Member> members = new ArrayList<Member>();

		String sql = "SELECT ID, PWD, NAME, BIRTH, HIREDATE, GENDER, ADDRESS, EMAIL, ISDISABLE FROM MEMBER WHERE ISADMIN = ?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setBoolean(1, isAdmin);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString(1));
				member.setPwd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setBirth(rs.getString(4));
				member.setHireDate(rs.getDate(5));
				member.setGender(rs.getBoolean(6));
				member.setAddress(rs.getString(7));
				member.setEmail(rs.getString(8));
				member.setDisable(rs.getBoolean(9));
				member.setAdmin(isAdmin);

				members.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return members;
	}

	// Admin
	public boolean insertAdmin(String id, String pwd) {
		System.out.println("in inset db");
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO MEMBER (ID, PWD, ISADMIN, NAME) VALUES( ?, ?, 1, '관리자') ";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}

	public boolean updateAdmin(String id, String pwd) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE MEMBER SET PWD = ? WHERE ID = ?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);

			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}

	public boolean isUseMemberId(String id) {
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;

		String sql = "SELECT ID FROM MEMBER WHERE ID = ?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return result;
	}

	public boolean updateTempPassword(String id, String pwd) {
		int resultRow = 0;
		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE MEMBER SET PWD = ? WHERE ID = ?";

		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);

			resultRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(connection);
		}

		return resultRow > 0 ? true : false;
	}
}
