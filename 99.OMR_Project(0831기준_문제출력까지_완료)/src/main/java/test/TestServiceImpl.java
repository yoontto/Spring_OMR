package test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service//@Service로 어노테이션
public class TestServiceImpl implements TestService {
	
	@Autowired private TestDAO dao;

	@Override
	public List<TestVO> listQuestion(String subjectName) {
		
		
		return dao.listQuestion(subjectName);
	}

	@Override
	public int insertResult(ResultVO vo, String subjectName) {
		
		return 0;
	}

	@Override
	public List<ResultVO> getResult(String subjectName) {
		
		return null;
	}

	@Override
	public double AvgResult(String subjectName) {
		
		return 0;
	}

	@Override
	public int modifyQuestion(TestVO vo, String subjectName) {
		
		return 0;
	}

	@Override
	public int insertQuestion(TestVO vo, String subjectName) {
		
		return 0;
	}
	
	
	
}
