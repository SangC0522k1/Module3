CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);
CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
INSERT INTO Class
VALUES (4, 'A1', '2022-8-23', 1),(5, 'A2', '2022-8-23', 1),(6, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Sang', 'Hue', '0398809381', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('THPT', 'Hue', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Truc', 'Hue', '0123123123', 0, 2);

INSERT INTO Subject(subName, Credit)
VALUES ('CF', 5),
       ('C', 6),
       ('HDJ', 5),
       ('RDBMS', 10);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);       