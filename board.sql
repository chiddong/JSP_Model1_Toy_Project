
create table tblSboard (
    seq number,
    name varchar2(30) not null,
    id varchar2(30),
    pw varchar2(30) not null,
    content varchar2(1000) not null,
    lv varchar2(1) not null,
    regdate date default sysdate not null
);

drop table tblSboard;

create sequence seqSboard;

drop sequence seqSboard;

-- 게시판 목록 조회하기
select * from tblSboard;

-- 게시글 추가하기
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '관리자', '00000000', '0000', '공지사항입니다.', 2, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '신세경', '20211011', '1120', '안녕하세요! 만나서 반가워요!', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '강민경', '20160416', '1120', '처음뵙겠습니다ㅎㅎㅎ 익명게시판에서 만나서 반가워요!', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '차은우', '20200801', '1120', '우와 신기하네요! 다들 저녁은 뭐드셨나요? 반가워요!', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '이제훈', '20191123', '1123', '게시물은 처음 작성해보네요. 유익한 글이 많아서 너무 좋습니다! 자주 글 쓰겠습니다.', 1, default);

insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '김태형', '20190627', '1226', '온 가족이 코로나19에 감염돼도 바이러스 전염을 피해 가는 슈퍼 면역자가 실제로 존재한다는 연구 결과가 공개돼 화제다.', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '전정국', '20221107', '1230', '홀리스는 당시 자신의 경험했던 코피 출혈 증상이 몸에 슈퍼 항체가 생긴 기점이었을 것으로 짐작했다.', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '장원영', '20210907', '0403', '소식이 전해지자 홀리스는 “내 혈액과 체액을 활용해 더 많은 사람들이 슈퍼 면역력을 갖게 되기를 바란다”면서 “코로나19 바이러스와 함께 살게 된 시대에 많은 사람들이 건강하게 살 수 있는데 도움을 주고 싶다”고 했다.', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '안유진', '20190504', '0308', '거리 위 많은 사람과 차량의 움직임을 실시간으로 분석하고,화질이 나쁜 사진도 금방 선명하게 만들어줍니다..', 1, default);
insert into tblSboard(seq, name, id, pw, content, lv, regdate)  values(seqSboard.nextVal, '전지현', '20150403', '0225', '수많은 정보를 이렇게 빠르게 학습해 추론까지 하려면 하드웨어의 뒷받침이 필수인데, 여기에 쓰이는 것이 초고속, 저전력 소모가 특징인 AI반도체입니다.', 1, default);


-- 게시글 수정하기
update tblSboard set content='처음뵙겠습니다. 앞으로 잘부탁드립니다.' where id='segyeong12';

-- 게시글 삭제하기
delete from tblSboard where id='segyeong12';

-- 암호 확인하기(권한확인차)   > 1(seq와 pw가 모두 동일) / 0 (둘중 하나라도 틀림)
select count(*) as cnt from tblMemo where seq = 1 and pw = '1120';


commit;