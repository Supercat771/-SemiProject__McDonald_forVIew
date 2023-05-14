show user;

create table tbl_test(
no  number,
name Nvarchar2(20)
);


select *
from tbl_test;

show user;


create table tbl_category( -- (카테고리 테이블)

category_id Number NOT NULL -- 카테고리 분류번호

, category_name NVARCHAR2(10) NOT NULL -- 카테고리명

,constraint PK_tbl_category_category_id primary key(category_id)  -- 카테고리 분류번호 제약조건

, constraint UQ_tbl_category_category_name unique (category_name) -- 카테고리명 유니크 제약조건
);




commit;

create table tbl_item( -- 제품 테이블

item_no Number NOT NULL -- 제품코드
, fk_category_no NuMBER NoT NULL -- 카테고리분류번호
, item_name varchar2(20) not null -- 제품명
, item_image varchar2(20) not null -- 기본이미지파일명
, item_price number not null -- 제품가격
, morning_availability number not null -- 시간별판매여부
, is_burger varchar2(1) not null -- 버거여부
, is_set_ok varchar2(1) not null -- 세트가능여부
,constraint PK_tbl_item_item_no primary key(item_no) -- 제품코드 기본키 제약조건
,constraint FK_tbl_item_fk_category_no foreign key(fk_category_no) references tbl_category(category_id) -- 카테고리분류번호 외래키 제약조건
,constraint UQ_tbl_item_item_name unique(item_name)
,constraint UQ_tbl_item_item_image unique(item_image)
,constraint CK_tbl_item_morning_availability check(morning_availability in (0,1,2) ) 
,constraint CK_tbl_item_is_burger check(is_burger in (0 , 1) ) 
,constraint CK_tbl_item_is_set_ok check(is_set_ok in (0 , 1)  ) 

);



commit;



create table tbl_image_add( -- 추가 이미지번호 및 추가이미지파일명 테이블

image_add_no number not null -- 추가이미지 번호
, fk_item_no number not null -- 제품코드
, image_add_name varchar2(20) not null -- 추가이미지파일명
,constraint PK_tbl_image_add_image_add_no primary key(image_add_no)  --  추가이미지번호 제약조건
,constraint FK_tbl_image_add_fk_item_no foreign key(fk_item_no) references tbl_item(item_no) -- 제품코드 외래키 제약조건
, constraint UQ_tbl_image_add_image_add_name unique (image_add_name) -- 추가이미지파일명 유니크 제약조건

);

create table tbl_item_detail ( -- (제품상세정보)

fk_item_no number not null -- 제품코드
, weight_g number null -- 중량(g)
, weight_ml number null -- 중량(ml)
, calories number null -- 열량(kcal)
, carbo number null -- 당(g)
, protein number null -- 단백질(g)
, fat number null -- 포화지방(g)
, sodium number null -- 나트륨(g)
, caffeine number null -- 카페인(mg)
, allergens nvarchar2(20) null -- 알레르기 정보
, "from" nvarchar2(20) null -- 원산지 정보
,constraint PK_tbl_item_detail_fk_item_no primary key(fk_item_no)  -- 제품코드 기본키 제약조건
,constraint FK_tbl_item_detail_fk_item_no foreign key(fk_item_no) references tbl_item(item_no) -- 제품코드 외래키 제약조건

);



commit;

insert into tbl_item(item_no,fk_category_no,item_name,item_image,item_price,morning_availability,is_burger,is_set_ok)  values(111111,100,'bigmac','bigmacpng',10000,2,0,1)


select *
from tbl_item
order by item_no asc;


insert into tbl_category (category_id, category_name) values (200,'side_menu')

select *
from tbl_category;


   
    




-- 사이드 시퀀스

   create sequence item_side_seq  
   start with 300                 -- 첫번째 출발은 300부터 한다. 
   increment by 1               -- 증가치는 1이다. 즉 1씩 증가 
   minvalue 300                   -- 최소값이 300이다                                 
   maxvalue 399                   -- 최대값이 399이다   
   nocycle                        -- 반복한다.                      
   nocache;  


select *
from USER_CONSTRAINTS
where TABLE_NAME = 'TBL_ITEM'


insert into tbl_item values(item_side_seq .nextval, 3, '슈림프 스낵랩','1_슈림프스낵랩.png', 3100, 2, 0,  '통통한 새우살 가득한 슈림프 패티에 화이트마요와 스위트 칠리 소스로 매콤달콤하게!');

