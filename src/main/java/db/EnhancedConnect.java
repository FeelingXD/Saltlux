package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class EnhancedConnect {
    public Connection conn = null;
    public Statement stmt = null;
    public ResultSet rs = null;
    public ResultSetMetaData rm = null; //
    public PreparedStatement pstmt = null;
    
    public EnhancedConnect() {
        this("jdbc:mysql://localhost:3307/Saltlux", "root", "root"); //local �샇�닔�듃 �쇅遺��젒�냽�릺寃� �굹以묒뿉 諛붽��닕�엳�룄濡�, �뮘�뿉 db �뀒�씠釉� 紐� �쟻�뼱�몢�룄濡� .
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
    public void insert_Strings(String sql,String...strs) {// @only insert Strings value
    	try {
    		pstmt =this.conn.prepareStatement(sql);
    		System.out.println(sql);
    		for(int for_num= 0; for_num<strs.length; for_num++) {
    			pstmt.setString(for_num+1 , strs[for_num]);
    			System.out.println(for_num+1);
    			System.out.println(strs[for_num]);
    		}
    		pstmt.executeUpdate();
    	
    	
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    public void update(String sql) {// update s
    	
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