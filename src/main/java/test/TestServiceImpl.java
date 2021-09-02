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

	/*
	 * // 재욱 : answer 작성 (이게 우리 서비스 만들때 있었던 건가요?)
	 * 
	 * @Override public List<TestVO> answer() {
	 * 
	 * return null; }
	 */

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
