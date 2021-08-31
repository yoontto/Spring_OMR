create table customer(
    id      number  constraint customer_id_pk primary key,
    name    varchar2(30) not null,
    gender  varchar2(3) default '남',
    email   varchar2(100),
    phone   varchar2(15)
);

--sequence 사용해서 id값을 자동으로 증가

create sequence customer_seq
 start with 1
 INCREMENT BY 1;

--drop sequence
drop sequence customer_seq;


INSERT INTO customer (id, name, email)
values (customer_seq.nextval, '홍길동', 'hong@naver.com' );


--trigger
create or replace TRIGGER customer_trig
    before insert on customer 
    for each row
begin
    select customer_seq.nextval into:new.id from dual;
end;


SELECT *
FROM customer;

insert into customer (name, email, phone)
values ('영수', 'ys@naver.com', '000-0000-000');

insert into customer (name, gender, email, phone)
values ('노대돈', '남', 'dd@gmail.com', '000-0100-000');

select * from customer where id = 1;


commit;

--crud를 select, insert, update, delete 
--
































