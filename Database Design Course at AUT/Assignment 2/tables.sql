CREATE TABLE `users`(
	UserId	varchar(10),
    `Name`	varchar(30),
    PhoneNumber	varchar(11),
    Trophies	int,
	PRIMARY KEY(UserId));


CREATE TABLE questions(
	QId	varchar(10),
    Topic	varchar(20),
    Question	varchar(30),
    A	varchar(10),
    B	varchar(10),
    C	varchar(10),
    D	varchar(10),
    RightAnswer varchar(2),
    PRIMARY KEY(QId));
    

CREATE TABLE quizes(
	QuizId	varchar(10),
    UserId	varchar(10),
    `Date`	datetime,
    Topic	varchar(20),
    PRIMARY KEY(QuizId),
    FOREIGN KEY(UserId) REFERENCES `users`(UserId));


CREATE TABLE questions_quizes(
	QuizId	varchar(10),
    QId	varchar(10),
    Answer	varchar(2),
    PRIMARY KEY(QuizId, QId),
    FOREIGN KEY(QId) REFERENCES questions(QId),
    FOREIGN KEY(QuizId) REFERENCES `quizes`(QuizId));
