package test;

import java.util.HashMap;
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
	
	

	//응시자 맞춘 갯수 비교/저장
		public int insertResult(List<String> answer_arr, String subjectName) {
			List<TestVO> list = listQuestion(subjectName);
			int get_right = 0;
			
			for(int i = 0; i < list.size(); i++) {
				if(answer_arr.get(i).equals(Integer.toString(list.get(i).getTest_answer() ) ) ) {
					++get_right;
				}
			}
			
			ResultVO rvo = new ResultVO();
			rvo.setCandidate_test_name(subjectName);
			rvo.setCandidate_get_right(get_right);
			
			System.out.println(rvo.getCandidate_get_right() + ":" + rvo.getCandidate_test_name());
			sql.insert("omr.mapper.insertResult", rvo);
			
			return get_right;
			  		 
		}

	@Override
	public List<ResultVO> getResult(String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void insertQuestion(TestVO vo) {
		System.out.println("vo : " + vo.getTest_name());
		sql.insert("omr.mapper.insertQuestion", vo);
	}


	@Override
	public double avgResult(String subjectName) {
		
		return sql.selectOne("omr.mapper.avgResult", subjectName);
	}
	
	@Override
	public List<TestVO> searchQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getTest_num() + vo.getTest_name() );
		return sql.selectList("omr.mapper.searchQuestion", vo);
	}
	
	@Override
	public int updateQuestion(TestVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getTest_num() + vo.getTest_name());
		return sql.update("omr.mapper.updateQuestion", vo);
	}
	
	@Override
	public int deleteQuestion(String subject, int pnum) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		String table_name = null;
		if(subject.equals("bread")) {
			table_name = "TEAMA_TEST_BREAD";
		}else if(subject.equals("fruit")) {
			table_name = "TEAMA_TEST_FRUIT";
		}else if(subject.equals("icecream")) {
			table_name = "TEAMA_TEST_ICECREAM";
		}else if(subject.equals("snack")) {
			table_name = "TEAMA_TEST_SNACK";
		}
		hm.put("subject", table_name);
		hm.put("pnum", pnum);
		System.out.println("테이블 이름 : " + pnum);
		return sql.delete("omr.mapper.delete", hm);
	}



}
