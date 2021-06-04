-- Insert into table Users:
insert into Users values ('Tina3', 'Tina', 'Gholamy',  MD5('123456a'), '1998-09-09', '2020-02-02', 'Hi! This is Tina.');
insert into Users values ('Sherlock3', 'Sherlock', 'Holms', MD5('78910i'), '1990-07-16', '2014-03-02', 'Hi! This is Sherlock.');
insert into Users values ('Shogo3', 'Shogo', 'Makishima', MD5('36789yu'), '1995-05-03', '2016-08-04', 'Hi! This is Shogo.');
insert into Users values ('L3', 'L', 'Lawliet', MD5('socio33path'), '1996-03-05', '2021-01-03', 'Hi! This is L.');
insert into Users values ('John3', 'John', 'Glenn', MD5('space45Nasa'), '1921-07-18', '2000-10-11', 'Hi! This is John.');


-- Insert into table Ava:
insert into Ava(ava_content, user_name, a_send_date) values ('I have studied at AUT and UWO.', 'Tina3', '2020-03-03');
insert into Ava(ava_content, user_name, a_send_date) values ('I have solved another case ;P', 'Sherlock3', '2016-04-08');
insert into Ava(ava_content, user_name, a_send_date) values ('Tina will accompany me in solving my next crime case!', 'Sherlock3', '2021-03-08');
insert into Ava(ava_content, user_name, a_send_date) values ('I do not abide to the current conventions.', 'Shogo3', '2019-08-05');
insert into Ava(ava_content, user_name, a_send_date) values ('The Sibyl System is hopeless.', 'Shogo3', '2020-01-01');
insert into Ava(ava_content, user_name, a_send_date) values ('I love puzzles. Send me your recoms!', 'L3', '2021-04-03');
insert into Ava(ava_content, user_name, a_send_date) values ('Being an astronaut is cool!', 'John3', '2001-11-10');

-- Insert into table Message:
insert into Message(message_content, sender_id, receiver_id, m_send_date) values ('Hi Tina. Will you accompany me to solve my next crime case?', 'Sherlock3', 'Tina3', '2021-03-07'); 
insert into Message(message_content, sender_id, receiver_id, m_send_date) values ('OMG! Yes!', 'Tina3', 'Sherlock3', '2021-03-07'); 
insert into Message(message_content, sender_id, receiver_id, m_send_date) values ('Hi Mr. Glenn! I am a big fan of you!', 'Tina3', 'John3', '2010-10-10'); 
insert into Message(sender_id, receiver_id, ava_id, m_send_date) values ('L3', 'Sherlock3', 4, '2019-08-06');
insert into Message(message_content, sender_id, receiver_id, m_send_date) values ('Hey Sherlock. Check out my previous message. I have a feeling that Shogo is up to something...', 'L3', 'Sherlock3', '2019-08-06'); 


-- Insert into table Hashtag:
insert into Hashtag(hashtag_text, ava_id) values('#study', 1);
insert into Hashtag(hashtag_text, ava_id) values('#educa', 1);
insert into Hashtag(hashtag_text, ava_id) values('#crime', 2);
insert into Hashtag(hashtag_text, ava_id) values('#crime', 3);
insert into Hashtag(hashtag_text, ava_id) values('#socio', 4);
insert into Hashtag(hashtag_text, ava_id) values('#sibyl', 4);
insert into Hashtag(hashtag_text, ava_id) values('#sibyl', 5);
insert into Hashtag(hashtag_text, ava_id) values('#rebel', 5);
insert into Hashtag(hashtag_text, ava_id) values('#games', 6);
insert into Hashtag(hashtag_text, ava_id) values('#puzle', 6);
insert into Hashtag(hashtag_text, ava_id) values('#Nasa_', 7);
insert into Hashtag(hashtag_text, ava_id) values('#astro', 7);


-- -- Insert into table Logins:
-- insert into Logins(user_name, login_date) values ('Tina3', (select CURRENT_TIMESTAMP()));
-- insert into Logins(user_name, login_date) values ('Sherlock3', (select CURRENT_TIMESTAMP()));
-- insert into Logins(user_name, login_date) values ('Shogo3', (select CURRENT_TIMESTAMP()));
-- insert into Logins(user_name, login_date) values ('L3', (select CURRENT_TIMESTAMP()));
-- insert into Logins(user_name, login_date) values ('John3', (select CURRENT_TIMESTAMP()));


-- .....................................................................................--
-- Log in to an account: (ورود به حساب کاربری)
set @user_name = 'Tina3';
set @pass = MD5('123456a');

