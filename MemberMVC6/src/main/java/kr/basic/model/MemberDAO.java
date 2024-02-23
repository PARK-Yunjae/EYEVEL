package kr.basic.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {

	private MemberDAO() {
	}

	static private MemberDAO instance = new MemberDAO();

	static public MemberDAO getInstance() {
		return instance;
	}

	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			String resource = "kr/basic/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);// 읽기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<MemberVO> memberList() {
		// 컨넥션 객체 + sql 쿼리문 실행해누느 객체
		SqlSession session = sqlSessionFactory.openSession();
		List<MemberVO> list = session.selectList("memberList");
		session.close();
		return list;
	}

	public int memberInsert(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("memberInsert", vo);
		session.commit();
		session.close();
		return cnt;
	}

	public boolean isValidId(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.selectOne("validMemberId", id);
		session.close();
		return cnt == 0? true : false;
	}

	public String checkLogin(String id, String pw) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPass(pw);
		SqlSession session = sqlSessionFactory.openSession();
		String name = session.selectOne("checkLogin", vo);
		session.close();
		return name;
	}

	public int getMemberNo(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("getMemberNo", id);
		session.close();
		return cnt;
	}

	public int memberDelete(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.delete("memberDelete", id);
		session.commit();
		session.close();
		return cnt;
	}

	public MemberVO memberContent(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO vo = session.selectOne("memberContent", num);
		session.close();
		return vo;
	}

	public int memberUpdate(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("memberUpdate", vo);
		session.commit();
		session.close();
		return cnt;
	}

	public int memberUploadPhoto(int num, String oFileName, String sFileName) {
		MemberVO vo = new MemberVO();
		vo.setNum(num);
		vo.setoFileName(oFileName);
		vo.setsFileName(sFileName);

		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("memberUploadPhoto", vo);
		session.commit();
		session.close();

		return cnt;
	}
    
    
    
    
    
    /* 기존메서드 
	public int memberInsert(MemberVO vo) {
		return 0;
	}
	
    public List<MemberVO> memberList() {
 	   return null;
    } 
	public boolean isValidId(String id) {
		return false;
	}
	public boolean checkLogin(String id, String pw) {
	   return false;
	}
	public int getMemberNo(String id) {
		return 0;
	}
	public int memberDelete(String id) {
		return 0;
	}
	public MemberVO memberContent(int num) {
		return null;
	}
	public int memberUpdate(MemberVO vo) {
		return 0;
	}
	public int memberUploadPhoto(int num, String oFileName, String sFileName) {
		return 0;
	}
	*/
	
}
