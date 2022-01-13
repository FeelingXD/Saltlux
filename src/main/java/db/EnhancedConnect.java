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
    public ResultSetMetaData rm = null;
    public PreparedStatement pstmt =null;
    
    public EnhancedConnect() {
        this("jdbc:mysql://localhost/test", "root", "root"); //local 호수트 외부접속되게 나중에 바꿀숙있도록, 뒤에 db 테이블 명 적어두도록 .
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
    
	@SuppressWarnings("rawtypes")
	public void insert(String sql , Pair... elements) {
    	//conn.insert("Insert INTO memeber(id, pw, name,email) VALUES(?,?,?,?);
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int for_num =0 ;for_num<elements.length;for_num++) {
				whatExecuteQuery(sql, (for_num+1), elements[for_num]);
			}
			
			pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
    }

	public void update(String sql) {// update 
    	
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
    
    @SuppressWarnings("rawtypes")
	private void whatExecuteQuery(String sql, int index, Pair element) {
    	try {
    		switch(element.getType()) {
	    	case "Integer":
	    		pstmt.setInt(index, (int)element.getValue());
	    		break;
	    	case "String":
	    		pstmt.setString(index, element.getValue().toString());
	    		break;
	    	}
    	}
	    catch (SQLException e) {
	    	e.printStackTrace();
	    }
    }
}