insert into Logins(user_name, login_date) 
select @user_name, CURRENT_TIMESTAMP() -- ,'Welcome To Canary :)'
from Users
where Users.user_name = @user_name and Users.password = @pass;

select * from Logins;

-- .....................................................................................--
-- Check for users log ordered descendingly: (بررسی ورودی های کاربر)
select * 
from Logins
order by login_date DESC;

-- .....................................................................................--
-- Sending a new Ava: (ارسال آوا)
-- basically, I did it above at the beggining of the code where I inserted data to table Ava.
set @user_name =  'Tina3';
set @ava_content = 'Read The Author by Tj Blake!';
set @comment_id = null;

insert into Ava(ava_content, user_name, comment_id, a_send_date) values (@ava_content, @user_name, @comment_id, CURRENT_TIMESTAMP());


-- .....................................................................................--
-- Access the Avas sent by a specific user: (دریافت آواهای شخصی)
set @u =  'sherlock3';
select ava_id, ava_content
from Ava
where user_name = @u;
 
 
-- .....................................................................................--
-- Insert into table Follow: (دنبال کردن)
-- Solution 1: -> creating a "Temp_Follow" table. If executed twice, successfully gives an execution error.
-- set @user_temp = 'Shogo3';
-- set @you = 'Sherlock3';

-- create table Temp_Follow(
--     temp_followed_id varchar(20),
-- 	temp_follower_id varchar(20),
--     primary key(temp_follower_id, temp_followed_id),
--     foreign key (temp_follower_id) references Users(user_name),
--     foreign key (temp_followed_id) references Users(user_name)
-- );
-- insert into Temp_Follow(temp_followed_id, temp_follower_id) values('Sherlock3', 'Shogo3');

-- insert into Follow(followed_id, follower_id)
-- select *
-- from Temp_Follow
-- where @you not in (select follower_id
-- 			       from Follow
-- 			       where followed_id = @user_temp);
-- Solution 2: -> works because both (follower_id, followed_id) are primary keys and cannot be repeted.
-- insert into Follow(followed_id, follower_id) values('Sherlock3', 'John3'); 
-- insert into Follow(followed_id, follower_id) values('Sherlock3', 'John3'); 
-- Solution 3: -> This is not correct too...
-- set @followed = 'Sherlock3';
-- set @follower = 'John3';
-- if @followed not in (select followed_id from Follow) and follower not in (select follower_id from Follow)
-- insert into Follow(followed_id, follower_id) values(@followed, @follower);
-- Solution 4: -> tsql or procedures
set @u1 = 'Sherlock3';
set @u2 = 'Tina3';

insert into Follow(followed_id, follower_id)
select u1.user_name, u2.user_name
from Users u1, Users u2
where u1.user_name = @u1 and u2.user_name = @u2 
and @u2 not in (select follower_id
				from Follow
				where followed_id = @u1);
                
                
-- .....................................................................................--
-- Delete from table Follow: (توقف دنبال کردن)
insert into Follow(followed_id, follower_id) values('Shogo3', 'John3'); -- example
delete from Follow
where followed_id = 'Shogo3' and follower_id = 'John3';


-- .....................................................................................--
-- Insert into table Blocks: (مسدود کردن)
-- Solution 1:
-- set @user_temp = 'Shogo3';
-- set @you = 'John3';

-- create table Temp_Blocks(
-- 	temp_blocker_id varchar(20),
--     temp_blocked_id varchar(20),
--     primary key (temp_blocker_id, temp_blocked_id),
--     foreign key (temp_blocker_id) references Users(user_name),
--     foreign key (temp_blocked_id) references Users(user_name)
-- );
-- insert into Temp_Blocks(temp_blocker_id, temp_blocked_id) values ('John3', 'Shogo3');

-- insert into Blocks(blocker_id, blocked_id)
-- select * 
-- from Temp_Blocks
-- where @user_temp not in (select blocked_id
-- 				         from Blocks
-- 						 where blocker_id = @you);
-- -- Solution 2:
-- insert into Blocks(blocker_id, blocked_id) values('John3', 'Shogo3'); 
-- insert into Blocks(followed_id, follower_id) values('John3', 'Shogo3'); 
set @u1 = 'John3';
set @u2 = 'L3';

insert into Blocks(blocker_id, blocked_id)
select u1.user_name, u2.user_name
from Users u1, Users u2
where u1.user_name = @u1 and u2.user_name = @u2
and @u2 not in (select blocked_id
				from Blocks
				where blocker_id = @u1);
-- We can also repeat the previous section so that the users are also deleted from the Follow table.


