package myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.conf.DefaultPaging;

import buyList.bean.BuyListDTO;
import buyList.dao.BuyListDAO;
import item.bean.ItemDTO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;
import member.bean.WishListPaging;

@RequestMapping(value="myPage")
@Component
public class MyPageController {
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private BuyListDAO buyListDAO;
	
	//마이페이지 메인화면
	@RequestMapping(value="myPageIndex", method=RequestMethod.GET)
	public String myPageIndex(Model model, HttpSession session) {
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		
		List<Map<String,String>> list = buyListDAO.get5BuyList(login.getId());
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", login.getId());
		map.put("startNum", "1");
		map.put("endNum", "10");
		
		List<ItemDTO> wishList = itemDAO.wishList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("wishList", wishList);
		model.addAttribute("myPageBody", "/myPage/myPageBody.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getSerialCount", method=RequestMethod.POST)
	public ModelAndView getSerialCount(@RequestParam String serial) {
		int count = buyListDAO.getSerialCount(serial);
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//주문배송조회
	@RequestMapping(value="tracking", method=RequestMethod.GET)
	public String tracking(@RequestParam(required=false, defaultValue="1") String pg, Model model, HttpSession session) {
		int currentPage = Integer.parseInt(pg);
		int pageSize = 5;
		int endNum = pageSize*currentPage;
		int startNum = endNum-pageSize+1;
		
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",login.getId());
		map.put("status", "");
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<BuyListDTO> list = buyListDAO.getBuyList(map);
		
		int totalA = buyListDAO.getDeliveryTotalA(map);
		
		DefaultPaging paging = new DefaultPaging();
		paging.setCurrentPage(currentPage);
		paging.setPageSize(pageSize);
		paging.setPageBlock(3);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("myPageBody", "/myPage/tracking.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//주문번호에 해당하는 아이템 로딩
	@RequestMapping(value="getSerialMapper", method=RequestMethod.POST)
	public ModelAndView getSerialMapper(@RequestParam String serial) {
		List<Map<String,String>> list = itemDAO.getSerialMapper(serial);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//주문상세내역
	@RequestMapping(value="trackingDetail", method=RequestMethod.GET)
	public String trackingDetail(Model model) {
		model.addAttribute("myPageBody", "/myPage/trackingDetail.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//취소.교환.반품 내역
	@RequestMapping(value="modifyList", method=RequestMethod.GET)
	public String modifyList(Model model) {
		model.addAttribute("myPageBody", "/myPage/modifyList.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//위시리스트
	@RequestMapping(value="wishList", method=RequestMethod.GET)
	public String wishList(@RequestParam(required=false, defaultValue="1") String pg, Model model, HttpSession session) {
		int currentPage = Integer.parseInt(pg);
		int pageSize = 20;
		int endNum = pageSize*currentPage;
		int startNum = endNum-pageSize+1;
		
		MemberDTO login = (MemberDTO)session.getAttribute("memberDTO");
		
		if(login!=null) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");		
			map.put("id", login.getId());
		
			int totalA = itemDAO.getWishListCount(login.getId()); 
			
			WishListPaging paging = new WishListPaging();
			paging.setCurrentPage(currentPage);
			paging.setPageBlock(3);
			paging.setPageSize(pageSize);
			paging.setTotalA(totalA);
			paging.makePagingHTML();		
					
			List<ItemDTO> list = itemDAO.wishList(map);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
		}	
		
		model.addAttribute("myPageBody", "/myPage/wishList.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//상품후기 내역
	@RequestMapping(value="myReview", method=RequestMethod.GET)
	public String myReview(Model model) {
		model.addAttribute("myPageBody", "/myPage/myReview.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//마일리지현황
	@RequestMapping(value="myPoint", method=RequestMethod.GET)
	public String myPoint(Model model) {
		model.addAttribute("myPageBody", "/myPage/myPoint.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//회원등급
	@RequestMapping(value="grade", method=RequestMethod.GET)
	public String grade(Model model) {
		model.addAttribute("myPageBody", "/myPage/grade.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	//최근 5개월 구매 횟수,가격
	@RequestMapping(value="buyListCount", method=RequestMethod.POST)
	public ModelAndView buyListCount(@RequestParam Map<String,String> map) {		
		Map<String, Integer> grade = buyListDAO.getBuyListCount(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("grade", grade);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
