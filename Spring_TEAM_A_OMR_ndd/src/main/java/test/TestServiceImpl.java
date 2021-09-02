package test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
@Service
public class TestServiceImpl implements TestService{
	@Autowired private TestDAO dao;
	
	
	@Override
	public List<TestVO> listQuestion(String subjectName) {
		// TODO Auto-generated method stub
		return dao.listQuestion(subjectName);
	}

	@Override
	public int insertResult(ResultVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return dao.insertResult(vo, subjectName);
	}

	@Override
	public List<ResultVO> getResult(String subjectName) {
		// TODO Auto-generated method stub
		return dao.getResult(subjectName);
	}

	@Override
	public int modifyQuestion(TestVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return dao.modifyQuestion(vo, subjectName);
	}

	@Override
	public int insertQuestion(TestVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return dao.insertQuestion(vo, subjectName);
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


}
