package test;

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
	public List<ResultVO> getResult(String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public void insertQuestion(TestVO vo) {
		
		dao.insertQuestion(vo);
	}
	


	@Override
	public int insertResult(List<String> answer_arr, String subjectName) {
				
		return dao.insertResult(answer_arr, subjectName);
	}

	@Override
	public double avgResult(String subjectName) {
		
		return dao.avgResult(subjectName);
	}

	@Override
	public List<TestVO> searchQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		return dao.searchQuestion(vo);
	}
	
	@Override
	public int updateQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		return dao.updateQuestion(vo);
	}
	
	@Override
	public int deleteQuestion(String subject, int pnum) {
		// TODO Auto-generated method stub
		return dao.deleteQuestion(subject, pnum);
	}


}
