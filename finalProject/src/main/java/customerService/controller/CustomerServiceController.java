package customerService.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customerSerivce.dao.CustomerServiceDAO;
import customerService.bean.FaQDTO;
import item.bean.Paging;

@RequestMapping(value="customerService")
@Component
public class CustomerServiceController {
	
	@Autowired
	private CustomerServiceDAO customerServiceDAO;
	
	@Autowired
	private Paging paging;
	
	@RequestMapping(value="faq.do",method=RequestMethod.GET)
	public String faq(@RequestParam(required=false,defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("myPageBody", "/customerService/faq.jsp");
		model.addAttribute("display","/myPage/myPageIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getFaqList.do")
	public ModelAndView getFaqList(@RequestParam(required=false,defaultValue="1") String pg) {
		
		int endNum=Integer.parseInt(pg)*10;
		int startNum=endNum-9;
		
		Map<String, Integer> map=new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		int totalA=customerServiceDAO.getTotalA();

		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageBlock(3);
		paging.setPageSize(10);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<FaQDTO> list=customerServiceDAO.getFaqList(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	
}
