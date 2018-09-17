package member.dao;

import java.util.Map;
import member.bean.MemberDTO;

public interface MemberDAO {

	public MemberDTO login(Map<String, String> map);
	public void write(MemberDTO memberDTO);
	public MemberDTO getMember(String id);
	public void modify(MemberDTO memberDTO);
	public MemberDTO finedOneByEmail(String email);
	public void newpwdUpdate(Map<String, String> map);
}
