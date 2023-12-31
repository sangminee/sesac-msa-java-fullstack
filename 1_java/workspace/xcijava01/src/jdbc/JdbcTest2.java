package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcTest2 {
	public static void main(String[] args) {

		// 하나의 값으로 다 받아옴 (Begin Of File -- End Of File)
		String sql = "SELECT employee_id, last_name, salary FROM employees";

		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ace", "ace");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			Class.forName("oracle.jdbc.OracleDriver");

			while (rs.next()) {
				System.out.print(rs.getInt("employee_id") + "\t");
				System.out.print(rs.getString("last_name") + "\t");
				System.out.print(rs.getLong("salary") + "\n");
			}
		} catch (Exception e) {
			System.out.println("실패 : " + e.getMessage());
		} 
		System.out.println("종료");
	}
}
