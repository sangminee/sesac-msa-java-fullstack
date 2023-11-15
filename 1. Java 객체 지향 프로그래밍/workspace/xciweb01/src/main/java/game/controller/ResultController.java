package game.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

public class ResultController extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		int you = Integer.parseInt(request.getParameter("you"));	
		int com = (int) (Math.random()*3 + 1); // com 랜덤 수 발생 
		String result = result(you, com);		
		
		String[] option = {"가위","바위","보"};
		
		ModelAndView model = new ModelAndView("/WEB-INF/game/result.jsp");
		model.addObject("you", option[you-1]);
		model.addObject("com", option[com-1]);
		model.addObject("result", result);

		return model;
	}
	
	private String result(int you, int com) {
		switch((you-com + 3)%3) {
		case 0 : return "비겼습니다.";
		case 1 : return "당신이 졌습니다.";
		case 2 : return "당신이 이겼습니다.";
		}
		return "알수없음";
		
		
//		if(you == com) return "비겼습니다.";
//		else if((you==1 && com==2) ||
//				(you==2 && com==3) || 
//				(you==3 && com==1)) 
//			return "당신이 졌습니다.";
//		else if((you==1 && com==3) ||
//				(you==2 && com==1) ||
//				(you==3 && com==1)) 
//			return "당신이 이겼습니다.";
//		return "알수없음";
	}
	
	private String findValueName(int value) {
		return value==1 ? "가위" : (value==2 ? "바위" : "보");
	}

}
