package main.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class MainController {
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView index(Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/template/body.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	//마이페이지 메인화면
	@RequestMapping(value="/myPage/mainPage.do",method=RequestMethod.GET)
	public String mainPage(Model model) {
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//마이페이지 위시리스트
	@RequestMapping(value="/myPage/mainPage_wishList.do",method=RequestMethod.GET)
	public String mainPage_wishList(Model model) {
		model.addAttribute("display", "/myPage/wishList.jsp");
		return "/main/index";
	}
		
	
	//찾기 페이지 이동 
	@RequestMapping(value="/etc/searchForm.do", method=RequestMethod.GET)
	public String searchForm(Model model) {

		model.addAttribute("display","/etc/searchForm.jsp");
		return "/main/index";
	}
	//개인정보취급방침 이동 
	@RequestMapping(value="/etc/privacyPolicy.do", method=RequestMethod.GET)
	public String privacyPolicy(Model model) {
		
		model.addAttribute("display","/etc/privacyPolicy.jsp");
		return "/main/index";
	}
	//이용약관 이동 
	@RequestMapping(value="/etc/termsAndConditions.do", method=RequestMethod.GET)
	public String termsAndConditions(Model model) {
		
		
		model.addAttribute("display","/etc/termsAndConditions.jsp");
		return "/main/index";
	}
}