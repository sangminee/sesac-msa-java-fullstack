package net.developia.spring01.article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import lombok.AllArgsConstructor;
import net.developia.spring01.article.dto.ArticleDTO;
import net.developia.spring01.article.service.ArticleService;

@AllArgsConstructor
public class ArticleDetail extends AbstractController{

	private ArticleService service;
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long no =Long.parseLong(request.getParameter("no"));
        try {
        	ArticleDTO dto = service.getDetail(no);
            return new ModelAndView("article/detail", "dto", dto);
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("article/result");
			mav.addObject("msg",e.getMessage());
			mav.addObject("url", "list");
			return mav;
		}
        
	}

}
