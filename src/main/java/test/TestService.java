package test;

import java.util.List;

public interface TestService {
	List<TestVO> listQuestion(String subjectName);	//과목별 문제 조회
	int insertResult(List<String> answer_arr,String subjectName);	//DB에 점수 저장
	List<ResultVO> getResult(String subjectName);	//DB에 저장된 점수 조회
	double avgResult(String subjectName);//응시답 평균 계산
	void insertQuestion(TestVO vo );	//문제 추가
	List<TestVO> searchQuestion(TestVO vo);//(변수 subjectName : 과목 이름)
	int deleteQuestion(String subject, int pnum);
	int updateQuestion(TestVO vo);			//문제 업데이트
}
