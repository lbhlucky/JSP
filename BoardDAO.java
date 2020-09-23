package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	// 게시판 데이터베이스작업
	// 패키지 board 파일명 BoardDAO 
	// insertBoard(bb바구니주소값)메서드 정의, 리턴값 없음
	// BoardDAO bdao 객체생성
	// insertBoard(bb바구니주소값)메서드 호출
	public Connection	getConnection() throws Exception{
		Connection con = null;
		
		Class.forName("com.mysql.jdbc.Driver");
	
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
		String dbUser = "jspid";
		String dbPass = "jsppass";

		con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		return con;
	}
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
	
			Connection con = getConnection();
			
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
			
			Connection con = getConnection();
			
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
	
	public List getBoardList() {
		// 여러개 바구니는 저장할 기억장소만들기(배열형태의 자바프로그램)
		List boardList = new ArrayList();
		try {
			Connection con = getConnection();
			
			String sql = "select * from board order by num desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 4단계 = sql 구문 실행 - 결과저장
			ResultSet rs = pstmt.executeQuery();

			// 5단계 rs첫행으로 이동 num pass name 등등 가져와서
			// 하나의 바구니에 저장
			while(rs.next()) {
				// 첫번째 행 = 게시판 글 하나 => 자바빈
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				// 배열의 첫번째 칸에 바구니 하나를 저장
				boardList.add(bb);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return boardList;
	}
	
	
	
	
	public int numCheck(BoardBean bb) {
		int check=-1;
		try {
			// JDBC 프로그램 설치
			// 1,2 단계 디비연결 메서드 호출
			 Connection con=getConnection();
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
			String sql="select * from board where num=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			// 4단계 - sql구문 실행(select) => 결과 저장
			ResultSet rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 
			// rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
			if(rs.next()){
				// "폼에서 가져온 비밀번호".equals("디비에서 가져온 비밀번호")
				if(bb.getPass().equals(rs.getString("pass"))){
					check=1; //num 비밀번호 일치
				}else{
					check=0;//비밀번호틀림
				}
			}else {
				check=-1;	//num 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
		}
		return check;
	}
	
	public void updateBoard(BoardBean bb) {
		try {
			Connection con = getConnection();
			
			String sql="update board set name=?,subject=?,content=? where num=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, bb.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	}
	
	public void deleteBoard(BoardBean bb) {
		try {
			Connection con = getConnection();
			
			String sql = "delete from board where num=? and pass=?";
			
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			pstmt.setString(2, bb.getPass());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
	}
}