-- .....................................................................................--
-- Delete from table Blocks: (آزادسازی)
insert into Blocks(blocker_id, blocked_id) values('John3', 'L3'); -- example
delete from Blocks
where blocker_id = 'John3' and blocked_id = 'L3';


-- .....................................................................................--
-- Check a follower's ava activity: (دریافت فعالیت دنبال شوندگان)
insert into Follow(followed_id, follower_id) values('Shogo3', 'Sherlock3'); -- example 1
insert into Blocks(blocker_id, blocked_id) values('Shogo3', 'Sherlock3'); -- example 2

set @you = 'Sherlock3';
set @user_temp = 'Shogo3';

select distinct(Ava.ava_id), Ava.ava_content
from Ava, Follow, Blocks
where user_name = followed_id and followed_id = @user_temp and follower_id = @you 
and @you not in (select blocked_id
				 from Blocks
				 where blocker_id = @user_temp)
order by a_send_date DESC;


-- .....................................................................................--
-- Check a specific user's ava activity: (دریافت فعالیت کاربران)
set @you = 'Sherlock3';
set @user_temp = 'Shogo3';

select distinct(ava_id), ava_content
from Ava, Blocks
where Ava.user_name = @user_temp
and @you not in (select blocked_id
				 from Blocks
				 where blocker_id = @user_temp);


-- .....................................................................................--
-- Commenting on a specific user' ava/comment: (نظر دادن)
-- create table Temp_Ava(
-- 	temp_ava_id int auto_increment,
-- 	temp_ava_content varchar(256),
-- 	temp_user_name varchar(20),
--     temp_comment_id int,
-- 	temp_a_send_date timestamp,
--     primary key(temp_ava_id),
-- 	foreign key (temp_user_name) references Users(user_name),
--     foreign key (temp_comment_id) references Ava(ava_id)
-- );
-- insert into Temp_Ava(temp_ava_content, temp_user_name, temp_comment_id, temp_a_send_date) values ('Congrats on your new role in the Mercury mission, John!', 'L3', 7, '2020-04-09');
-- insert into Temp_Ava(temp_ava_content, temp_user_name, temp_comment_id, temp_a_send_date) values ('Awe you and your little worlds.', 'Shogo3', 7, '2020-06-10'); -- example 3 for the next query! :D
-- insert into Temp_Ava(temp_ava_content, temp_user_name, temp_comment_id, temp_a_send_date) values ('Huh, I did not know you are into space L..', 'Sherlock3', 7, '2020-06-09'); -- example 3 for the next query! :D

-- set @temp_user = 'John3'; -- 'John3';
-- set @you = 'L3'; -- 'L3';

-- insert into Ava(ava_content, user_name, comment_id, a_send_date) 
-- select temp_ava_content, temp_user_name, temp_comment_id, temp_a_send_date
-- from Temp_Ava, Blocks
-- where @you not in (select blocked_id
-- 			       from Blocks
-- 			       where blocker_id = @user_temp);
set @u1 = 'Tina3';
set @u2 = 'L3';
set @new_comment = 'Hey L, how about scrabble?';

insert into Ava(ava_content, user_name, comment_id, a_send_date)
select @new_comment, @u1, Ava.ava_id, CURRENT_TIMESTAMP()
from Ava
where user_name = @u2
and @u1 not in (select blocked_id
				 from Blocks
				 where blocker_id = @u2);


-- .....................................................................................--
-- Getting the comments: (دریافت نظرات آوا):
set @u1 = 'Shogo3';

select * 
from Ava
where comment_id in (select ava_id
					 from Ava
                     where user_name = @u1)
and @u1 not in (select blocked_id
				from Blocks, Ava
				where blocker_id = user_name and comment_id in (select ava_id
															    from Ava
															    where user_name = @u1));
-- or:
-- and @u1 not in (select blocked_id
-- 				from Blocks
-- 				where blocker_id in (select user_name
-- 									from Ava
--                                     where comment_id in (select ava_id
-- 														from Ava
-- 														where user_name = @u1)));
                                               
                                               
-- .....................................................................................--
-- Insert into table Hashtag: (اضافه کردن علامت ویژه به آوا)
set @u = 'Tina3';
set @tag = '#gradd';
set @ava_id = 1;

insert into Hashtag(hashtag_text, ava_id) values(@tag, @ava_id);

select * from Hashtag;


-- .....................................................................................--
-- Getting the Avas containing a particular hashtag: (دریافت آواهای یک علامت ویژه)
-- select 
-- from Ava
-- inner join Hashtag
-- where 
set @tag = '#astro'; 
set @you = 'Tina3'; -- example 2 (not blocked)
set @you = 'L3'; -- example 3 (blocked)

