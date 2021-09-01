package com.teamb.omr;
import java.io.BufferedWriter;
import java.io.FileWriter;
/*
import java.io.BufferedWriter;
import java.io.FileWriter;*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




public class TestDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception");
		}
		return conn;
	}//getConn()
	
	
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception");
		}
	}//dbClose()
	
	
	
	//-----------------------------------------------------------
	
	//시험 해당 과목의 정답을 불러오는 메소드
	public AnswerDTO selectSubject_dto(String subject) {
		conn = getConn();//연결
		String sql = "select * from answer where subject = ? ";
		AnswerDTO dto = new AnswerDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			rs = ps.executeQuery();
			while (rs.next()) {
				char a1 = rs.getString("a1").charAt(0);
				char a2 = rs.getString("a2").charAt(0);
				char a3 = rs.getString("a3").charAt(0);
				char a4 = rs.getString("a4").charAt(0);
				char a5 = rs.getString("a5").charAt(0);
				char a6 = rs.getString("a6").charAt(0);
				char a7 = rs.getString("a7").charAt(0);
				char a8 = rs.getString("a8").charAt(0);
				char a9 = rs.getString("a9").charAt(0);
				char a10 = rs.getString("a10").charAt(0);
				dto.setA1(a1);
				dto.setA2(a2);
				dto.setA3(a3);
				dto.setA4(a4);
				dto.setA5(a5);
				dto.setA6(a6);
				dto.setA7(a7);
				dto.setA8(a8);
				dto.setA9(a9);
				dto.setA10(a10);
				dto.setSubject(subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSubject() Exception");
		} finally {
			dbClose();
		}
		return dto;
	}//selectSubject()
	
	
	public ArrayList<String> selectSubject(String subject) {	//과목별 정답 리스트 조회
		conn = getConn();
		String sql = "select * from answer where subject = ?";
		ArrayList<String> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			rs = ps.executeQuery();
			while(rs.next()) {
				for (int i = 0; i <= 10; i++) {
					if(i == 0) {
						list.add(rs.getString("subject"));
					}else {
						list.add(rs.getString("a"+(i)));
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectSubject() Exception");
		} finally {
			dbClose();
		}
		return list;
	}//selectSubject()
	
	
	
	
	
	
	
	//-----------------------------------------------------------
	
	
	
	
	// 멤버 추가 메소드
		public int insertTester(TesterDTO dto) {
			conn = getConn();
			String sql = "insert into tester values (?,?,?)";
			int succ = 0;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getId());
				ps.setString(2, dto.getPw());
				ps.setString(3, dto.getName());
				succ = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("insertTester() Exception!");
			} finally {
				dbClose();
			}
			return succ;
		}// insertTester()
		

		//id를 받아서 사용자의 회원정보를 가져오는 메소드
		public TesterDTO selectTester(String id) {
			conn = getConn();
			String sql = "select * From tester where id = ?";
			TesterDTO dto = new TesterDTO();
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();		//sql 실행
				
				if(rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("selectTester() Exception!");
			}finally {
				dbClose();
			}
			return dto;
		}//selectMember()
		
		
		
		//name값을 매개변수로 응시자의 정보를 가져오는 메소드
		public TesterDTO getId(String name) {
			conn = getConn();
			String sql = "select * From tester where name = ?";
			TesterDTO dto = new TesterDTO();
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
				}
			} catch (Exception e) {
					e.printStackTrace();
					System.out.println("getId() Exception!");
					}
			return dto;
		}//getId()
		
		
		
		// 전체 수험자 검색
		public ArrayList<TesterDTO> selectAllTester() {
			conn = getConn();
			String sql = "select * from tester";
			ArrayList<TesterDTO> list = new ArrayList<>();
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					TesterDTO dto = new TesterDTO(id, pw, name);
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("selectAllTester() Exception!");
			}
			return list;
		}// selectAllTester		
		
		
		
		//-----------------------------------------------------------
		
		
		
		//name을 매개변수로 받아 회원정보를 가져온다.
				public ArrayList<TesterAnswerDTO> selectLastresult(String name) {
					conn = getConn();
					String sql = "select * From testerAnswer where name = ? order by 1 desc";
					ArrayList<TesterAnswerDTO> list = new ArrayList<>();
					try {
						ps = conn.prepareStatement(sql);
						ps.setString(1, name);
						rs = ps.executeQuery();
						
						while(rs.next()) {
							TesterAnswerDTO dto = new TesterAnswerDTO();
							dto.setSubject(rs.getString("subject"));
							dto.setNum(rs.getInt("num"));
							dto.setName(rs.getString("name"));
							dto.setTa1((char) rs.getInt("ta1"));
							dto.setTa2((char) rs.getInt("ta2"));
							
							dto.setTa3((char) rs.getInt("ta3"));
							dto.setTa4((char) rs.getInt("ta4"));
							dto.setTa5((char) rs.getInt("ta5"));
							dto.setTa6((char) rs.getInt("ta6"));
							dto.setTa7((char) rs.getInt("ta7"));
							
							dto.setTa8((char) rs.getInt("ta8"));
							dto.setTa9((char) rs.getInt("ta9"));
							dto.setTa10((char) rs.getInt("ta10"));
							dto.setScore(rs.getInt("score"));
							
							list.add(dto);
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("selectLastresult() Exception!");
					}finally {
						dbClose();
					}
					return list;
					
				}//selectLastresult()
		
				
				//수험번호를 받아서 score를 검색
				public String scoreResult(String num) {
					conn = getConn();
					String sql = "select * From testerAnswer where num = ?";
					String score = null;
					try {
						ps = conn.prepareStatement(sql);
						ps.setString(1, num);
						rs = ps.executeQuery();
						if(rs.next()) {
							score = String.valueOf(rs.getInt("score"));
							System.out.println("dao :" +  score);
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("testerAnswer() Exception");
					}finally {
						dbClose();
					}
					return score;
				}//scoreResult()
				
				
				
				public ArrayList<String> selectTesterResult(String num) {	//수험자 기록 조회
					conn = getConn();
					String sql = "SELECT * FROM testerAnswer where num = ?";
					ArrayList<String> lastResult = new ArrayList<>();
					try {
						ps = conn.prepareStatement(sql);
						ps.setString(1, num);
						rs = ps.executeQuery();
						while(rs.next()) {
							lastResult.add(rs.getString("num"));
							lastResult.add(rs.getString("subject"));
							lastResult.add(rs.getString("name"));
							for (int i = 1; i <= 10; i++) {
								lastResult.add(rs.getString("ta"+(i)));
							}
							lastResult.add(rs.getString("score"));
						}
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("selectTesterResult() Exception");
					} finally {
						dbClose();
					}
					return lastResult;
				}//selectSubjectQuestion()
				
		
		
		//응시자 시험결과 입력 : 번호,과목명,이름,문제1~~~~문제10,점수 : 총 14개 칼럼	
		public int insertTesterAnswer(String[] tester, String[] answer, int score) {	
			conn = getConn();
			String sql = "insert into testerAnswer values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			int succ = 0;
			try {
				ps = conn.prepareStatement(sql);
				for (int i = 0; i < tester.length; i++) {
					ps.setString((i + 1), tester[i]);
				}
				for (int i = tester.length; i < (tester.length + answer.length); i++) {
					ps.setString((i + 1), answer[i - tester.length]);
				}
				ps.setInt(tester.length + answer.length + 1, score);

				succ = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("insertTesterAnswer() Exception");
			} finally {
				dbClose();
			}
			return succ;
		}//insertTesterAnswer()
		
		
		
		//수험번호를 매개변수로 받아 응시한 내역을 삭제
		public int deleteTesterAnswer(int num) {
			conn = getConn();
			String sql = "delete From testerAnswer where num = ?";
			int succ = 0;
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, num);
				succ = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("deleteTesterAnswer() Exception!");
			}finally {
				dbClose();
			}
			return succ;
		}//deleteTesterAnswer()
		
		
		
		//가장최신의 응시자 번호를 불러온다.
		public String createTesterNum() {	//응시자 시험번호 자동생성
			conn = getConn();
			String sql = "select (max(num)+1) num from testerAnswer";
			String num = "";
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					num = rs.getString("num");	
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("createTesterNum() Exception");
			} finally {
				dbClose();
			}
			return num;
		}//insertTesterAnswer()
		
		
		//-----------------------------------------------------------
		
		
		//해당 과목의 모든 문제 문항을 불러오는 메소드
		public ArrayList<String> selectSubjectQuestion(String subject) {	//과목별 문제 리스트 조회
			conn = getConn();
			String sql = "SELECT * FROM question where subject = ?";
			ArrayList<String> question = new ArrayList<>();
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, subject);
				rs = ps.executeQuery();
				while(rs.next()) {
					for (int i = 0; i <= 10; i++) {
						if(i == 0) {
							question.add(rs.getString("subject"));
						}else {
							question.add(rs.getString("q"+(i)));
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("selectSubjectQuestion() Exception");
			} finally {
				dbClose();
			}
			return question;
		}//selectSubjectQuestion()
		
		
		//-----------------------------------------------------------
		
		
		public ArrayList<String> selectDistractor (String subject) {	//과목별 문항 선택지 리스트 조회
			conn = getConn();
			String sql = "SELECT * FROM distractor where subject = ?";
			ArrayList<String> distractor = new ArrayList<>();
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, subject);
				rs = ps.executeQuery();
				while(rs.next()) {
					for (int i = 0; i <= 10; i++) {
						if(i == 0) {
							distractor.add(rs.getString("subject"));
						}else {
							distractor.add(rs.getString("d"+(i)));
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("selectDistractor() Exception");
			} finally {
				dbClose();
			}
			return distractor;
		}//selectDistractor()
		
		
		//-----------------------------------------------------------
		
		
		// 전체 회원정보 json 저장 -> fw
		public void fwTester() {
			TestDAO dao = new TestDAO();
			ArrayList<TesterDTO> list = dao.selectAllTester();		//전체수험자정보를 list에 담는다.
			try {
				System.out.println("execute line 01");
				
				JSONArray array = JSONArray.fromObject(list);
				String json = array.toString();	//.toString() > array에 담긴 배열 값을 가지고 오는 기능
						
				System.out.println("execute line 02");
				
				String outputPath = "D:\\Study_Web\\workspace\\05.OMR_Programing_B\\WebContent\\testerList.json";
				
				System.out.println("execute line 03");
						
				FileWriter fw = new FileWriter(outputPath);
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(json);
				bw.flush();
				
				System.out.println("execute line 04");
				
				bw.close();
				fw.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("fwTester() Exception!");
			}
		}//fsTster()
		
		
		

}
