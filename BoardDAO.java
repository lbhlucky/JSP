package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
	// 게시판 데이터베이스작업
	// 패키지 board 파일명 BoardDAO 
	// insertBoard(bb바구니주소값)메서드 정의, 리턴값 없음
	// BoardDAO bdao 객체생성
	// insertBoard(bb바구니주소값)메서드 호출
	
	public void insertBoard(BoardBean bb) {
		
		System.out.println("insertBoard() 호출!");
		System.out.println("num : " +bb.getNum());
		System.out.println("name : " +bb.getName());
		System.out.println("pass : " +bb.getPass());
		System.out.println("subject : " +bb.getSubject());
		System.out.println("content : " +bb.getContent());
		System.out.println("readcount : " +bb.getReadcount());
		System.out.println("date : " +bb.getDate());
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "jspid";
			String dbPass = "jsppass";
			
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "select MAX(num) from board";
			PreparedStatement p = con.prepareStatement(sql);
			
			ResultSet rs = p.executeQuery();
			
			int num = 0;
			if(rs.next()) {
				num = rs.getInt("max(num)")+1;
			}
			
			sql = "insert into board(num, name, pass, subject, content, readcount, date) values(?, ?, ?, ?, ?, ?, ?)";
			
			p = con.prepareStatement(sql);
			
			p.setInt(1, num);
			p.setString(2, bb.getName());
			p.setString(3, bb.getPass());
			p.setString(4, bb.getSubject());
			p.setString(5, bb.getContent());
			p.setInt(6, bb.getReadcount());
			p.setTimestamp(7, bb.getDate());
			
//			p.setInt(1, rs.getInt(bb.getNum()));
//			p.setString(2, rs.getString(bb.getName()));
//			p.setString(3, rs.getString(bb.getPass()));
//			p.setString(4,  rs.getString(bb.getSubject()));
//			p.setString(5, rs.getString(bb.getContent()));
//			p.setInt(6, rs.getInt(bb.getReadcount()));
//			p.setTimestamp(7, rs.getTimestamp(bb.getDate()));
			
			p.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
		}	
		
	}		// insertBoard() 끝
	
	public BoardBean getBoard(int num) {
		BoardBean bb = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "jspid";	
			String dbPass = "jsppass";
			
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "select * from board where num = ?";
			PreparedStatement p = con.prepareStatement(sql);
			
			p.setInt(1, num);
			
			ResultSet rs = p.executeQuery();
			
			if(rs.next()) {
				// bb=객체 생성
				bb = new BoardBean();
				
				// mb set메서드 호출 rs.get()저장
				// id는 private으로 선언됐기 때문에
				// setter()를 이용해서 저장해줘야함
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
			
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return bb;
	}
}
