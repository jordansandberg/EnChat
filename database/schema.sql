drop table if exists chat_room cascade;

create table chat_room(
    chat_room_id serial primary key,
    pword varchar(32) not null,
    chat_room_name varchar(32) not null unique
);

drop table if exists users cascade;

create table users(
    usr_id serial primary key,
    pword varchar(32) not null, 
    usr_name varchar(32) not null unique
);

drop table if exists whitelist cascade;

create table whitelist(
    whitelist_id serial primary key
);

drop table if exists owns;

create table owns(
    chat_room_id serial references chat_room(chat_room_id),
    usr_id serial references users(usr_id),
    primary key (chat_room_id, usr_id)
);

drop table if exists sends_message;

create table sends_message(
    chat_room_id serial references chat_room(chat_room_id),
    usr_id serial references users(usr_id),
    txt varchar(250) not null,
    time_stamp date,
    primary key (chat_room_id, usr_id)
);

drop table if exists has_a;

create table has_a(
    whitelist_id serial references whitelist(whitelist_id),
    chat_room_id serial references chat_room(chat_room_id),
    primary key (whitelist_id, chat_room_id)
);

drop table if exists is_on;

create table is_on(
    whitelist_id serial references whitelist(whitelist_id),
    usr_id serial references users(usr_id),
    primary key (whitelist_id, usr_id)
);

