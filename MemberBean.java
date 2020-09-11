package member;

import java.sql.Timestamp;

//파라미터를 바구니에 담아서 전달(바구니 생성)
//패키지 member 파일이름 MemberBean
//멤버변수 - id, pass, name, date

public class MemberBean {
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Timestamp getDate() {
		return date;
	}
	
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
