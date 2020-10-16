package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {
	
	private static BbsDao dao = new BbsDao();
	
	private BbsDao() {
		
	}

	public static BbsDao getInstance() {
		return dao;
	}

    public List<BbsDto> getBbsList() {
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE "
				+ " DEL, READCOUNT "
				+ " FROM BBS "
				+ " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList success");
			
			while(rs.next()) {
				int i = 1;
				BbsDto dto = new BbsDto(rs.getInt(i++),
						                rs.getString(i++), 
						                rs.getInt(i++),
						                rs.getInt(i++),
						                rs.getInt(i++),
						                rs.getString(i++),
						                rs.getString(i++),
						                rs.getString(i++),
						                rs.getInt(i++),
						                rs.getInt(i++));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
    
    public boolean writeBbs(BbsDto dto) {
		String sql = " INSERT INTO BBS "
				+ " (SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT) "
				+ " VALUES( SEQ_BBS.NEXTVAL, ?, "
				+ " (SELECT NVL(MAX(REF), 0)+1 FROM BBS), 0, 0, "
				+ " ?, ?, SYSDATE, "
				+ " 0, 0";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeBbs success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			System.out.println("2/6 writeBbs success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writeBbs success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBClose.close(psmt, conn, null);
	
		}
		return count>0?true:false;
	}
}























