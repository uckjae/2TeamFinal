package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.bit.dto.Member;
import kr.or.bit.utils.DBHelper;

public class MemberDao {

	public Member login(String id, String pwd) {
		Member member = null;
		System.out.println("id : " + id + "pwd : " + pwd);
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
		}

		return member;
	}
}
