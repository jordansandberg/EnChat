-- create user

-- happy path
insert into users 
values (default, '223', 'brad');

with usr_id as(
    insert into users
    values (default, '123', 'jordan') returning usr_id
),
chat_room_id as(
    insert into chat_room
    values (default, 'chat1', 'brad and jordans chat room') returning chat_room_id  
) 
insert into owns
select c.chat_room_id, u.usr_id from usr_id as u, chat_room_id as c;

with whitelist_id as (
    insert into whitelist values (default) returning whitelist_id
) 
insert into has_a
select w.whitelist_id, chat_room_id
from whitelist_id as w, chat_room
where chat_room_name = 'brad and jordans chat room';

insert into is_on
values (1,1);

-- insert duplicates

insert into chat_room
values (default, 'chat1', 'brad and jordans chat room');
