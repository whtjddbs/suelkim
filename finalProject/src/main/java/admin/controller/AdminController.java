package admin.controller;

import java.util.ArrayList;
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

import buyList.bean.BuyListDTO;
import buyList.bean.DeliveryControllPaging;
import buyList.bean.SalesMgmtPaging;
import buyList.dao.BuyListDAO;
import item.dao.ItemDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@RequestMapping(value="admin")
@Component
public class AdminController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private BuyListDAO buyListDAO;
	
	
	@RequestMapping(value="adminIndex", method=RequestMethod.GET)
	public String adminIndex(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/deliveryControll.jsp");
		return "/main/index";
	}
	
	//배송관리
	@RequestMapping(value="deliveryControll", method=RequestMethod.GET)
	public String deliveryControll(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/deliveryControll.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="refundControll", method=RequestMethod.GET)
	public String refundControll(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/refundControll.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="deliveryDetail", method=RequestMethod.POST)
	public ModelAndView deliveryDetail(@RequestParam String serial) {
		List<Map<String,String>> list = buyListDAO.getDeliveryDetail(serial);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("logtime", list.get(0).get("LOGTIME"));
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="getDeliveryList", method=RequestMethod.POST)
	public ModelAndView getConditionalDeliveryList(@RequestParam Map<String,String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 2;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA = buyListDAO.getDeliveryTotalA(map);
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		DeliveryControllPaging paging = new DeliveryControllPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<BuyListDTO> list = buyListDAO.getBuyList(map);
		List<Map<String,String>> mapList = new ArrayList<Map<String, String>>();
		for(BuyListDTO buylist : list) {
			MemberDTO memberDTO = memberDAO.getMember(buylist.getId());
			Map<String,String> tempMap = new HashMap<String,String>();
			tempMap.put("serial", buylist.getSerial());
			tempMap.put("id", memberDTO.getId());
			tempMap.put("name", memberDTO.getName());
			tempMap.put("addr", memberDTO.getAddr1()+" "+memberDTO.getAddr2());
			tempMap.put("tel", memberDTO.getTel1()+"-"+memberDTO.getTel2()+"-"+memberDTO.getTel3());
			tempMap.put("status", buylist.getStatus());
			
			mapList.add(tempMap);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", paging);
		mav.addObject("mapList", mapList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="changeDeliveryStatus", method=RequestMethod.POST)
	public ModelAndView changeDeliveryStatus(@RequestParam(value="check[]") List<String> check, @RequestParam String checkStatus) {
		String status = null;
		if(checkStatus.equals("준비중")) status="배송중";
		else if(checkStatus.equals("배송중")) status="배송완료";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("serials", check);
		map.put("status", status);
		
		buyListDAO.changeStatus(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("check", check);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//매출 관리
	@RequestMapping(value="salesMgmt", method=RequestMethod.GET)
	public String SalesMgmt(Model model) {
		model.addAttribute("display", "/admin/adminIndex.jsp");
		model.addAttribute("adminBody", "/admin/SalesMgmt.jsp");
		return "/main/index";
	}
	
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
	
	@RequestMapping(value="SalesList", method=RequestMethod.POST)
	public ModelAndView SalesList(@RequestParam Map<String, String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));

		
		int pageSize = 10;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA = buyListDAO.getSalesTotalA(map);
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		SalesMgmtPaging paging = new SalesMgmtPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		
		List<Map<String, String>> list = buyListDAO.SalesList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
	@RequestMapping(value="searchText", method=RequestMethod.POST)
	public ModelAndView searchText(@RequestParam Map<String, String> map) {
		int pg = 1;
		if(!map.get("pg").equals("")) pg = Integer.parseInt(map.get("pg"));
		
		int pageSize = 10;
		int endNum = pageSize*pg;
		int startNum = endNum-pageSize+1;
		int totalA = buyListDAO.getSearchTotalA(map);
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		SalesMgmtPaging paging = new SalesMgmtPaging();
		paging.setCurrentPage(pg);
		paging.setPageBlock(3);
		paging.setPageSize(pageSize);
		paging.setTotalA(totalA);
		paging.makePagingHTML();
		
		List<Map<String, String>> list = buyListDAO.searchText(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		return mav;
	}
}
