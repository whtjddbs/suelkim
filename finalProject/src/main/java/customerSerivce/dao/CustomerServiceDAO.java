package customerSerivce.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.FaQDTO;

public interface CustomerServiceDAO {

	public List<FaQDTO> getFaqList(Map<String, Integer> map);

	public int getTotalA();

}
