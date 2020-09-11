package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//DB작업
//패키지 member 파일이름 MemberDAO 
//insertMenber(바구니주소) 메서드 정의, 리턴값 없음

public class MemberDAO {

	public void insertMember(MemberBean mb) {

		System.out.println("insertMember() 호출!!");
		System.out.println("주소 : " + mb);
		System.out.println("아 이 디 : " + mb.getId());
		System.out.println("비밀번호 : " + mb.getPass());
		System.out.println("이    름 : " + mb.getName());
		System.out.println("가입날짜 : " + mb.getDate());

//---------------------------아래 코드를 사용하려면 "예외처리"를 해줘야함!--------------------

//	 예외처리 : 예기치 않게 발생한 에러를 처리할 수 있는 만든 코드
//	System.out.println("program start");
//	int a = 10;
//	int b = 0;

		// 수동 예외처리 if-else
//	if(b != 0) {
//		System.out.println(a/b);
//	} else {
//		System.out.println("b=0");
//	}

		// 자동 예외처리 try-catch
//	try {
//		// 예외발생 코드
//		System.out.println(a/b);
//	} catch (Exception e) {
//		// 예외발생 처리 코드
//		System.out.println("b=0");
//	} finally {
//		// 예외 상관없이 처리되는 코드
//		System.out.println("예외상관없이 처리됨");
//	}

//	System.out.println("program finish");
		try {

			// 예외 발생 가능 코드

//	 	// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
			Class.forName("com.mysql.jdbc.Driver");

//	 	// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 DB서버 접속
//	 	//  => 접속 정보 저장
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "jspid";
			String dbPass = "jsppass";

			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

//	 	// 3단계 - 접속 정보를 이용해서 select sql 구문을 만들고
//	 	// 실행할 수 있는 자바프로그램 생성
			String sql = "INSERT INTO member(id, pass, name, date) VALUES(?, ?,  ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4, mb.getDate());

//	 	// 4단계 sql 구문 실행
			pstmt.executeUpdate();

		} catch (Exception e) {

			// 예외발생 시 출력
			e.printStackTrace();

		} finally {

			// 예외상관없이 처리됨

		}

	} // insertMember() 메서드 끝

	// MemberDAO MemberBean형 주소리턴 getMember(id)메서드 정의
	public MemberBean getMember(String id) {
		MemberBean mb = null;		// 참조형의 초기값
		
		try {
			 // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
			Class.forName("com.mysql.jdbc.Driver");
			
			// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
    		//        => 접속정보 저장
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "jspid";	
			String dbPass = "jsppass";
			
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 
			// 			실행할수 있는 자바프로그램 생성
			String sql = "select * from member where id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			 // 4단계 - sql구문 실행(select) => 결과 저장
			ResultSet rs = pstmt.executeQuery();
			
			// rs.next() 다음행이동 했을때 데이터가 있으면  true 
			//								 데이터가 없으면 false
			if(rs.next()) {
				// mb=객체 생성
				mb = new MemberBean();
				
				// mb set메서드 호출 rs.get()저장
				// id는 private으로 선언됐기 때문에
				// setter()를 이용해서 저장해줘야함
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setDate(rs.getTimestamp("date"));
			
			}
		}
			catch (Exception e) {
				e.printStackTrace();
				
		} finally {
			// 마무리
		}
		return mb;

	}	// getMember() 메서드 끝
	
}// memberDAO 클래스 끝
