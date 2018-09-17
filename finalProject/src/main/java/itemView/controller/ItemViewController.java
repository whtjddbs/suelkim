package itemView.controller;

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

@RequestMapping(value="itemView")
@Controller
public class ItemViewController {
	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(value="itemViewTop",method=RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("display", "/itemView/itemViewTop.jsp");
		return "/main/index";
	}
	//check
	@RequestMapping(value="checkMain_codename", method=RequestMethod.GET)
	public ModelAndView checkMain_codename() {
		ModelAndView mav = new ModelAndView();
		List<String> list = itemDAO.checkMain_codename();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="checkSub_codename", method=RequestMethod.GET)
	public ModelAndView checkSub_codename(@RequestParam String main_codename) {
		ModelAndView mav = new ModelAndView();
		List<String> list = itemDAO.checkSub_codename(main_codename);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품옵션 컬러 가져오기
	@RequestMapping(value="getColor", method=RequestMethod.POST)
	public ModelAndView getColor(@RequestParam String seq) {
		List<String> list = itemDAO.getColor(Integer.parseInt(seq));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//상품 사이즈1 가져오기
	@RequestMapping(value="getSize1", method=RequestMethod.POST)
	public ModelAndView getSize1(@RequestParam Map<String,String> map ) {
		List<String> list = itemDAO.getSize1(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//상품사이즈2 가져오기
	@RequestMapping(value="getSize2", method=RequestMethod.POST)
	public ModelAndView getSize2(@RequestParam Map<String,String> map ) {
		List<String> list = itemDAO.getSize2(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//상품명,사진,가격, 세일 가격 가져오기
	@RequestMapping(value="getProductDetail", method=RequestMethod.POST)
	public ModelAndView getProductDetail(@RequestParam String seq) {
		ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq)); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	//가격 및 수량 체크
	@RequestMapping(value="getTotalPrice", method=RequestMethod.POST)
	public ModelAndView getTotalPrice() {
		//ItemDTO itemDTO = itemDAO.getItemDTO(Integer.parseInt(seq)); 
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	
}
