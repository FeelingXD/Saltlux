package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class EnhancedConnect {
    public Connection conn = null;
    public Statement stmt = null;
    public ResultSet rs = null;
    public ResultSetMetaData rm = null; //
    public PreparedStatement pstmt = null;
 
    
    public EnhancedConnect() { // test 환경에 맞게 수정할것 .
        this("jdbc:mysql://localhost:3306/test", "root", "dbgood"); 
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
    
    public void update(String sql) {// update s
    	
    }
    //--------------------------------------
    public int selectCnt(String table){
		int result = 0;
		ResultSet rs = null;
		String sql = "select count(*) from "+table;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try { // 다 썻으니 닫아줘야 한다.
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

 
    public void delete(String sql) { //  delete 
    	
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