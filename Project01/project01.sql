create table users (
    usernum NUMBER PRIMARY KEY,
    username varchar(10) UNIQUE NOT NULL,
    password varchar(20) NOT NULL
);

create sequence user_seq;
