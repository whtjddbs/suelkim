package buyList.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import buyList.bean.BuyListDTO;

@Transactional
@Component
public class BuyListDAOMybatis implements BuyListDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, String>> getdeliveryDetail(String serial) {
		return sqlSession.selectList("buyListSQL.getdeliveryDetail", serial);
	}

	public List<BuyListDTO> getBuyList(Map<String, String> map) {
		return sqlSession.selectList("buyListSQL.getBuyList", map);
	}

	public void changeStatus(Map<String, Object> map) {
		sqlSession.update("buyListSQL.changeStatus", map);
	}

}