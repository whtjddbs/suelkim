package item.dao;

import java.util.List;
import java.util.Map;

import item.bean.ItemDTO;
import item.bean.Item_infoDTO;

public interface ItemDAO {

	public List<ItemDTO> getItemList();

	public List<ItemDTO> getInfoList(Map<String, String> map);

	public int getTotalA(Map<String,String> map);
	
	public List<ItemDTO> getCategory();

	public List<ItemDTO> getImageList(String main_codename);

	public List<String> getSubList(String main_codename);

	public void itemDelete(String[] seq);

	public List<ItemDTO> itemSearchList(Map<String, String> map);

	public void itemModify(Item_infoDTO item_infoDTO);

	public int getAllTotalA(Map<String, String> map);

	public List<Item_infoDTO> itemDetailList(int seq);

	public void item_infoDelete(String[] seq, String[] sub_seq);

	public void itemAdd(Map<String, String> map);

	public List<Map<String, String>> getBestImageList(String main_codename);

	public List<Map<String, String>> getBestInfoList(Map<String, String> map);

	public int getBestTotalA(Map<String, String> map);

}

