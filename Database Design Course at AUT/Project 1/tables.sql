-- Table Users: 
create table Users(
	user_name varchar(20),
	f_name varchar(20),
	l_name varchar(20),
	password varchar(128),
	birth_date date,
	join_date date,
	bio varchar(64),
	primary key (user_name)
);


-- Table Ava: 
create table Ava(
	ava_id int auto_increment,
	ava_content varchar(256),
	user_name varchar(20),
    comment_id int,
	a_send_date timestamp,
    primary key(ava_id),
	foreign key (user_name) references Users(user_name),
    foreign key (comment_id) references Ava(ava_id)
);


-- Table Message:
create table Message(
	message_id int auto_increment,
	message_content varchar(256),
	sender_id varchar(20),
	receiver_id varchar(20),
	ava_id int,
	m_send_date timestamp,
    primary key(message_id),
	foreign key (sender_id) references Users(user_name),
	foreign key (receiver_id) references Users(user_name),
	foreign key (ava_id) references Ava(ava_id)
);


-- Table Hashtag:
-- constraint hashtag_type check (hashtag_text like '#_____'),
create table Hashtag(
	hashtag_id int auto_increment,
	hashtag_text char(6),
    ava_id int,
    primary key(hashtag_id, ava_id),
	foreign key (ava_id) references Ava(ava_id)
);


-- -- Table  Comment: -> No need! (included in the Ava table)
-- create table Comments(
-- 	comment_id int auto_increment,
--     user_name varchar(20),
--     ava_id int,
-- 	prev_com_id int,
--     primary key(comment_id),
--     foreign key (prev_com_id) references Comments(comment_id),
--     foreign key (ava_id) references Ava(ava_id),
--     foreign key (user_name) references Users(user_name)
-- );


-- Table Likes:
create table Likes(
	user_name varchar(20),  
	ava_id int, 
    primary key(user_name, ava_id),
    foreign key (user_name) references Users(user_name),
    foreign key (ava_id) references Ava(ava_id)
);


-- Table Logins:
create table Logins(
	user_name varchar(20),
    login_date timestamp,
    primary key(user_name, login_date),
    foreign key (user_name) references Users(user_name)
);


-- Table Follow:
create table Follow(
    followed_id varchar(20),
	follower_id varchar(20),
    primary key(follower_id, followed_id),
    foreign key (follower_id) references Users(user_name),
    foreign key (followed_id) references Users(user_name)
);


-- Table Blocks:
create table Blocks(
	blocker_id varchar(20),
    blocked_id varchar(20),
    primary key (blocker_id, blocked_id),
    foreign key (blocker_id) references Users(user_name),
    foreign key (blocked_id) references Users(user_name)
);
