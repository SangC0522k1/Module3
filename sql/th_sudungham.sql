use quanlysinhvien;
select Address,
count(StudentID) AS 'số lượng học viên'
from student
group by Address;
-- tính điểm trung bình các môn
select S.StudentID, S.StudentName, avg(Mark)
from student S join Mark M on S.StudentID = M.StudentID
group by S.StudentID,S.StudentName;
-- điểm trung bình môn lớn hơn 15
select S.StudentID, S.StudentName, avg(Mark)
from student S join Mark M on S.StudentID = M.StudentID
group by S.StudentID,S.StudentName
having avg(Mark) > 15;
-- hiển thị điểm trung bình lớn nhất
select S.StudentID, S.StudentName, avg(Mark)
from student S join Mark M on S.StudentID = M.StudentID
group by S.StudentID,S.StudentName
having avg(Mark) >= all (select avg(Mark) from Mark 
group by Mark.StudentID);

