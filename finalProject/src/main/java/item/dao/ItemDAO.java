package item.dao;

import java.util.List;
import java.util.Map;

import item.bean.ItemDTO;

public interface ItemDAO {

	public List<ItemDTO> getItemList();

	public List<ItemDTO> getInfoList(Map<String, String> map);

	public int getTotalA(Map<String,String> map);
	
	public List<ItemDTO> getCategory();

	public List<ItemDTO> getImageList(String main_codename);

	public List<String> getSubList(String main_codename);

	public List<ItemDTO> wishList(Map<String,String> map);

	public int getWishListCount(String id);
	
	public List<String> getColor(int seq);

	public List<String> getSize1(Map<String, String> map);

	public List<String> getSize2(Map<String, String> map);
	
	public ItemDTO getItemDTO(int seq);

	public List<String> checkMain_codename();

	public List<String> checkSub_codename(String main_codename);

	public List<Map<String,String>> getSerialMapper(String serial);
	
	public List<ItemDTO> getRecommendation(String main_codename);

	public int getSearchFormTotalA(String name);
	
	public List<ItemDTO> getSearchFormList(Map<String, String> map);
}