insert into tbl_item values(item_side_seq .nextval, 3, '코울슬로','2_코울슬로.png', 2700, 2, 0,  '양배추, 당근, 양파가 상큼하고 크리미한 마요 드레싱과 어우러져 아삭하게 씹히는 샐러드');

insert into tbl_item values(item_side_seq .nextval, 3, '상하이 치킨 스낵랩','3_상하이치킨스낵랩.png', 3500, 2, 0,  '매콤한 치킨에 달콤한 화이트 마요 소스로 매콤달콤하게! 베이컨에 양상추, 또띠아까지 어우러져 씹는 맛까지 즐겁다!');

insert into tbl_item values(item_side_seq .nextval, 3, '골든 모짜렐라 치즈스틱','4_골든모짜렐라치즈스틱.png', 3300, 2, 0,  '속이 꽉 찬 황금빛 바삭함! 자연 모짜렐라 치즈로 빈틈 없이 고소한 맥도날드 치즈스틱을 2조각과 4조각으로 다양하게 즐겨보세요!');

insert into tbl_item values(item_side_seq .nextval, 3, '후렌치 후라이','5_후렌치후라이.png', 2800, 2, 0,  '통으로 썰어낸 감자를 맥도날드만의 노하우로 튀겨낸 남다른 맛과 바삭함! 맥도날드의 역사가 담긴 월드 클래스 후렌치 후라이');

insert into tbl_item values(item_side_seq .nextval, 3, '맥너겟®','6_맥너겟.png', 3300, 2, 0,  '바삭하고 촉촉한 치킨이 한 입에 쏙! 다양한 소스로 입맛에 맞게 즐겨보세요!');

insert into tbl_item values(item_side_seq .nextval, 3, '맥스파이시®치킨 텐더','7_맥스파이시치킨텐더.png', 3500, 2, 0,  '부드러운 100% 닭안심살을 스파이시 시즈닝으로 매콤 바삭하게 튀겨낸 치킨 텐더! 2가지 소스로 입맛에 맞게 즐겨보세요!');

insert into tbl_item values(item_side_seq .nextval, 3, '해쉬 브라운','8_해쉬브라운.png', 1100, 2, 0,  '씹으면 바삭바삭, 속은 부드러운 감자의 고소함.');


commit;

-------------------------------------------------------------------------

select *
from tbl_item
where FK_CATEGORY_NO = 4
order by item_no asc;


-- 디저트 시퀀스

   create sequence item_dessert_seq  
   start with 400                 -- 첫번째 출발은 400부터 한다. 
   increment by 1               -- 증가치는 1이다. 즉 1씩 증가 
   minvalue 400                   -- 최소값이 400이다                                 
   maxvalue 499                   -- 최대값이 499이다   
   nocycle                        -- 반복한다.                      
   nocache;  
      

insert into tbl_item values(item_dessert_seq.nextval, 4, '베리 스트로베리 맥플러리','1_베리스트로베리맥플러리.png', 3700, 2, 0,  '신선한 1등급 원유에 국내산 딸기 과즙이 들어간 스트로베리 아이스크림에 오레오가 블랜드 되어 있는 맥플러리');

insert into tbl_item values(item_dessert_seq.nextval, 4, '오레오 맥플러리','2_오레오맥플러리.png', 3700, 2, 0,  '우유 듬뿍 신선한 아이스크림에 아삭아삭 오레오 쿠키가 가득!');

insert into tbl_item values(item_dessert_seq.nextval, 4, '딸기 오레오 맥플러리','3_딸기오레오맥플러리.png', 3700, 2, 0,  '상큼한 딸기와 달콤한 오레오 쿠키가 신선한 우유 아이스크림에 퐁당!');

insert into tbl_item values(item_dessert_seq.nextval, 4, '초코 오레오 맥플러리','4_초코오레오맥플러리.png', 3700, 2, 0,  '초콜릿 퍼지와 오레오 쿠키까지! 달달함이 두 배로!');

insert into tbl_item values(item_dessert_seq.nextval, 4, '스트로베리콘','5_스트로베리콘.png', 1200, 2, 0,  '신선한 1등급 원유와 딸기과즙으로 만든 아이스크림');

insert into tbl_item values(item_dessert_seq.nextval, 4, '아이스크림콘','6_아이스크림콘.png', 1100, 2, 0,  '신선한 우유로 만든 부드러운 아이스크림 콘');

