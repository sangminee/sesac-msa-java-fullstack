package article.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.dto.ArticleDTO;
import article.service.ArticleService;
import lombok.extern.log4j.Log4j;
import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

@Log4j
public class ArticleList extends AbstractController{

	ArticleService service = ArticleService.getInstance();
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<ArticleDTO> list = service.getArticleList();
			return new ModelAndView("/WEB-INF/article/list.jsp","list",list);
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("/WEB-INF/article/result.jsp");
			mav.addObject("msg", "게시물 리스트 출력 실패");
			mav.addObject("url", "../"); // index.jsp 로 이동 
			return mav;
		}
		
	}

}
