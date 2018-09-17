package member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Transactional
@Component
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;

	public MemberDTO login(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.login",map);
	}

	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write",memberDTO);
	}

	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("memberSQL.getMember",id);
	}
	
	public void modify(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.modify",memberDTO);
		
	}

	public MemberDTO finedOneByEmail(String email) {
		return sqlSession.selectOne("memberSQL.finedOneByEmail",email);
	}

	public void newpwdUpdate(Map<String, String> map) {
		sqlSession.update("memberSQL.newpwdUpdate",map);
	}


}
