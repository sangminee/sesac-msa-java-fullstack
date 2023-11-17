package article.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import article.dto.ArticleDTO;

public class ArticleDAO {
	
	private static ArticleDAO dao = new ArticleDAO();
	
	private ArticleDAO() {	
		try {
			Class.forName("net.sf.log4jdbc.DriverSpy");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ArticleDAO getInstance() {
		return dao;
	}
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:log4jdbc:oracle:thin:@localhost:1521/xepdb1", "ace", "ace");
	}

	public void insertArticle(ArticleDTO articleDTO) throws SQLException {
		
		String sql = 
				"""
				insert into article(no, title, name, content, password)
				values(seq_article.nextval,?,?,?,?)
				""";
		 
		try (Connection conn = getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			 pstmt.setString(1, articleDTO.getTitle());
			 pstmt.setString(2, articleDTO.getName());
			 pstmt.setString(3, articleDTO.getContent());
			 pstmt.setString(4, articleDTO.getPassword());
			 pstmt.executeQuery();		
		}
	}

	public List<ArticleDTO> getArticleList() throws SQLException {
		String sql = 
				"""
			   select
				    no,
				    title,
				    name,
				    regdate,
				    readcount
				from
				    article
				order by no desc
				""";
		 
		List<ArticleDTO> list = new ArrayList<>();
		try (Connection conn = getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getLong("no"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				list.add(dto);
			}
			return list;
		}
	}

}
