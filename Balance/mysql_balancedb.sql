use balancedb;

select * from member;
select * from question;

-- 회원정보 저장할 member 테이블
create table member (
id varchar(20),
pw varchar(20),
gamecount int,
g1 int,
g2 int,
g3 int,
g4 int,
g5 int,
g6 int,
g7 int,
g8 int,
g9 int,
g10 int,
g11 int,
g12 int,
g13 int,
g14 int,
g15 int,
g16 int,
g17 int,
g18 int,
g19 int,
g20 int
);


-- 밸런스 선택지 저장할 question 테이블
create table question (
num int,
opt varchar(100),
total int,
yes int
);


-- 대학생 밸런스
insert into question values(1,'5시간 우주 공강',0,0);
insert into question values(2,'9시부터 3연강',0,0);
insert into question values(3,'4시간 통학',0,0);
insert into question values(4,'통금 9시 기숙사',0,0);
insert into question values(5,'현 애인의 전 애인과 팀플하기',0,0);
insert into question values(6,'전 애인의 현 애인과 팀플하기',0,0);
insert into question values(7,'하루에 시험 5개',0,0);
insert into question values(8,'종강 후 레포트 5개',0,0);
insert into question values(9,'영상마다 과제가 있는 온라인 강의',0,0);
insert into question values(10,'한 번만 지각해도 학점 깎이는 대면 강의',0,0);
insert into question values(11,'5분 단위로 알람 맞추고 안 일어나는 룸메',0,0);
insert into question values(12,'밤에 잠 안 자고 시끄럽게 게임하는 룸메',0,0);
insert into question values(13,'꿀교양 잡고 전공 놓치기',0,0);
insert into question values(14,'전공 잡고 꿀교양 놓치기',0,0);
insert into question values(15,'월공강',0,0);
insert into question values(16,'금공강',0,0);
insert into question values(17,'교양 수업 옆자리 술냄새',0,0);
insert into question values(18,'교양 수업 옆자리 담배냄새',0,0);
insert into question values(19,'월 200 버는 백수',0,0);
insert into question values(20,'월 500 버는 직장인',0,0);

-- 연인 밸런스
insert into question values(21,'싸울 때마다 우는 애인',0,0);
insert into question values(22,'싸울 때마다 욕하는 애인',0,0);
insert into question values(23,'재입대하기',0,0);
insert into question values(24,'여친 10년 못 사귀기',0,0);
insert into question values(25,'1분마다 연락하는 애인',0,0);
insert into question values(26,'한 달에 1번 연락하는 애인',0,0);
insert into question values(27,'바람둥이',0,0);
insert into question values(28,'마마보이',0,0);
insert into question values(29,'환승이별',0,0);
insert into question values(30,'잠수이별',0,0);
insert into question values(31,'연인이 이성친구와 단 둘이 외박',0,0);
insert into question values(32,'연인이 전 애인과 단 둘이 술',0,0);
insert into question values(33,'연인과 대화 없이 스킨십만 하기',0,0);
insert into question values(34,'연인과 스킨십 없이 대화만 하기',0,0);
insert into question values(35,'절친의 전 애인과 사귀기',0,0);
insert into question values(36,'전 애인의 절친과 사귀기',0,0);
insert into question values(37,'로또에 당첨된다면, 연인한테 말한다',0,0);
insert into question values(38,'연인한테 말하지 않는다',0,0);
insert into question values(39,'단톡방에서 고백 받기',0,0);
insert into question values(40,'길거리에서 고백 받기',0,0);