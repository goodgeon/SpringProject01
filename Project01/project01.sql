create table users (
    usernum NUMBER PRIMARY KEY,
    username char(10) UNIQUE NOT NULL,
    password char(20) NOT NULL
);

create sequence user_seq;