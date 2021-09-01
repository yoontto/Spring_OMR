--user명 : hanul
--pw     : 0000

--1-1. test table : 과일 문제 테이블 생성
CREATE TABLE teamA_test_fruit (
  test_num              number,         --문제번호. pk키
  test_problem          VARCHAR2(2000),   --문제의 문항.
  test_answer           number,         --문제정답.
  test_choice1          VARCHAR2(900),   --보기1의 문항.
  test_choice2          VARCHAR2(900),   --보기2의 문항.
  test_choice3          VARCHAR2(900),   --보기3의 문항.
  test_choice4          VARCHAR2(900),   --보기4의 문항.
  CONSTRAINT fruit_num_pk  PRIMARY KEY(test_num));
  
--1-2. test table : 아이스크림 문제 테이블 생성
CREATE TABLE teamA_test_icecream (
  test_num              number,         --문제번호. pk키
  test_problem          VARCHAR2(2000),   --문제의 문항.
  test_answer           number,         --문제정답.
  test_choice1          VARCHAR2(900),   --보기1의 문항.
  test_choice2          VARCHAR2(900),   --보기2의 문항.
  test_choice3          VARCHAR2(900),   --보기3의 문항.
  test_choice4          VARCHAR2(900),   --보기4의 문항.
  CONSTRAINT icecream_num_pk  PRIMARY KEY(test_num));
  
  --1-3. test table : 스낵 문제 테이블 생성
CREATE TABLE teamA_test_snack (
  test_num              number,         --문제번호. pk키
  test_problem          VARCHAR2(2000),   --문제의 문항.
  test_answer           number,         --문제정답.
  test_choice1          VARCHAR2(900),   --보기1의 문항.
  test_choice2          VARCHAR2(900),   --보기2의 문항.
  test_choice3          VARCHAR2(900),   --보기3의 문항.
  test_choice4          VARCHAR2(900),   --보기4의 문항.
  CONSTRAINT snack_num_pk  PRIMARY KEY(test_num));
  
  --1-4. test table : 빵 문제 테이블 생성
CREATE TABLE teamA_test_bread (
  test_num              number,         --문제번호. pk키
  test_problem          VARCHAR2(2000),   --문제의 문항.
  test_answer           number,         --문제정답.
  test_choice1          VARCHAR2(900),   --보기1의 문항.
  test_choice2          VARCHAR2(900),   --보기2의 문항.
  test_choice3          VARCHAR2(900),   --보기3의 문항.
  test_choice4          VARCHAR2(900),   --보기4의 문항.
  CONSTRAINT bread_num_pk  PRIMARY KEY(test_num));
  


--2. Candidate table : 응시정보 테이블 생성
CREATE TABLE teamA_candidate (
  candidate_num         number,         --응시번호. pk키
  candidate_test_name   VARCHAR2(10),   --문제 시험 과목명
  candidate_get_right   number,         --문제맞춘갯수.
  CONSTRAINT candidate_num_pk  PRIMARY KEY(candidate_num));

--3.시퀀스/트리거
CREATE sequence teamA_seq_fruit start with 1 increment by 1;
CREATE sequence teamA_seq_icecream start with 1 increment by 1;
CREATE sequence teamA_seq_snack start with 1 increment by 1;
CREATE sequence teamA_seq_bread start with 1 increment by 1;
CREATE sequence teamA_seq_candidate start with 1 increment by 1;

create or replace TRIGGER teamA_trg_fruit
  before insert on teamA_test_fruit
  for each row
begin
  select teamA_seq_fruit.nextval into:new.test_num from dual;
end;
create or replace TRIGGER teamA_trg_icecream
  before insert on teamA_test_icecream
  for each row
begin
  select teamA_seq_icecream.nextval into:new.test_num from dual;
end;
create or replace TRIGGER teamA_trg_snack
  before insert on teamA_test_snack
  for each row
begin
  select teamA_seq_snack.nextval into:new.test_num from dual;
end;
create or replace TRIGGER teamA_trg_bread
  before insert on teamA_test_bread
  for each row
begin
  select teamA_seq_bread.nextval into:new.test_num from dual;
end;
create or replace TRIGGER teamA_trg_candidate
  before insert on teamA_candidate
  for each row
begin
  select teamA_seq_candidate.nextval into:new.candidate_num from dual;
end;

