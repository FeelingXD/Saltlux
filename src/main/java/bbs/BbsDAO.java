package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	//기본 생성자
	public BbsDAO() {
		try {
			String url = "jdbc:mysql://localhost:3307/Saltlux";
			String user = "root";
			String password = "1234";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		}catch (Exception e) {
			e.printStackTrace();
		}
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
	
	//게시글 번호 부여 메소드
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
	
	//글쓰기 메소드

	
	public int write(String bbsTitle, String userID, String bbsContent ,String bbsCategory) {
		String sql = "insert into bbs values(?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //글의 유효번호
			pstmt.setInt(7, 0);// 조회수 0부터 시작

			pstmt.setString(8, bbsCategory);

			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int write(String bbsTitle, String userID, String bbsContent) { //@overload 
		return this.write(bbsTitle,userID,bbsContent,"journal");
	}
	
	//게시글 리스트 메소드

		public ArrayList<Bbs> getList(int pageNumber,String category){
			String sql = "SELECT @rownum := @rownum + 1 AS ROWNUM,T.* from bbs T,(select@rownum:=0) TMP where bbsID < ? and bbsAvailable = 1 and bbsCategory = '"+ category +"' order by rownum desc limit 10";

			ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setRownum(rs.getInt(1));
					bbs.setBbsID(rs.getInt(2));
					bbs.setBbsTitle(rs.getString(3));
					bbs.setUserID(rs.getString(4));
					bbs.setBbsDate(rs.getString(5));
					bbs.setBbsContent(rs.getString(6));
					bbs.setBbsAvailable(rs.getInt(7));
					bbs.setHit(rs.getInt(8));
					list.add(bbs);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		//----------카운트
		
		public int selectCnt(String table){
			int result = 0;
			ResultSet rs = null;
			String sql = "select count(*) from " + table + " where bbsAvailable = 1";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					result = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//----------검색카운트
		public int searchCnt(String searchField,String searchText){
			int result = 0;
			ResultSet rs = null;
			String sql = "select count(*) from bbs WHERE "+searchField.trim() +"= '"+searchText.trim() +"'";
			
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					result = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
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
		
		// 게시글 뷰
		public Bbs getBbs(int bbsID) {
			String sql = "select * from bbs as b left join image as i on b.bbsID=i.bbsid where b.bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					int hit=rs.getInt(7); 
					bbs.setFilename(rs.getString(8));
					bbs.setHit(hit);
					hit++;
					bbs.setFilename(rs.getString("path"));
					updateHit(hit,bbsID);//조회수 업데이트
					return bbs;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		// 조회수 업데이트 
		public int updateHit(int hit, int bbsID) {
			
			String sql = "update bbs set hit=? where bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hit);
				pstmt.setInt(2,bbsID);
				return pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return -1; //데이터베이스 오류
		}
		
		//게시글 수정 메소드		
		public int update(int bbsID, String bbsTitle, String bbsContent) {
			String sql = "update bbs set bbsTitle = ?, bbsContent = ? where bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bbsTitle);
				pstmt.setString(2, bbsContent);
				pstmt.setInt(3, bbsID);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		//게시글 삭제 메소드
		public int delete(int bbsID) {
			//테이블 데이터 삭제가 아니라 유효번호를 수정하여 데이터 보존
			String sql = "update bbs set bbsAvailable = 0 where bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsID);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
		}
		public ArrayList<Bbs> getSearch(String searchField, String searchText){//특정한 리스트를 받아서 반환
		      ArrayList<Bbs> list = new ArrayList<Bbs>();

		      String SQL ="select @rownum := @rownum + 1 AS ROWNUM,T.* from bbs as T,(select@rownum:=0) TMP WHERE "+searchField.trim();

		      try {
		            if(searchText != null && !searchText.equals("") ){
		                SQL +=" LIKE '%"+searchText.trim()+"%'  and bbsAvailable = 1 order by rownum desc limit 10";
		            }
		            PreparedStatement pstmt=conn.prepareStatement(SQL);
					rs=pstmt.executeQuery();//select
		         while(rs.next()) {
		            Bbs bbs = new Bbs();
		            bbs.setRownum(rs.getInt(1));
					bbs.setBbsID(rs.getInt(2));
					bbs.setBbsTitle(rs.getString(3));
					bbs.setUserID(rs.getString(4));
					bbs.setBbsDate(rs.getString(5));
					bbs.setBbsContent(rs.getString(6));
					bbs.setBbsAvailable(rs.getInt(7));
					bbs.setHit(rs.getInt(8));
		            list.add(bbs);//list에 해당 인스턴스를 담는다.
		         }         
		      } catch(Exception e) {
		         e.printStackTrace();
		      }
		      return list;//
		   }
		
}