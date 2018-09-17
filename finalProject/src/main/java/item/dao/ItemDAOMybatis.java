package item.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import item.bean.ItemDTO;

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

	@Override
	public List<ItemDTO> wishList(Map<String,String> map) {
		return sqlSession.selectList("itemSQL.wishList", map);
	}

	@Override
	public int getWishListCount(String id) {
		return sqlSession.selectOne("itemSQL.getWishListCount", id);
	}
	
	//itemView
	@Override
	public List<String> getColor(int seq) {
		return sqlSession.selectList("itemSQL.getColor", seq);
	}

	@Override
	public List<String> getSize1(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getSize1", map);
	}
	
	@Override
	public List<String> getSize2(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getSize2", map);
	}
	
	@Override
	public ItemDTO getItemDTO(int seq) {
		return sqlSession.selectOne("itemSQL.getItemDTO", seq);
	}

	@Override
	public List<String> checkMain_codename() {
		return sqlSession.selectList("itemSQL.checkMain_codename");
	}

	@Override
	public List<String> checkSub_codename(String main_codename) {
		return sqlSession.selectList("itemSQL.checkSub_codename", main_codename);
	}
	
	public List<Map<String,String>> getSerialMapper(String serial) {
		return sqlSession.selectList("itemSQL.getSerialMapper", serial);
	}
	
	//상품 검색
	@Override
	public List<ItemDTO> getRecommendation(String main_codename) {
		return sqlSession.selectList("itemSQL.getRecommendation", main_codename);
	}

	@Override
	public int getSearchFormTotalA(String name) {
		return sqlSession.selectOne("itemSQL.getSearchFormTotalA", name);
	}

	@Override
	public List<ItemDTO> getSearchFormList(Map<String, String> map) {
		return sqlSession.selectList("itemSQL.getSearchFormList", map);
	}

}
