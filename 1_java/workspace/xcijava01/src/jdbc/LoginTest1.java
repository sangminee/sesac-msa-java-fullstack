package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import org.apache.commons.codec.digest.DigestUtils;

public class LoginTest1 {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
	    System.out.print("id : "); 
	    String userid = sc.nextLine();
	    System.out.print("pw : "); 
	    String userpw = DigestUtils.sha512Hex(sc.nextLine());
	    
		String sql = "SELECT userid, name "
				   + "FROM members"
				  + " WHERE userid ='" + userid+"' and userpw='"+userpw +"'";
		
		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ace", "ace");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			Class.forName("oracle.jdbc.OracleDriver");

			if (rs.next()) { // 한번만 확인하면 되기 때문 
				System.out.println(rs.getString("userid") + "(" + 
			                       rs.getString("name") + ") 님이 로그인 하였습니다.");
			}
		} catch (Exception e) {
			System.out.println("아이디 혹은 비번이 틀립니다.");
		}
		System.out.println("종료");
	}
}
