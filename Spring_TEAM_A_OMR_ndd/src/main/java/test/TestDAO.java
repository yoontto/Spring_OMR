package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO implements TestService{
	@Autowired @Qualifier("hanul") private SqlSession sql;

	
	@Override
	public List<TestVO> listQuestion(String test_name) {
		//System.out.println("test_name: " + test_name);
		return sql.selectList("omr.mapper.listQuestion", test_name);
	}

	@Override
	public int insertResult(ResultVO vo, String test_name) {
		// TODO Auto-generated method stub
		return 0;//sql.insert("omr.mapper.saveResult", test_name);
	}

	@Override
	public List<ResultVO> getResult(String test_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyQuestion(TestVO vo, String test_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertQuestion(TestVO vo, String test_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TestVO> searchQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getTest_num() + vo.getTest_name());
		return sql.selectList("omr.mapper.searchQuestion", vo);
	}


}
