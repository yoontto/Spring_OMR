package test;

import java.lang.annotation.Annotation;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TestServiceImpl implements TestService{
	@Autowired private TestDAO dao;
	
	@Override
	public List<TestVO> listQuestion(String subjectName) {
		
		return dao.listQuestion(subjectName);
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

	

}
