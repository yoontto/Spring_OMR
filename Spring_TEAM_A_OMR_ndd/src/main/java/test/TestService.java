package test;

import java.util.List;

import org.springframework.ui.Model;

public interface TestService {
	//서비스에서 구현해야 하는 기능
	List<TestVO> listQuestion(String subjectName);	//과목별 문제 조회
	int insertResult(ResultVO vo, String subjectName);	//DB에 점수 저장
	List<ResultVO> getResult(String subjectName);	//DB에 저장된 점수 조회
	int modifyQuestion(TestVO vo, String subjectName);	//문제 수정 페이지 호출
	int insertQuestion(TestVO vo, String subjectName);	//문제 추가
	List<TestVO> searchQuestion(TestVO vo);	//과목에서 문제 1개 조회
	int updateQuestion(TestVO vo);			//문제 업데이트
	//(변수 subjectName : 과목 이름)
}
