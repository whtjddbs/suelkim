package customerSerivce.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.FaQDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FaQDTO> getFaqList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.getFaqList",map);
	}

	public int getTotalA() {
		return sqlSession.selectOne("customerServiceSQL.getTotalA");
	}
	
}
