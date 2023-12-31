package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcTest3 {
	public static void main(String[] args) {

		// 하나의 값으로 다 받아옴 (Begin Of File -- End Of File)
		String sql = "SELECT employee_id, last_name, salary " 
		           + "FROM employees" 
				   + "WHERE department_id >= ?";

		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ace", "ace");
			PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, 80);
			Class.forName("oracle.jdbc.OracleDriver");
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					System.out.print(rs.getInt("employee_id") + "\t");
					System.out.print(rs.getString("last_name") + "\t");
					System.out.print(rs.getLong("salary") + "\n");
				}
			}
			

		} catch (Exception e) {
			System.out.println("실패 : " + e.getMessage());
		}
		System.out.println("종료");
	}
}
