package buyList.dao;

import java.util.List;
import java.util.Map;

import buyList.bean.BuyListDTO;

public interface BuyListDAO {

	public List<Map<String, String>> getdeliveryDetail(String serial);

	public List<BuyListDTO> getBuyList(Map<String, String> map);

	public void changeStatus(Map<String, Object> map);

}
