package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.PdsDto;

public class PdsDao {
	
	private static PdsDao dao = new PdsDao();
	
	private PdsDao() {
		
	}
   
	public static PdsDao getInstance() {
		return dao;
	}
	public List<PdsDto> getPdsList() {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, "
				    + " READCOUNT, DOWNCOUNT, REGDATE "
				    + " FROM PDS "
				    + " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PdsDto> list = new ArrayList<PdsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getPdsList success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getPdsList success");
			rs = psmt.executeQuery();
			System.out.println("3/6 getPdsList success");
			while(rs.next()) {
				int i = 1;
				
				PdsDto dto = new PdsDto( rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), 
						                 rs.getString(i++), rs.getInt(i++), rs.getInt(i++), rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/6 getPdsList success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	public boolean writePds(PdsDto pds) {
		
		String sql = " INSERT INTO PDS(SEQ, ID, TITLE, CONTENT, FILENAME, "
				                       + " READCOUNT, DOWNCOUNT, REGDATE) "
				     + " VALUES(SEQ_PDS.NEXTVAL, ?, ?, ?, ?, "
				     + " 0, 0, SYSDATE) ";
		
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writePds success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getId());
			psmt.setString(2, pds.getTitle());
			psmt.setString(3, pds.getContent());
			psmt.setString(4, pds.getFilename());
			System.out.println("2/6 writePds success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writePds success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	
	public PdsDto detailPds(int seq) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, "
				+ " READCOUNT, DOWNCOUNT, REGDATE "
				+ " FROM PDS "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PdsDto pds = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 detailPds success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 detailPds success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 detailPds success");
			
			if(rs.next()) {
				int i = 1;
				
			pds = new PdsDto( rs.getInt(i++), rs.getString(i++) , rs.getString(i++), 
				   rs.getString(i++), rs.getString(i++), rs.getInt(i++),rs.getInt(i++), rs.getString(i++));
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return pds;
	}
	
public boolean deletePds(int seq) {
		
		String sql = " DELETE PDS "
				+ " WHERE SEQ=? ";
		
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writePds success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			System.out.println("2/6 writePds success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writePds success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}

 public boolean updatePds(PdsDto pds, int seq) {
	String sql = " UPDATE PDS "
			+ " SET ID=?, TITLE=? , CONTENT=?, FILENAME=?, "
			+ " REGDATE= SYSDATE "
			+ " WHERE SEQ=? ";
	
   Connection conn = null;
   PreparedStatement psmt = null;
   
  int count = 0;
  try {
	  conn = DBConnection.getConnection();
	  System.out.println("1/6 updatePbs success");
	 
	  psmt = conn.prepareStatement(sql);
	  psmt.setString(1, pds.getId());
	  psmt.setString(2, pds.getTitle());
	  psmt.setString(3, pds.getContent());
	  psmt.setString(4, pds.getFilename());  
	  psmt.setInt(5, seq);
	  System.out.println("2/6 updatePbs success");
	  
	  count = psmt.executeUpdate();
	  System.out.println("3/6 updatePbs success");
} catch (Exception e) {
	e.printStackTrace();
}finally {
	DBClose.close(psmt, conn, null);
}
  return count > 0? true: false;
}
}























