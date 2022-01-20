package dao;

public class page {
	public Vector<EnhancedConnect> selectPage(String table, int start, int pageCnt){
		ResultSet rs=null;
		
		String SQL = "SELECT * FROM "+table+" limit ?, ?";
		Vector<TestDTO> v = new Vector<TestDTO>();
		
		try{
			pstmt = conn.prepareStatement(SQL); // db에 연결하여 SQL 사용 준비
			pstmt.setInt(1, start);
			pstmt.setInt(2, pageCnt);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TestDTO dto = new TestDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				v.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try { // 다 썻으니 닫아줘야 한다.
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
[출처] [JSP] 게시판 페이징 처리|작성자 피끄
}
