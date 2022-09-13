use quanlysinhvien;
-- hiển thị các môn học có credit lớn nhất 
select SubID,SubName, max(credit)
from subject
group by subId,subname
having max(credit) >= all (select max(credit) from subject) ;
-- -- hiển thị thông tin mô học lớn nhất
select * 
from mark
group by Mark 
having Mark >= all (select Mark from mark);
-- điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select *, avg(mark)
from student S join mark M on S.StudentID = M.StudentID
group by S.StudentID, S.StudentName order by mark desc;


