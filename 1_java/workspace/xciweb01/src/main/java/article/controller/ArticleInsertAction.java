package article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.dto.ArticleDTO;
import article.service.ArticleService;
import lombok.extern.log4j.Log4j;
import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

@Log4j
public class ArticleInsertAction extends AbstractController{

	ArticleService service = ArticleService.getInstance();
	
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
		try {
			service.insertArticle(articleDTO);
			return new ModelAndView("redirect:list");
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("/WEB-INF/article/result.jsp");
			mav.addObject("msg", "게시물 입력 실패\\n입력 폼으로 되돌아갑니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
		
	}

}
