package test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
@Service
public class TestServiceImpl implements TestService{
	@Autowired private TestDAO dao;
	
	
	@Override
	public List<TestVO> listQuestion(String test_name) {
		// TODO Auto-generated method stub
		return dao.listQuestion(test_name);
	}

	@Override
	public int insertResult(ResultVO vo, String test_name) {
		// TODO Auto-generated method stub
		return dao.insertResult(vo, test_name);
	}

	@Override
	public List<ResultVO> getResult(String test_name) {
		// TODO Auto-generated method stub
		return dao.getResult(test_name);
	}

	@Override
	public int modifyQuestion(TestVO vo, String test_name) {
		// TODO Auto-generated method stub
		return dao.modifyQuestion(vo, test_name);
	}

	@Override
	public int insertQuestion(TestVO vo, String test_name) {
		// TODO Auto-generated method stub
		return dao.insertQuestion(vo, test_name);
	}

	@Override
	public List<TestVO> searchQuestion(String test_name, String test_num) {
		// TODO Auto-generated method stub
		return dao.searchQuestion(test_name, test_num);
	}


}
