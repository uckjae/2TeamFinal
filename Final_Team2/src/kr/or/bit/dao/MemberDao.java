package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.bit.dto.Member;
import kr.or.bit.utils.DBHelper;

public class MemberDao {

	public Member login() {
		Member member = null;

		Connection connection = DBHelper.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ID, ISADMIN FROM MEMBER WHERE ID=? AND PWD=?";

		try {
			pstmt = connection.prepareStatement(sql);
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
