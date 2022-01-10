import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EnhancedConnect {
    public Connection conn = null;
    public Statement stmt = null;
    public ResultSet rs = null;
    
    public EnhancedConnect() {
        this("jdbc:mysql://localhost/", "root", "root");
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
            return rs;
        } 
        catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
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