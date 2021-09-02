package test;

public class ResultVO {
	private int candidate_num;				//응시번호, pk키
	private String candidate_test_name;  	//문제의 문항
	private int candidate_get_right;		//문제맞춘갯수


	public int getCandidate_num() {
		return candidate_num;
	}
	public void setCandidate_num(int candidate_num) {
		this.candidate_num = candidate_num;
	}
	public String getCandidate_subjectName() {
		return candidate_test_name;
	}
	public void setCandidate_subjectName(String candidate_test_name) {
		this.candidate_test_name = candidate_test_name;
	}
	public int getCandidate_get_right() {
		return candidate_get_right;
	}
	public void setCandidate_get_right(int candidate_get_right) {
		this.candidate_get_right = candidate_get_right;
	}


}