insert into tbl_item values(item_dessert_seq.nextval, 4, '바닐라 선데이 아이스크림','7_바닐라선데이아이스크림.png',  2800, 2, 0,  '신선한 우유로 만든 부드럽고 달콤한 아이스크림');

insert into tbl_item values(item_dessert_seq.nextval, 4, '초코 선데이 아이스크림','8_초코선데이아이스크림.png',  2800, 2, 0,  '신선한 우유로 만든 아이스크림에 달콤한 초콜렛 시럽이 입안 가득.');

insert into tbl_item values(item_dessert_seq.nextval, 4, '딸기 선데이 아이스크림','9_딸기선데이아이스크림.png',  2800, 2, 0,  '신선한 우유와 딸기가 아이스크림으로 만났다!');

insert into tbl_item values(item_dessert_seq.nextval, 4, '오레오 아포가토','10_오레오아포가토.png',  3200, 2, 0,  '진한 에스프레소에 바닐라 아이스크림으로 달콤 쌉쌀하게, 오레오 쿠키로 바삭함까지!');


commit;


-- 디테일

 desc tbl_item_detail
   
  select *
  from tbl_item_detail 
  order by PK_FK_ITEM_NO
   
-- 사이드 디테일   


 create sequence item_side_detail_seq  
   start with 300                 -- 첫번째 출발은 300부터 한다. 
   increment by 1               -- 증가치는 1이다. 즉 1씩 증가 
   minvalue 300                   -- 최소값이 300이다                                 
   maxvalue 399                   -- 최대값이 399이다   
   nocycle                        -- 반복한다.                      
   nocache;  
   
   
   
insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens,coa) values(item_side_detail_seq.nextval,'슈림프 스낵랩', 114, 287, 7, 6, 3, 579, '난류,대두,밀,토마토,새우,조개', '새우스틱:태국산'  )

--fk_item_no, weight_g, weight_ml, calories, carbo, protein, fat, sodium, caffeine, allergens, coa



insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_side_detail_seq.nextval,'코울슬로', 100, 179, 18, 1, 1, 307, '난류,대두,조개,굴'  )
                      
insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens, coa) 
                      values(item_side_detail_seq.nextval,'상하이 치킨 스낵랩', 112, 303, 3, 12, 3.7, 812, '난류,대두,밀,돼지고기,닭고기', '닭고기:국내산, 돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)'  )                      

commit;

insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_side_detail_seq.nextval,'골든 모짜렐라 치즈스틱', 94, 330, 2, 16, 8.4, 577, '우유,대두,밀')                  

commit;

insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_side_detail_seq.nextval,'후렌치 후라이', 114, 324, 0, 5, 1.0, 282, '대두')
                      
commit;

insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens,coa) 
                      values(item_side_detail_seq.nextval,'맥너겟®', 64, 163, 0, 10, 1.1, 369, '대두,밀,닭고기','닭고기:국내산')
                      
commit;

insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens,coa) 
                      values(item_side_detail_seq.nextval,'맥스파이시®치킨 텐더', 79, 197, 0, 15, 0.9, 744, '대두,밀,닭고기','닭고기:국내산')

insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_side_detail_seq.nextval,'해쉬 브라운', 57, 162, 0, 2, 0.8, 345, '대두')

commit;


------------------------------------------------

-----디저트 디테일


select *
  from tbl_item_detail 
  order by PK_FK_ITEM_NO
  

--------디저트 디테일 시퀀스
 create sequence item_dessert_detail_seq  
   start with 400                 -- 첫번째 출발은 400부터 한다. 
   increment by 1               -- 증가치는 1이다. 즉 1씩 증가 
   minvalue 400                   -- 최소값이 400이다                                 
   maxvalue 499                   -- 최대값이 499이다   
   nocycle                        -- 반복한다.                      
   nocache;  

  
  
  insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'베리 스트로베리 맥플러리', 168, 325, 38, 5, 5.4, 228, '우유,대두,밀')

commit;


insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'오레오 맥플러리', 168, 332, 36, 6, 5.3, 179, '우유,대두,밀')
                      
commit;


insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'딸기 오레오 맥플러리', 174, 304, 38, 5, 4.6, 138, '우유,대두,밀')
                      
                      commit;
                      
                      
insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'초코 오레오 맥플러리', 189, 388, 45, 7, 8.3, 218, '우유,대두,밀') 
                      
                                            commit;

insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'스트로베리콘', 90, 140, 16, 3, 2.5, 84, '우유,밀') 
                      
                                                                  commit;
                                                                  
insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'아이스크림콘', 90, 144, 15, 3, 2.5, 55, '우유,밀') 
  commit;


insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'바닐라 선데이 아이스크림', 140, 201, 24, 4, 3.9, 83, '우유') 
  commit;
  
  
  insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'초코 선데이 아이스크림', 175, 323, 39, 6, 7.6, 170, '우유') 
  commit;
  
  
    insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_g,calories,carbo,protein,fat,sodium,allergens) 
                      values(item_dessert_detail_seq.nextval,'딸기 선데이 아이스크림', 179, 277, 40, 4, 3.9, 96, '우유') 
  commit;
  
  
  
      insert into tbl_item_detail (PK_FK_ITEM_NO,item_name,weight_ml,calories,carbo,protein,fat,sodium,caffeine ,allergens) 
                      values(item_dessert_detail_seq.nextval,'오레오 아포가토', 181, 234, 25, 5, 3.8, 114,117.53, '우유,대두,밀') 
  commit;
  
  
  select *
  from tbl_item_detail 
  

   
      
 
select decode(nvl(weight_g,-99), -99, '-', weight_g) AS weight_g,
        decode(nvl(weight_ml,-99), -99, '-', weight_ml) AS weight_ml,
        decode(nvl(calories,-99), -99, '-', calories) AS calories,
        decode(nvl(carbo,-99), -99, '-', carbo) AS carbo,
        decode(nvl(protein,-99), -99, '-', protein) AS protein,
        decode(nvl(fat,-99), -99, '-', fat) AS fat,
        decode(nvl(sodium,-99), -99, '-', sodium) AS sodium,
        decode(nvl(caffeine,-99), -99, '-', caffeine) AS caffeine,
        nvl2(allergens,allergens,'-') AS allergens ,
        nvl2(coa,coa,'-') AS coa
from tbl_item_detail

 
---------------------------------------------------------------------------------------- 
 
 
  select count(*)
    from tbl_item
    where item_no = 200;

    select count(fk_category_no)
    from tbl_item
    where fk_category_no in( select fk_category_no
                             from tbl_item
                             where )
    

   select count(fk_category_no)
   from (
        select *
        from tbl_item
        where item_no = 200
   )
   
select *
from tbl_category

select *
        from tbl_item
   

 select count(fk_category_no)
from tbl_category A join tbl_item B
on A.category_id = B.fk_category_no
where fk_category_no in (
select fk_category_no
from tbl_item
where item_no = 305
)
 
 
-----------------------------------------------------------------------------------

select *
from tbl_item
where fk_category_no = 3
order by item_no asc;

-- 사이드 업데이트

update tbl_item set item_no = 307, item_image = '8_슈림프스낵랩.png'
where item_name = '슈림프 스낵랩'

commit;

update tbl_item set item_no = 306, item_image = '7_코울슬로.png'
where item_name = '코울슬로'


commit;


update tbl_item set item_no = 305, item_image = '6_상하이치킨스낵랩.png'
where item_name = '상하이 치킨 스낵랩'

commit;



update tbl_item set item_no = 304, item_image = '5_골든모짜렐라치즈스틱.png'
where item_name = '골든 모짜렐라 치즈스틱'

commit;

update tbl_item set item_no = 303, item_image = '4_후렌치후라이.png'
where item_name = '후렌치 후라이'

commit;

update tbl_item set item_no = 302, item_image = '3_맥너겟.png'
where item_name = '맥너겟®'
  
commit


update tbl_item set item_no = 301, item_image = '2_맥스파이시치킨텐더.png'
where item_name = '맥스파이시®치킨 텐더'

commit;


update tbl_item set item_no = 300, item_image = '1_해쉬브라운.png'
where item_name = '해쉬 브라운'

commit;

----------------------------------------------

-- 디저트 업데이트

select *
from tbl_item
where fk_category_no = 4
order by item_no asc;


update tbl_item set item_no = 409, item_image = '10_베리스트로베리맥플러리.png'
where item_name = '베리 스트로베리 맥플러리'

commit;

update tbl_item set item_no = 408, item_image = '9_오레오맥플러리.png'
where item_name = '오레오 맥플러리'

commit;

update tbl_item set item_no = 407, item_image = '8_딸기오레오맥플러리.png'
where item_name = '딸기 오레오 맥플러리'

commit;

