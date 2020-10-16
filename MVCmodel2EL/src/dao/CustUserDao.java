package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CustUserDto;

public class CustUserDao {

private static CustUserDao dao = new CustUserDao();
	
	private CustUserDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("OracleDriver load Success");
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}
	}
	
	public static CustUserDao getInstance() {
		return dao;
	}
	
	public List<CustUserDto> getCustUserList() {
		
		String sql = " SELECT ID, NAME, ADDRESS "
					+ " FROM CUSTUSER "
					+ " ORDER BY ID DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		
		try {
			conn = this.getConnection();			
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String address = rs.getString("ADDRESS");
				
				list.add( new CustUserDto(id, name, address) );
			}			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, rs);			
		}
		
		return list;
	}
	
	public CustUserDto getCustUserDetail(String id) {
		  String sql = " SELECT ID, NAME, ADDRESS "
		  		+ " FROM CUSTUSER "
		  		+ " WHERE ID = ? ";
		  Connection conn = null;
		  PreparedStatement psmt = null;
		  ResultSet rs = null;
		  
		  CustUserDto dto = null;
		 

		  try {
			 conn = this.getConnection();
			     psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new CustUserDto();
					dto.setId( rs.getString("ID") );
					dto.setName( rs.getString("NAME") );
					dto.setAddress( rs.getString("ADDRESS") );				
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			this.close(conn, psmt, rs);
		}
		  
		  return dto;
		  
	}
	

	public boolean addCustUser(CustUserDto dto) {
		
		String sql = " INSERT INTO CUSTUSER(ID, NAME, ADDRESS) "
						+ " VALUES(?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = this.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getAddress());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}
	
	
	public boolean deleteCustUser(String id) {
		String sql = " DELETE CUSTUSER "
				+ " WHERE ID = ? ";
 		  
		  Connection conn = null;
		  PreparedStatement psmt = null;
		  
		  int count = 0;
		  
		  try {
			conn = this.getConnection();
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn, psmt, null);
		}
		  
		  return count>0?true:false;
	}
	
	
	
	public boolean updateCustUser(String id, String name, String address, String id2 ) {
		String sql = " UPDATE CUSTUSER SET "
				+ " ID= ?, NAME = ?, ADDRESS = ? "
				+ " WHERE ID = ? ";
 		  
		  Connection conn = null;
		  PreparedStatement psmt = null;
		  
		  int count = 0;
		  
		  try {
			conn = this.getConnection();
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, address);
			psmt.setString(4, id2);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn, psmt, null);
		}
		  
		  return count>0?true:false;
	}
	
	
  public boolean deleteCustUsers(String ids[]) {
		
		String sql = " DELETE CUSTUSER "
				+ " WHERE ID = ? ";
		
		 Connection conn = null;
		  PreparedStatement psmt = null;
		  
         int count[] = new int[ids.length];
		  
		  try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(sql);
			
			for(int i = 0; i < ids.length; i++) {
			psmt.setString(1, ids[i]);
			psmt.addBatch();
			}
			
			count = psmt.executeBatch();
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
			} 
			catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			close(conn, psmt, null);
		}
		  
		  boolean isS = true;
		  for (int i = 0; i < count.length; i++) {
			if(count[i] != -2) {       //  - 2 : 정상종료
				   isS = false;
				   break;
			}
		}
		  return isS;
	}
	
	
	
	
	
	
	
	public Connection getConnection()throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "hr";
		
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {		
		try {
			if(conn != null) {
				conn.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(rs != null) {
				rs.close();
			}				
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}
}