--4. 문제 테이블에 답 저장
--과일 과목 답 저장
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 과일 중 나무의 열매로써의 과일이 아닌 것은?', 1, '스트로베리', '라즈베리', '크랜베리', '블루베리');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 과일 중 나무의 열매로써의 과일인 것은?', 2, '바나나', '산딸기', '토마토', '참외');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 과일 중 장어와 함께 먹으면 좋지 않다고 알려진 과일은?', 1, '복숭아', '살구', '자두', '레몬');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 나무들이 맺는 열매를 순서대로 나열한 것을 고르세요. <br/>벚나무─매화나무─복사나무─오얏나무', 
2, '매실', '복숭아', '자두', '버찌');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 중 포도의 품종이 아닌 것은?', 
1, '핑크레이디', '캠벌얼리', '머스캣', '블랙사파이어');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 중 감나무의 과일을 일컫는 단어가 아닌것은?', 
2, '곶감', '밀감', '홍시', '연시');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 중 장미나무과에 속하는 나무가 맺는 과일이 아닌 것은?', 
1, '머루', '사과', '자두', '배');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 중 원래부터 우리나라에 존재했던 과일은?', 
2, '바나나', '체리', '용과', '구아바');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('다음 중 귤의 교배종인 과일이 아닌 것은?', 
1, '달콤향', '한라봉', '천혜향', '레드향');
INSERT INTO teamA_test_fruit(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('학명 Ananas가 뜻하는 과일은?', 
2, '바나나', '파인애플', '키위', '오렌지');

--아이스크림 과목 답 저장
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('미국 스탠더드 캔디 사(구구 크러스터)에서 라이센스받아 롯데푸드에서 출시한 아이스크림.
초코 아이스크림에 머쉬멜로우와 캐러멜 시럽과 땅콩이 들어간 형태로 출시한 제품의 이름은?', 2, 
'월드콘', '구구콘', '부라보콘', '9X9=81');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('롯데푸드(구 롯데삼강)에서 1983년에 내놓은 나무 바에 달린 직사각형의 아이스크림으로 
겉은 분쇄된 초콜릿 비스킷으로 덮여있고 속에는 바닐라 아이스크림과 딸기시럽이 들어 있다
제품의 이름이 이것인 이유는 1983년이 돼지띠의 해였기 때문이다. ', 1, 
'돼지바', '죠스바 스윽꺼내보니 바밤바', '빵빠레 빠삐코 레알바밤바', '돼지바 지금보니 바밤바');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ( '역사가 오래된 아이스크림으로, 1976년부터 판매되기 시작했다
제일 안쪽 부분에는 콩으로 만든 백앙금이 들어있다.
급식들한테는 아저씨들이나 먹는 아이스크림이라는 이미지가 형성되어 있어서 
비비빅과 비슷하게 부모님이 사 오면 이런 반응이 나오는 아이스크림이지만 
편견 가지지 말고 한 번쯤 먹어보는 것도 괜찮다. 포장지의 절대적인 촌스러움에 비해 
생각보다 옛날 입맛은 아니고 급식들이 학을 떼는 팥과도 거리가 있어서 젊은 층도 취향에 맞을 수도 있다. 
바 아이스크림 치고는 나름 고급진 맛이 난다. ', 2, 
'보석바', '바밤바 밤으로만든 바밤바', '비비빅', '붕어싸만코');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ( '대한민국 빙그레에서 출시하였으며, 팥과 바닐라 아이스크림이 속에 채워진 사각형 아이스 모나카 제품이다
겨울에 먹는 붕어빵을 여름에도 먹게 해보자는 아이디어로 출발한 이 제품의 이름은?',
2, '붕어싸만코', '멘붕어싸만코', '흑임자붕어싸만코자두', '매운치즈떡볶이');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('빙그레에서 1992년 1월 출시한 초록색 멜론 맛 아이스크림. 
멜론에 크림을 적당히 섞은 듯한 맛이며, 출시 당시부터 엄청난 인기를 끌어 
남녀노소 사랑받고 있고 매년 빙과류 판매 상위권을 차지하고 있다.',
1, '올때메로나', 'All that Melona', '치즈떡볶이 순한맛', '블랙사파이어');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('롯데제과에서 만든 떡 모양 아이스크림으로 1986년에 출시했다, 
소정의 용기에 (  ) 두 개와 플라스틱 포크가 하나 들어있다.
찹쌀 베이스인 떡 안에 아이스크림이 들어있다. ',
2, '찰떡아이스', '말랑카우', '마카롱 아이스바', '통새우와퍼');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values (  '해태제과에서 1979년부터 생산하는 아이스크림. 
한 아이스크림을 쪼개서 둘이 나눠 먹는다는 콘셉트가 특징인 아이스크림.
말 그대로 두 개의 아이스크림이 붙어 있으며 중간을 쪼개서 먹을 수가 있다. 
그런데 힘조절을 잘못 하면 한쪽 막대기에 아이스크림 부분이 몽창 뜯겨나가는 경우가 있다
해당 제품의 이름은?',
1, '쌍쌍바 쌍을 떼어보니 바밤바', '쌍쌍바', '누가바 가만보니 바밤바', '탱크보이');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ( '롯데제과에서 1986년 출시한 콘류 아이스크림. 초콜릿 알갱이가 들어 있다.
이름이 이름인 만큼 월드컵 시즌 때는 축구선수를 데려오거나 축구 쪽으로 광고를 자주 하는 편이다. 
특히 2002년 한일 월드컵 때는 4강까지 갔던 터라 이걸 이용해서 엄청나게 광고를 찍었다.
해당 제품의 이름은?',
2, '월드콘', '부라보콘', '월드컵', '더월드');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('2003년에 롯데제과에서 출시된 빙과류. 제품명을 해석하면
눈처럼 와서 이슬로 방울 져 떨어지다라는 뜻으로, 그만큼 맛있고 부드럽다는 의미다.
대한민국 최초로 도입된 치어팩 타입 아이스크림으로, 뚜껑이 있어서 먹다가 나중에 다시 먹을 수 있으며 
내용물이 손에 묻을 염려가 없다는 장점이 있다.',
1, '망설임', '설레임', '설레임먹으면 나한테 설레임', '설국열차');
INSERT INTO teamA_test_icecream(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values (       '배스킨라빈스의 메인 플레이버. 바닐라 아이스크림과 함께 잘게 부순 오레오 쿠키가 들어 있으며
이 제품이 들어가는 전용 음료로 쿠키 앤 크림 블라스트가 있다.
고전적이고 무난한 맛 중 하나다보니 시중에 비슷한 제품들도 많이 팔고 있다. 쿠앤크가 대표적.
2019년 11월, 쿠키 앤 크림을 베이스로 크림치즈 크런치와 크림치즈 아이스크림을 추가한 
(   )을 이달의 맛으로 출시했다.
( )안에 들어갈 제품으로 알맞은것은?',
2, '오레오 쿠키 앤 크림', '매시업스 시리얼', '아이스 밀카 초콜릿', '엄마는 외계인');

--스낵 과목 답 저장
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('밀가루를 주원료로 하여 지방·우유·버터·계란(다른 난류도 가능)·당분·향료 등을 섞어서 
반죽하여 여러 모양의 틀에 구워낸 과자 혹은 빵. 어원은 프랑스어로 bis(다시 한번)+cuit(굽다) 
즉, 두 번 구운 빵. 비스코티(biscotte)와 같은 어원을 가지고 있다. 현대 프랑스어 비스코티는 러스크를 가리키는데,
이것의 이름은?', 1, '갸또', '비스코티', '비스킷', '버터쿠키');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('머랭쿠키의 일종으로 계란 흰자와 설탕을 넣는 기본 머랭 레시피에 
아몬드 분말, 추가로 현대에 이르러서 (  ) 의 중대한 요소로 여겨지는 식용 색소를 혼합하여 만든다. 
아몬드의 함량이 높을수록 (  ) 특유의 카사삭 부서지는 독특한 식감이 도드라지는 편.
(  ) 에 들어갈 단어로 알맞은 것은?', 2, '와플', '마카롱', '웨하스', '티라미수');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('밀가루에 여러 가지 부재료를 섞어 반죽하여 기름에 튀긴 과자. 어원은 밀가루 반죽(dough)+견과류(너트).
간식의 일종이기는 하지만 미국에서는 아침 식사를 할 때 빵 대신 먹기도 한다.
세계 대공황 시절에는 사설 구호소에서 실업자들에게 베푸는 구호품으로 커피와 함께 많이 이용되었다.
이것의 이름은?', 1, '머핀', '시폰 케이크', '도넛', '포춘쿠키');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('(주)오리온에서 1982년 12월 처음 출시하여 현재도 꾸준히 내놓고 있는 통밀 원형 비스킷.
맥비티(McVitie)와의 기술 제휴 계약을 통해 다이제스티브라는 이름으로 출시했다가 
2002년 계약만료와 동시에 이름을 바꾸게되었다.
관련된 유머로, 양을 계속 줄이다보니 제품 길이가 짧아진 탓에 다이제스티브라는 여섯 글자를 자연스럽게 
기재하기 힘들어져 세 글자로 바꿨다.라는 유머도 있다.', 
2, '갈레트', '다이제', '마카롱', '송지훈');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('한국에서 만든 과자 중 하나. 생산업체는 삼양식품. 1986년 9월 출시.
입에 넣었을 때 맨 처음에는 약간 짠맛(안주용 땅콩에서 느껴지는 약간 짠맛 정도)이 느껴지나 
조금 있으면 달착지근하면서도 부드러운 맛이 느껴진다. 단맛이 그렇게 강하지는 않으며 입안에서 녹는 부드러운 느낌이 일품. 
왠지 팝콘처럼 생겼지만 씹을때 감촉은 천지차이.
과거 이 제품을 조선시대의 사또가 나오는 CF를 촬영했기 때문에 이름이 이렇게 붙여졌다.', 
1, '바나나킥', '고래밥', '사또밥', '스윙칩');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('미국의 켈로그사에서 개발해서 생산하는 감자칩의 상표명
다른 감자칩들이 생감자를 재료로 삼는 것에 비해 (  )는 말린 감자로 만든다. 
다른 감자칩보다 소금과 각종 조미료가 많이 첨가되어서 꽤나 자극적인 맛을 자랑한다
사워크림, 피자, 치즈 등 여러 맛이 있기는 하지만 모두 짠맛을 기반으로 하기 때문에 전부 소금맛으로 불리기도 한다.
카이저 수염을 기른 중년 남자를 캐릭터 모티브로 한 이 감자칩의 이름은?', 
2, '스윙칩', '프링글스', '포테토칩', '썬칩');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('농심그룹에서 1983년 10월 28일부터 생산하는 봉지 과자로 어니언링과 유사한 생김새를 갖고있다.
 양파를 베이스로 하는 감자, 베이컨맛 등의 시즈닝이 들어간 링(Ring)타입의 스낵이다
특유의 링 형태 때문인지 여러 예능프로그램에 실을 묶은 형태로 경주 관련 컨텐츠에 자주 출연했다.
이 과자의 이름은?', 
1, '어니언링', '마늘링', '양파링', '기모링');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('미국 펩시코 서브브랜드 프리토레이의 삼각형 모양의 토르티야 칩
이것은  ‘작은 황금’(doradito)을 의미하는 스페인어를 채용해 지어진 이름이다.
국내에서는 나쵸 라는 이름으로 판매되고있다. 
이 과자의 이름은?', 
2, '알새우칩', '도리토스', '스윙칩', '프링글스');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('여러 모양(주력 제품은 불규칙한 방망이 형태)의 옥수수과자에 여러가지 맛의 짭짤한 양념이 되어있는 것이 특징
1986년부터 체스터라는 이름의 치타가 (  )를 먹고 싶어하지만 번번히 실패한다는 내용의 CF를 방영해 
전 세계적으로 인기를 끌었다.', 
1, '나쵸', '브이콘', '치토스', '쫄병스낵');
INSERT INTO teamA_test_snack(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('오뚜기에서 1999년부터 판매하고 있는 라면과자. 라면땅과는 다르게 생라면이 당시 학생들에게 인기를 끌고 있을 때, 
아예 그 생라면의 컨셉을 과자로 만들어서 크게 성공했다
라면을 끓여 먹지 않고 날 것으로 스프만 뿌려먹는 방법을 역이용한 이 제품의 이름은?',
2, '신라면', '뿌셔뿌셔', '참깨라면', '송지훈쌤과 함께라면...');

--빵 과목 답 저장
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ( '밀가루가 주 재료이며, 수분 함량이 6% 이하가 되도록 구워 바짝 마른 빵이다
비스킷과는 달리 수분을 한계까지 제거하여 세균이 번식하기 힘든 데다 가벼워 휴대와 
장기보관이 용이해 옛날부터 현대까지 애용되는 비상식량이자 보존식품이며 전투식량을 대표하는 음식이기도 하다.', 1, 
'식빵', '공갈빵', '땜빵', '건빵');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('소라 모양으로 속이 텅 비게 만든 빵 안에 초콜릿, 커스터드, 가나슈 크림 등을 넣어서 만드는 과자 및 빵의 일종
구울 때 소라틀이 필요하다. 짤주머니 글씨 쓰기 깍지 비슷한 것에 거대하고 원추형이다. 
속의 크림은 굽고 난 다음에 채운다.', 2, 
'소보로빵', '단팥빵', '소라빵', '바게트');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('마늘, 버터, 꿀등으로 소스를 만들어 빵에 바른 후 오븐에 구운 빵이다. 
한국에서는 보통 바게트를 이용해 만들며 변형으로 식빵이나 크루아상, 빠네빵등을 사용해 만들기도 한다.', 1,
'마늘빵', '멜론빵', '술빵', '크림빵');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('일본에서 유래된 빵의 일종으로, 팥소(餡子; 앙코)가 들어간 빵이라 하여 붙여진 이름이다.
윗면 중앙이 움푹 들어가게 구운 것과, 윗쪽까지 둥글둥글하게 구워 깨 등을 뿌린 것 두 가지 형태로 크게 나뉜다.', 
2, '프레첼', '호밀빵', '단팥빵', '찰보리빵');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('여러 겹으로 이루어져 있는 텍스쳐가 특징인 페이스트리의 일종으로 초승달 모양의 빵.
판상의 밀가루 반죽 안에 버터를 올려놓고 겹겹이 접어서 반죽-버터-반죽이 교차되는 층상 구조를 만든 뒤 
삼각형으로 잘라서 돌돌 말아 초승달 모양으로 만든다.
이런 요리법 때문에 칼로리 하나는 그 어떤 빵에 비교해도 높은 편에 속한다.
이 빵의 이름은?',  
1, '호밀빵', '꽈배기', '크루아상', '스위트롤');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('요즘 유행하는 감자빵은 밭에서 캐낸 감자를 닮았다고 해서 감자빵이라고 이름 붙여졌다. 
포슬포슬한 식감을 자랑하는 감자빵이 가장 유명한 지역은?', 
2, '춘천', '강릉', '무안', '속초');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('파리바게트는 한국을 대표하는 베이커리로 해외진출까지 성공한 프랜차이즈이다. 
2015년부터 2019년까지 5년간 이 빵을 가장 많이 판매해 기네스 북에 이름을 올렸다.
이 빵의 이름은?', 
1, '바게트', '실키롤케잌', '로만밀식빵', '초코소라빵');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('일본에서 유래된 과자빵 종류로 둥근 빵 반죽위에 설탕이 섞인 쿠키 반죽을 얹어서 굽는다.
호빵맨에서 나온 캐릭터의 얼굴 모양이 이 빵에서 따온 것과 같다. 이 빵의 이름은?', 
2, '카레빵', '롤빵', '소보루', '메론빵');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('숫자 8을 꼬아놓은 듯한 모양새를 하고 있는 빵으로, 독일을 상징하는 빵이다. 
밀가루와 이스트, 설탕, 버터와 우유의 간단한 재료로 만드는 이 빵은 무엇인가?', 
1, '프레첼', '팬케잌', '스콘', '허니브레드');
INSERT INTO teamA_test_bread(test_problem, test_answer, test_choice1, test_choice2, test_choice3, test_choice4)
values ('밀가루, 효모, 물, 소금을 사용해 만든 이탈리아 빵이다.
이탈리아어로 슬리퍼를 의미하며, 길다랗고 넓적하며 가운데가 푹 들어간 빵의 모양 때문에 붙은 이름이다.
바게트를 대체할 목적으로 만들어졌으며, 보통 샌드위치 포지션의 빵이다
겉은 질기고 단단한 데 속은 쫀득하고 부드러운 특징이 있으며,
그대로 먹기도 하고 스튜와 같은 국물요리에 찍어 먹거나 속재료를 넣어서 샌드위치 형태로 먹는다.
이 빵의 이름은?',
2, '꿀빵', '젠빙', '팬케이크', '치아바타');

--응시자 임의 데이터 저장
INSERT INTO teamA_candidate(candidate_test_name, candidate_get_right)
values ('fruit', 5);
INSERT INTO teamA_candidate(candidate_test_name, candidate_get_right)
values ('icecream', 7);
INSERT INTO teamA_candidate(candidate_test_name, candidate_get_right)
values ('snack', 9);
INSERT INTO teamA_candidate(candidate_test_name, candidate_get_right)
values ('bread', 4);



commit;






