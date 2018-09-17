package customerSerivce.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.FaQDTO;
import customerService.bean.NoticeDTO;

public interface CustomerServiceDAO {

	public List<FaQDTO> getFaqList(Map<String, String> map);

	public int getTotalA(String faq_type);

	public List<FaQDTO> searchFaqList(Map<String, String> map);

	public int getTotalA2(String search);
	
	List<NoticeDTO> viewNoticeList(Map<String, String> map);

	public int getNoticeTotalA();

}
