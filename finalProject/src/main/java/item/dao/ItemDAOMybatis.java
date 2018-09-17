package item.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import item.bean.ItemDTO;
import item.bean.Item_infoDTO;

@Transactional
@Component
public class ItemDAOMybatis implements ItemDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ItemDTO> getItemList() {
		return sqlSession.selectList("itemSQL.getItemList");
	}

	public List<ItemDTO> getInfoList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getInfoList", map);
	}

	public int getTotalA(Map<String,String> map) {
		return sqlSession.selectOne("itemSQL.getTotalA", map);
	}
	
	public List<ItemDTO> getCategory() {	
		return sqlSession.selectList("itemSQL.getCategory");
	}

	public List<ItemDTO> getImageList(String main_codename) {
		return sqlSession.selectList("itemSQL.getImageList", main_codename);
	}

	public List<String> getSubList(String main_codename) {
		return sqlSession.selectList("itemSQL.getSubList", main_codename);
	}


	public void itemDelete(String[] seq) {
		for(int i=0; i<seq.length; i++){
			sqlSession.delete("itemSQL.itemDelete",seq[i]);
		}
	}

	public List<ItemDTO> itemSearchList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.itemSearchList", map);
	}

	public void itemModify(Item_infoDTO item_infoDTO) {
		sqlSession.update("itemSQL.itemModify",item_infoDTO);
	}

	public int getAllTotalA(Map<String, String> map) {
		return sqlSession.selectOne("itemSQL.getAllTotalA",map);
	}

	public List<Item_infoDTO> itemDetailList(int seq) {
		return sqlSession.selectList("itemSQL.itemDetailList", seq);
	}

	public void item_infoDelete(String[] seq, String[] sub_seq) {
		for(int i=0; i<sub_seq.length; i++){
			Map<String,String> map = new HashMap<String,String>();
			map.put("seq", seq[i]);
			map.put("sub_seq", sub_seq[i]);
			sqlSession.delete("itemSQL.item_infoDelete",map);
		}
	}

	public void itemAdd(Map<String, String> map) {
		sqlSession.insert("itemSQL.itemAdd",map);
	}

	public List<Map<String,String>> getBestImageList(String main_codename) {
		return sqlSession.selectList("itemSQL.getBestImageList", main_codename);
	}

	public List<Map<String,String>> getBestInfoList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getBestInfoList", map);
	}

	public int getBestTotalA(Map<String, String> map) {
		return sqlSession.selectOne("itemSQL.getBestTotalA",map);
	}
}
