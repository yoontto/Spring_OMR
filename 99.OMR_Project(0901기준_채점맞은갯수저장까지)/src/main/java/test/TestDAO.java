package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository //DAO는 @Repository로 어노테이션줌
public class TestDAO {
	
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
	public void insertResult(ArrayList<String> answer_arr, String subjectName) {
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
		  		 
	}
		
}
