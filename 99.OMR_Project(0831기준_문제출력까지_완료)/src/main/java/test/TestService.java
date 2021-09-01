package test;

import java.util.List;

public interface TestService {
	
	List<TestVO> listQuestion(String subjectName);	//과목별 문제 조회
	int insertResult(ResultVO vo, String subjectName);	//DB에 점수 저장
	List<ResultVO> getResult(String subjectName);	//DB에 저장된 점수 조회
	double AvgResult(String subjectName);//응시답 평균 계산
	
	int modifyQuestion(TestVO vo, String subjectName);	//문제 수정
	int insertQuestion(TestVO vo, String subjectName);	//문제 추가

}
