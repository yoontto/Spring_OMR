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
		return sql.selectList("omr.mapper.test", subjectName);
	}

	@Override
	public int insertResult(ResultVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return 0;
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

}
