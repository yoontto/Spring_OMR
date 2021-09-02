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
	public int insertResult(List<String> answer_arr, String subjectName) {
				
		return dao.insertResult(answer_arr, subjectName);
	}

	@Override
	public List<Object> getResult(String subjectName) {
		
		return null;
	}

	@Override
	public double avgResult(String subjectName) {
		
		return dao.avgResult(subjectName);
	}

	@Override
	public int modifyQuestion(TestVO vo, String subjectName) {
		
		return 0;
	}

	@Override
	public void insertQuestion(TestVO vo) {
		
		dao.insertQuestion(vo);
	}
	
	
	
}