update tbl_item set item_no = 406, item_image = '7_초코오레오맥플러리.png'
where item_name = '초코 오레오 맥플러리'

commit;

update tbl_item set item_no = 405, item_image = '6_스트로베리콘.png'
where item_name = '스트로베리콘'

commit;

update tbl_item set item_no = 404, item_image = '5_아이스크림콘.png'
where item_name = '아이스크림콘'

commit;

update tbl_item set item_no = 403, item_image = '4_바닐라선데이아이스크림.png'
where item_name = '바닐라 선데이 아이스크림'

commit;

update tbl_item set item_no = 402, item_image = '3_초코선데이아이스크림.png'
where item_name = '초코 선데이 아이스크림'

commit;

update tbl_item set item_no = 401, item_image = '2_딸기선데이아이스크림.png'
where item_name = '딸기 선데이 아이스크림'

commit;

update tbl_item set item_no = 400, item_image = '1_오레오아포가토.png'
where item_name = '오레오 아포가토'

commit;

--------------------------------------------------------------------------------------



-- 사이드 디테일 업데이트

select *
from tbl_item_detail
where pk_fk_item_no in (
select item_no
from tbl_item
where fk_category_no = 3 
)
order by pk_fk_item_no



update tbl_item_detail set pk_fk_item_no = 307
where item_name = '슈림프 스낵랩'

commit;

update tbl_item_detail set pk_fk_item_no = 306
where item_name = '코울슬로'


commit;


update tbl_item_detail set pk_fk_item_no = 305
where item_name = '상하이 치킨 스낵랩'

commit;



update tbl_item_detail set pk_fk_item_no = 304
where item_name = '골든 모짜렐라 치즈스틱'

commit;

update tbl_item_detail set pk_fk_item_no = 303
where item_name = '후렌치 후라이'

commit;

update tbl_item_detail set pk_fk_item_no = 302
where item_name = '맥너겟®'
  
commit


update tbl_item_detail set pk_fk_item_no = 301
where item_name = '맥스파이시®치킨 텐더'

commit;


update tbl_item_detail set pk_fk_item_no = 300
where item_name = '해쉬 브라운'

commit;



--------------------------------------------------------------

-- 디저트 디테일 업데이트


select *
from tbl_item_detail
where pk_fk_item_no in (
select item_no
from tbl_item
where fk_category_no = 4
)
order by pk_fk_item_no



update tbl_item_detail set pk_fk_item_no = 409
where item_name = '베리 스트로베리 맥플러리'

commit;

update tbl_item_detail set pk_fk_item_no = 408
where item_name = '오레오 맥플러리'

commit;

update tbl_item_detail set pk_fk_item_no = 407
where item_name = '딸기 오레오 맥플러리'

commit;

update tbl_item_detail set pk_fk_item_no = 406
where item_name = '초코 오레오 맥플러리'

commit;

update tbl_item_detail set pk_fk_item_no = 405
where item_name = '스트로베리콘'

commit;

update tbl_item_detail set pk_fk_item_no = 404
where item_name = '아이스크림콘'

commit;

update tbl_item_detail set pk_fk_item_no = 403
where item_name = '바닐라 선데이 아이스크림'

commit;

update tbl_item_detail set pk_fk_item_no = 402
where item_name = '초코 선데이 아이스크림'

commit;

update tbl_item_detail set pk_fk_item_no = 401
where item_name = '딸기 선데이 아이스크림'

commit;

update tbl_item_detail set pk_fk_item_no = 400
where item_name = '오레오 아포가토'

commit;


----------------------------------------------------------------------------------------

-- 추가이미지 작업. 사이드

select *
from tbl_item
order by item_no asc;

select *
from tbl_image_add
order by fk_item_no

desc tbl_image_add

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 300, '1_해쉬브라운_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 301, '2_맥스파이시치킨텐더_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 302, '3_맥너겟_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 300, '1_해쉬브라운_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 301, '2_맥스파이시치킨텐더_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 302, '3_맥너겟_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 303, '4_후렌치후라이_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 303, '4_후렌치후라이_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 304, '5_골든모짜렐라치즈스틱_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 304, '5_골든모짜렐라치즈스틱_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 305, '6_상하이치킨스낵랩_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 305, '6_상하이치킨스낵랩_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 306, '7_코울슬로_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 306, '7_코울슬로_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 307, '8_슈림프스낵랩_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 307, '8_슈림프스낵랩_small.png');

commit;



---------------------------------------------------------------------------------------

