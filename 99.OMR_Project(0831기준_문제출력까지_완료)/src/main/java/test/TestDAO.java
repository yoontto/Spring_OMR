package test;

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
		
		System.out.println("dao : " + subjectName);
		
		String tableName = "teamA_test_"+subjectName;
		System.out.println("최종 : " + tableName);
		
		return sql.selectList("test.mapper.listQuestion", tableName);
	}
	
	//응시답 저장
	public int TestInsert() {
		
		return 0;
	}
	
	//시험문제 불러오기
	public List<ResultVO> getResult(String subjectName) {
		
		return null;
	}
	
	//응시답 평균 계산
	public double AvgResult(String subjectName) {
		
		return 0;
	}
	
	
}
