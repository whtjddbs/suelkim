package customerSerivce.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.FaQDTO;
import customerService.bean.NoticeDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FaQDTO> getFaqList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.getFaqList",map);
	
	}

	public int getTotalA(String faq_type) {
		return sqlSession.selectOne("customerServiceSQL.getTotalA",faq_type);
	}

	@Override
	public List<FaQDTO> searchFaqList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.searchFaqList",map);
	}

	@Override
	public int getTotalA2(String search) {
		return sqlSession.selectOne("customerServiceSQL.getTotalA2",search);
	}

	public List<NoticeDTO> viewNoticeList(Map<String, String> map) {
		return sqlSession.selectList("customerServiceSQL.viewNoticeList", map);
	}

	public int getNoticeTotalA() {
		return sqlSession.selectOne("customerServiceSQL.getNoticeTotalA");
	}
	
}
