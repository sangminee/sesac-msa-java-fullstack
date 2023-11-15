package article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.dto.ArticleDTO;
import lombok.extern.log4j.Log4j;
import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

@Log4j
public class ArticleInsertAction extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		String name     = request.getParameter("name");
		String title    = request.getParameter("title");
		String password = request.getParameter("password");
		String content  = request.getParameter("content");
		
		ArticleDTO articleDTO = new ArticleDTO();
		articleDTO.setName(name);
		articleDTO.setTitle(title);
		articleDTO.setPassword(password);
		articleDTO.setContent(content);
		
		log.info(articleDTO);
		
		return new ModelAndView("/WEB-INF/article/insertAction.jsp");
	}

}
