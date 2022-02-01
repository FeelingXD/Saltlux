package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class EnhancedConnect {
    public Connection conn = null;
    public Statement stmt = null;
    public ResultSet rs = null;
    public ResultSetMetaData rm = null; //
    public PreparedStatement pstmt = null;
 
    
    public EnhancedConnect() { // test 환경에 맞게 수정할것 .

        this("jdbc:mysql://localhost:3307/Saltlux", "root", "root"); 
    }
    
    public EnhancedConnect(String server, String user, String pw) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(server, user, pw);
            stmt = conn.createStatement();
        }
        catch (Exception e) {
            System.err.println("DB Error" + e.getMessage());
        }
    }
    
    public ResultSet select(String sql) {
        try {
            rs = this.stmt.executeQuery(sql);
            rm = (ResultSetMetaData) this.rs.getMetaData();
            return rs;
        } 
        catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public ResultSet select(String sql, String str) {//@only String value;
    	try { //where= '?' = > str
    		pstmt = this.conn.prepareStatement(sql);
    		pstmt.setString(1, str);
    		return pstmt.executeQuery();
    		
    	}catch(SQLException e) {
    		e.printStackTrace();
    		return null;
    	}
    }
    
    public void insert_Strings(String sql,String...strs) {// @only insert Strings value
    	try {
    		pstmt =this.conn.prepareStatement(sql);
    		for(int for_num= 0; for_num<strs.length; for_num++) {
    			pstmt.setString(for_num+1 , strs[for_num]);
    		}
    		pstmt.executeUpdate();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    public void insert_PhotoContent( String userid,String category , HashMap<String, String> multi) {
    	//LAST_INSERT_ID()
    	String sql_board ="insert into bbs values(?,?,?,?,?,?,?,?)";//
    
    	String sql_image ="insert into image values(?,?,?,?)";// 
    	try {
    		
    		conn.setAutoCommit(false);
    	
    		PreparedStatement pstmt =conn.prepareStatement(sql_board);
    		pstmt.setInt(1, getNext());
			pstmt.setString(2, multi.get("bbsTitle"));
			pstmt.setString(3, userid);// userid
			pstmt.setString(4, getDate());
			pstmt.setString(5, multi.get("bbsContent"));
			pstmt.setInt(6, 1); //글의 유효번호
			pstmt.setInt(7, 0);// 조회수 0부터 시작
			pstmt.setString(8, category);
			pstmt.execute();
    		PreparedStatement pstmt2 =conn.prepareStatement(sql_image);
    		
    	}catch(SQLException e) {
    		
    		e.printStackTrace();
    	}
    }
    public void update(String sql) {// update s
    	
    }
   
    public void delete(String sql) {//  delete 
    	
    }
    
    //--- TDD insert_hash 
    public void insert_hash(String userid,String category ,Map<String, String> multi) throws SQLException {
    	String sql_board ="insert into bbs values(?,?,?,?,?,?,?,?)";//
        
    	String sql_image ="insert into image values(?,?,?)";// 
    	int next =getNext();
    	String date= getDate();
    	
    	try {
    		conn.setAutoCommit(false);
    		
    		PreparedStatement pstmt =conn.prepareStatement(sql_board);
  			
	    	pstmt.setInt(1, next);
			pstmt.setString(2, multi.get("bbsTitle"));
			pstmt.setString(3, userid);// 
			pstmt.setString(4, date);
			pstmt.setString(5, multi.get("bbsContent"));
			pstmt.setInt(6, 1); //글의 유효번호
			pstmt.setInt(7, 0);// 조회수 0부터 시작
			pstmt.setString(8, category);
			pstmt.executeUpdate();
			
			PreparedStatement pstmt2 =conn.prepareStatement(sql_image);
			pstmt2.setInt(1, next);
			pstmt2.setString(2, multi.get("image"));
			pstmt2.setString(3, multi.get("path"));
			pstmt2.executeUpdate();
			
			conn.commit();
    		
    	}catch(SQLException e) {
    		conn.rollback();
    		e.printStackTrace();
    	}finally {
    		conn.setAutoCommit(true);
    	}
    	
    }
    
   //-----
    public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
    public int last_In() {
    	
    	String sql = "SELECT max(last_insert_id(bbsID)) FROM Saltlux.bbs";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return rs.getInt(1);
    		}
    	}catch(SQLException e)
    	{
    		e.printStackTrace();
    	}
    	return -1;
    }
    public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
    
    public void close() {
        try {
            if (this.rs != null)
                this.rs.close();
            if (this.stmt != null)
                this.stmt.close();
            if (this.conn != null)
                this.conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}