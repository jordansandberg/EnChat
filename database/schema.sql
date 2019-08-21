drop table if exists chat_room;

create table chat_room(
    chat_room_id serial primary key,
    pword varchar(32) not null,
    chat_room_name varchar(32) not null
);

drop table if exists user;

create table user(
    serial usr_id primary key,
    pword varchar(32) not null, 
    usr_name varchar(32) not null
);

drop table if exists whitelist(
    whitelist_id serial primary key
);

drop table if exists ownse ;

create table owns(
    chat_room_id serial references chat_room(chat_room_id),
    usr_ir serial references user(usr_id),
    primary key (chat_room_id, usr_id)
);

drop table if exists sends_message;

create table sends_message(
    chat_room_id serial references chat_room(chat_room_id),
    usr_id serial references user(usr_id),
    txt varchar(250) not null,
    time_stamp datetime
)

drop table if exists has_a;

create table has_a(
    whitelist_id serial references whitelist(whitelist_id),
    chat_room_id serial references chat_room(chat_room_id)
);

drop table if exists is_on;

create table is_on(
    whitelist_id references whitelist(whitelist_id),
    usr_id references user(usr_id)
);

