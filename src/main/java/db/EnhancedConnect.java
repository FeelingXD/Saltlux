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

  //게시글 번호 부여 메소드
  	public int getNext() {
  		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
  		String sql = "select num from board order by num desc";
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
  //작성일자 메소드
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
  	
  
  	
  	//글쓰기 메소드
  	public int write(String title, String id, String content) {
  		String sql = "insert into board values(?, ?, ?, ? )";
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(sql);
  			pstmt.setInt(1, getNext());
  			pstmt.setString(2, id);
  			pstmt.setString(3, title);
  			pstmt.setString(4, content);
  		
  			return pstmt.executeUpdate();
  		}catch (Exception e) {
  			e.printStackTrace();
  		}
  		return -1; //데이터베이스 오류
  	}
  	
  	//게시글 리스트 메소드
  	public ArrayList<boardDTA> getList(int pageNumber){
  		String sql = "select * from board where num < ? and bbsAvailable = 1 order by bbsID desc limit 10";
  		ArrayList<Bbs> list = new ArrayList<Bbs>();
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(sql);
  			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				Bbs bbs = new Bbs();
  				bbs.setBbsID(rs.getInt(1));
  				bbs.setBbsTitle(rs.getString(2));
  				bbs.setUserID(rs.getString(3));
  				bbs.setBbsDate(rs.getString(4));
  				bbs.setBbsContent(rs.getString(5));
  				bbs.setBbsAvailable(rs.getInt(6));
  				list.add(bbs);
  			}
  		}catch (Exception e) {
  			e.printStackTrace();
  		}
  		return list;
  	}
  	
  	//페이징 처리 메소드
  	public boolean nextPage(int pageNumber) {
  		String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1";
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(sql);
  			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				return true;
  			}
  		}catch (Exception e) {
  			e.printStackTrace();
  		}
  		return false;
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