select distinct(Ava.ava_id), ava_content
from Hashtag, Ava
where hashtag_text = @tag and Ava.ava_id = Hashtag.ava_id
and hashtag_text not in (select blocked_id
				         from Blocks, Ava, Hashtag
				         where blocker_id = user_name and Ava.ava_id = Hashtag.ava_id and hashtag_text = @tag)
order by a_send_date DESC;


-- .....................................................................................--
-- Liking an Ava: (پسندیدن آوا)
set @you = 'Tina3'; -- example 1
set @ava_id = 3; -- example 1
set @you = 'Shogo3'; -- example 2
set @ava_id = 7; -- example 2 

insert into Likes(user_name, ava_id)
select Users.user_name, Ava.ava_id
from Users, Ava
where Users.user_name = @you and Ava.ava_id = @ava_id 
and Users.user_name not in (select blocked_id
				            from Blocks, Ava
							where blocker_id = Ava.user_name and Ava.ava_id = @ava_id);


-- .....................................................................................--
-- Getting the number of likes: (دریافت تعداد پسندها)
set @u = 'Tina3'; -- example 1
set @u = 'John3'; -- example 2
set @ava_id = 3;

select count(ava_id)
from Likes
where ava_id = @ava_id
and @u not in (select blocked_id
			   from Blocks, Ava
			   where blocker_id = Ava.user_name and Ava.ava_id = @ava_id);


-- .....................................................................................--
-- Getting the people who like Avas: (دریافت لیست پسندکنندگان)
set @u = 'Tina3';
set @ava_id = 3;

select Likes.user_name
from Likes
where Likes.ava_id = @ava_id
and @u not in (select blocked_id
			   from Blocks, Ava
			   where blocker_id = Ava.user_name and Ava.ava_id = @ava_id)
and @u not in (select blocked_id
			   from Blocks, Likes
               where blocker_id = Likes.user_name and Likes.ava_id = @ava_id and @u != Likes.user_name);


-- .....................................................................................--
-- Getting Popular Avas: (دریافت آواهای پر طرفدار)
set @you = 'Tina3';
set @you = 'John3';

select Ava.ava_id, Ava.ava_content, count(Likes.ava_id) as number_likes
From Ava, Likes
where Ava.ava_id = Likes.ava_id
and Ava.user_name not in (select blocker_id
			              from Blocks, Ava
                          where blocker_id = Ava.user_name and blocked_id = @you)
group by Ava.ava_id 
union
select Ava.ava_id, Ava.ava_content, 0 as number_likes
From Ava
where Ava.ava_id not in (select Ava.ava_id
						 From Ava, Likes
                         where Ava.ava_id = Likes.ava_id)
and Ava.user_name not in (select blocker_id
			              from Blocks, Ava
                          where blocker_id = Ava.user_name and blocked_id = @you)
order by number_likes DESC;


-- .....................................................................................--
-- Sending a message: (ارسال پیام)
set @sender = 'Sherlock3'; -- example 1
set @receiver  = 'L3'; -- example 1
set @ava = null; -- int -- example 1
set @content = 'It is a trap L ;)'; -- example 1
set @ava = 5; -- example 2
set @content = null; -- example 2

insert into Message(message_content, sender_id, receiver_id, ava_id, m_send_date)
select @content, @sender, @receiver, @ava, current_timestamp()
where @sender not in (select blocked_id
					  from Blocks
					  where blocker_id = @receiver)
union               
select @content, @sender, @receiver, @ava, current_timestamp()
where @sender not in (select blocked_id
					  from Blocks, Ava
					  where blocker_id = Ava.user_name and Ava.ava_id = @ava);

select * from Message;


-- .....................................................................................--
-- Getting a list of the received messages from a particular user: (دریافت لیست پیامهای دریافتی از کاربر)
set @you = 'L3';
set @sender = 'Sherlock3';

select *
from Message
where sender_id = @sender and receiver_id = @you
and @you not in (select blocked_id
				 from Blocks, Ava, Message
				 where blocker_id = Ava.user_name and Ava.ava_id = Message.ava_id)
order by m_send_date DESC;


-- .....................................................................................--
-- Geeting the users who sent a message to a particular user: (دریافت لیست ارسال کنندگان پیام)
set @you = 'John3';

select sender_id
from Message
where receiver_id = @you
and @you not in (select blocked_id
				 from Blocks, Ava, Message
				 where blocker_id = Ava.user_name and Ava.ava_id = Message.ava_id)
order by m_send_date DESC;

