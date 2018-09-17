package member.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import member.bean.MemberDTO;
import member.dao.MailService;
import member.dao.MemberDAO;

@RequestMapping(value="member")
@Component
public class MemberController {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MailService mailService;


	@RequestMapping(value="loginForm",method=RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("display", "/member/loginForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam Map<String,String> map
			          , HttpSession session, Model model
			          , HttpServletResponse response) {

		if ( session.getAttribute("memberDTO") != null ){ // 기존에 login이란 세션 값이 존재한다면
            session.removeAttribute("memberDTO"); // 기존값을 제거해 준다.
        }
		
		if(map.get("id").equals("admin")) {
			
		}

		// DB
		MemberDTO memberDTO = memberDAO.login(map);
		
		//응답
		if(memberDTO == null) {
			return "nonexist";
		}else {
			//세션
			session.setAttribute("memberDTO",memberDTO);
			
			if ( map.get("useCookie").equals("true") ){ 
                Cookie cookie = new Cookie("loginCookie", memberDTO.getId());
                cookie.setPath("/");
                int amount = 60*60*24*7;
                cookie.setMaxAge(amount); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
                response.addCookie(cookie);
                
            }
			return "exist";
		}
	}
	


	@RequestMapping(value="logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session
							  ,HttpServletRequest request
							  ,HttpServletResponse response) {
		 Object obj = session.getAttribute("memberDTO");
	        if ( obj != null ){
	            session.removeAttribute("memberDTO");
	            session.invalidate(); // 세션 전체를 날려버림
	            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	            if ( loginCookie != null ){
	                loginCookie.setPath("/");
	                loginCookie.setMaxAge(0);
	                response.addCookie(loginCookie);
	            }
	        }

		ModelAndView mav = new ModelAndView();	
		mav.addObject("display", "/member/logout.jsp");
		mav.setViewName("/main/index");
		return mav;	
	}
	
	@RequestMapping(value="checkId",method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id) {
		if(id.equals("")) return "empty";
		else {
			MemberDTO memberDTO = memberDAO.getMember(id);
			if(memberDTO == null) return "nonexist";
			else return "exist";
		}
	}
	
	
	@RequestMapping(value="writeForm",method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO , Model model) {
		memberDAO.write(memberDTO);

		model.addAttribute("display", "/member/writeOk.jsp"); 
		return "/main/index";
	}
	
	
	@RequestMapping(value="modifyForm",method=RequestMethod.GET)
	public String modifyForm(Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("myPageBody", "/member/modifyForm.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="modifyPwd",method=RequestMethod.POST)
	public String modifyPwd(@RequestParam String pwd,
							Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		memberDTO.setPwd(pwd);
		
		memberDAO.modify(memberDTO);
		
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="modifyEmail",method=RequestMethod.POST)
	public String modifyEmail(@RequestParam String email,
							Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		memberDTO.setEmail(email);
		
		memberDAO.modify(memberDTO);
		
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.POST)
	public String modify(@RequestParam(required=false) Map<String,String> map,
							Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		memberDTO.setTel1(map.get("tel1"));
		memberDTO.setTel2(map.get("tel2"));
		memberDTO.setTel3(map.get("tel3"));
		memberDTO.setZipcode(map.get("zipcode"));
		memberDTO.setAddr1(map.get("addr1"));
		memberDTO.setAddr2(map.get("addr2"));
		
		memberDAO.modify(memberDTO);
		
		model.addAttribute("display", "/member/modify.jsp");
		return "/main/index";
	}
	
	//아이디찾기- 이메일 인증
	@RequestMapping(value="searchId",method=RequestMethod.GET)
	public String searchId(Model model) {
		model.addAttribute("display", "/member/searchId.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="checkMail")
	private ModelAndView checkMail(@RequestParam String email) {
		MemberDTO memberDTO = memberDAO.finedOneByEmail(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO",memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="sendMail",method=RequestMethod.POST)
	@ResponseBody
	private boolean sendMail(HttpSession session, @RequestParam String email) {
		int randomCode = new Random().nextInt(10000)+1000;
		String joinCode = String.valueOf(randomCode);
		session.setAttribute("joincode", joinCode);
		
		String subject = "BbanB 이메일 인증번호입니다";
		StringBuilder sb = new StringBuilder();
		sb.append("인증번호는 ").append(joinCode).append(" 입니다");
		return mailService.send(subject, sb.toString(), "sooellen10@gmail.com", email);
	}
	
	@RequestMapping(value="mailCompare")
	@ResponseBody
	private String mailCompare(@RequestParam String verifyNum, HttpSession session ) {
		String joincode = (String)session.getAttribute("joincode");
		if(verifyNum.equals("")) return "empty";
		else {
			if(joincode.equals(verifyNum)) 
				return "same";
			else 
				return "different";
		}
	}
	
	@RequestMapping(value="searchIdNext",method=RequestMethod.POST)
	public String searchIdNext(@RequestParam String email, Model model) {
		MemberDTO memberDTO = memberDAO.finedOneByEmail(email);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("display", "/member/searchIdNext.jsp");
		return "/main/index";
	}
	
	//비밀번호찾기
	@RequestMapping(value="searchPwd",method=RequestMethod.GET)
	public String searchPwd(Model model) {
		model.addAttribute("display", "/member/searchPwd.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="searchPwdNext",method=RequestMethod.POST)
	public String searchPwdNext(@RequestParam String email, Model model) {
		MemberDTO memberDTO = memberDAO.finedOneByEmail(email);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("display", "/member/searchPwdNext.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="newpwdOk",method=RequestMethod.POST)
	public String newPwdOk(@RequestParam Map<String,String> map, Model model ) {
		
		memberDAO.newpwdUpdate(map);
		model.addAttribute("display", "/member/newpwdOk.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="beLoginForm",method=RequestMethod.GET)
	public String beLoginForm(Model model) {
		model.addAttribute("display", "/member/beLoginForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getWishList", method=RequestMethod.POST)
	public ModelAndView getWishList(HttpSession session) {
		//위시리스트
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		List<String> wishList = memberDAO.getWishList(login.getId());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("wishList", wishList);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@RequestMapping(value="addWishList", method=RequestMethod.POST)
	public ModelAndView addWishList(@RequestParam Map<String,String> map) {
		memberDAO.addWishList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="deleteWishList", method=RequestMethod.POST)
	public ModelAndView deleteWishList(@RequestParam Map<String,String> map) {
		memberDAO.deleteWishList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
}

