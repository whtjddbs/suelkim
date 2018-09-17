package item.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import item.bean.ItemDTO;
import item.dao.ItemDAO;


@RequestMapping(value="new")
@Controller
public class newController {
	
	@Autowired
	private ItemDAO itemDAO;
	
	@RequestMapping(value="newIndex",  method=RequestMethod.GET)
	public String newIndex(Model model) {
		model.addAttribute("display", "/new/newIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getCategory", method=RequestMethod.POST)
	public ModelAndView getCategory() {		
		List<ItemDTO> list = itemDAO.getCategory();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");		
		return mav;
	}
	
	@RequestMapping(value="getImageList", method=RequestMethod.POST)
	public ModelAndView getImageList(@RequestParam String main_codename) {	
		List<ItemDTO> list = itemDAO.getImageList(main_codename);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//best
	@RequestMapping(value="bestIndex",  method=RequestMethod.GET)
	public String bestIndex(Model model) {
		model.addAttribute("display", "/new/bestIndex.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getBestImageList", method=RequestMethod.POST)
	public ModelAndView getBestImageList(@RequestParam String main_codename) {	
		List<Map<String,String>> list = itemDAO.getBestImageList(main_codename);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");	
		return mav;
	}
	
}
