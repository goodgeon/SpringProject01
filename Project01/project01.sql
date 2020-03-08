create table users (
    usernum NUMBER PRIMARY KEY,
    username varchar(10) UNIQUE NOT NULL,
    password varchar(20) NOT NULL
);
drop table users;

create sequence user_seq;


create table reviews(
    reviewNum NUMBER PRIMARY KEY,
    username varchar2(10) NOT NULL REFERENCES users(username),
    moviename varchar2(100) NOT NULL,
    contents varchar2(1000) NOT NULL,
    movielink varchar2(100),
    inputdate date default sysdate
);

drop table reviews;
create sequence review_seq;
