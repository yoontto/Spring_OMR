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
	public List<TestVO> listQuestion(String subjectName) {
		//System.out.println("subjectName: " + subjectName);
		return sql.selectList("omr.mapper.listQuestion", subjectName);
	}

	@Override
	public int insertResult(ResultVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return 0;//sql.insert("omr.mapper.saveResult", subjectName);
	}

	@Override
	public List<ResultVO> getResult(String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyQuestion(TestVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertQuestion(TestVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TestVO> searchQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getTest_num() + vo.getsubjectName());
		return sql.selectList("omr.mapper.searchQuestion", vo);
	}

	@Override
	public int updateQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		return sql.update("omr.mapper.updateQuestion", vo);
	}


}
