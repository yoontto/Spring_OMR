package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository //DAO는 @Repository로 어노테이션줌
public class TestDAO implements TestService {
	
	@Autowired @Qualifier("hanul") private SqlSession sql;
	//자동주입 ↑ : 접속하는 정보를 가져온다.
	
	//시험문제 불러오기
	public List<TestVO> listQuestion(String subjectName) {
		
		//System.out.println("dao : " + subjectName);
		
		String tableName = "teamA_test_"+subjectName;
		//System.out.println("최종 : " + tableName);
		
		return sql.selectList("listQuestion", tableName);
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
		sql.insert("test.mapper.insertResult", rvo);
		
		return get_right;
		  		 
	}

	@Override
	public List<Object> getResult(String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public double avgResult(String subjectName) {
		
		return sql.selectOne("test.mapper.avgResult", subjectName);
	}

	@Override
	public int modifyQuestion(TestVO vo, String subjectName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertQuestion(TestVO vo) {
		sql.insert("test.mapper.insertQuestion", vo);
	}
	
}
