package net.developia.spring01.article.service;

import java.sql.SQLException;
import java.util.List;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import net.developia.spring01.article.dao.ArticleDAO;
import net.developia.spring01.article.dto.ArticleDTO;

@Slf4j
public class ArticleService { 

	private ArticleDAO dao;
	public ArticleService(ArticleDAO dao) {
		this.dao = dao;
	}

	public void insertArticle(ArticleDTO articleDTO) throws SQLException{
		try {
			dao.insertArticle(articleDTO);
		} catch (SQLException e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	public List<ArticleDTO> getArticleList() throws Exception {
		try {
			return dao.getArticleList();
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}

	public ArticleDTO getDetail(Long no) throws Exception {
		try {
			ArticleDTO dto = dao.getDetail(no);
			if(dto == null) throw new RuntimeException(no + "번 게시물이 존재하지 않습니다.");
			return dto;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}