-- 추가이미지 작업. 디저트


select *
from tbl_item
where fk_category_no = 4
order by item_no asc;

select *
from tbl_image_add
order by fk_item_no

desc tbl_image_add

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 400, '1_오레오아포가토_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 400, '1_오레오아포가토_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 401, '2_딸기선데이아이스크림_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 401, '2_딸기선데이아이스크림_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 402, '3_초코선데이아이스크림_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 402, '3_초코선데이아이스크림_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 403, '4_바닐라선데이아이스크림_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 403, '4_바닐라선데이아이스크림_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 404, '5_아이스크림콘_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 404, '5_아이스크림콘_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 405, '6_스트로베리콘_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 405, '6_스트로베리콘_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 406, '7_초코오레오맥플러리_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 406, '7_초코오레오맥플러리_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 407, '8_딸기오레오맥플러리_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 407, '8_딸기오레오맥플러리_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 408, '9_오레오맥플러리_small.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 408, '9_오레오맥플러리_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 409, '10_베리스트로베리맥플러리_nbg.png');

commit;

insert into TBL_IMAGE_ADD values(seqImgfileno.nextval, 409, '10_베리스트로베리맥플러리_small.png');

commit;



select *
from tbl_item





select item_no,  lag_item_no, lead_item_no , lag_item_image , lead_item_image         
    from
    (
        select item_no, item_name,
               LAG(item_no) over(order by item_no) AS lag_item_no,
               LEAD(item_no) over(order by item_no) AS lead_item_no,
               LAG(item_image) over(order by item_no) AS lag_item_image,
               LEAD(item_image) over(order by item_no) AS lead_item_image
               
        from tbl_item
        order by item_no
    )V
    where item_no = 110
    
    
    
    
      select lag_item_name, lag_item_no, lag_item_image         
    from
    (
        select item_no, item_name,
               LAG(item_no) over(order by item_no desc) AS lag_item_no,
               LAG(item_name) over(order by item_no desc) AS lag_item_name,
               LAG(item_image) over(order by item_no desc) AS lag_item_image
        from tbl_item
        order by item_no desc
    )V
    where item_no = 118 and fk_category_no in (
        
        select fk_category_no
        from tbl_item
        where item_no = 118;
    )
    
    
    
    
select *
from tbl_order
order by odr_no desc;
 
 
 select *
 from tbl_item
 order by item_no



    select lead_item_name, lead_item_no, lead_item_image         
    from
    (
        select item_no, item_name,
               Lead(item_no) over(order by item_no desc) AS lead_item_no,
               Lead(item_name) over(order by item_no desc) AS lead_item_name,
               Lead(item_image) over(order by item_no desc) AS lead_item_image
        from tbl_item
        order by item_no desc
    )V
    where item_no = 101 
    
    
    
         select item_no, item_name,
               LAG(item_no) over(order by item_no desc) AS lag_item_no,
               LAG(item_name) over(order by item_no desc) AS lag_item_name,
               LAG(item_image) over(order by item_no desc) AS lag_item_image
        from tbl_item
        where item_no between 100 and 199
        order by item_no desc
        
        
        
         select lag_item_name, lag_item_no, lag_item_image         
    from
    (
        select item_no, item_name,
               LAG(item_no) over(order by item_no desc) AS lag_item_no,
               LAG(item_name) over(order by item_no desc) AS lag_item_name,
               LAG(item_image) over(order by item_no desc) AS lag_item_image
        from tbl_item
        where item_no between 100 and 199
        order by item_no desc
    )V
    where item_no = 119;
    
    
    select *
    from tbl_order
    order by odr_date desc;
    
    select*
    from tbl_login_history
    
 
 


update tbl_member set registerday = add_months(registerday, -5)
                    , last_pwd_change_date = add_months(last_pwd_change_date, -4)
where userid = 'bangasang23';


 update tbl_login_history set login_date = add_months(login_date, -20)
where fk_userid = 'bangasang23';

commit;

delete from tbl_login_history
where fk_userid = 'bangasang23';

commit;

select *
from tbl_member

select*
from tbl_order

delete from tbl_member
where userid = 'bangasang23';

delete from tbl_order_list
where fk_odr_no = 173;

delete from tbl_order
where odr_no = 173;


select *
from tbl_item
order by item_no desc;


commit


select *
from USER_SEQUENCES


select *
from tbl_item_detail
order by pk_fk_item_no desc

select *
from tbl_item
order by item_no desc

select * from tab
