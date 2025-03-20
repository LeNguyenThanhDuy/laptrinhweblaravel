--Câu 1. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z)

select * from users
order by user_name COLLATE Vietnamese_CI_AS;

--Câu 2. Lấy ra 07 người dùng theo thứ tự tên theo Alphabet (A->Z)

select  Top 7 * from users
order by user_name COLLATE Vietnamese_CI_AS;

--Câu 3. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z), trong đó tên người dùng có chữ a

select * from users
Where user_name COLLATE Vietnamese_CI_AS Like N'%a%'
Order by user_name COLLATE Vietnamese_CI_AS;

--Câu 4. Lấy ra danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ m

select * from users
where user_name like 'm%';

--Câu 5. Lấy ra danh sách người dùng trong đó tên người dùng kết thúc bằng chữ i

select * from users
where user_name like '%i';

--Câu 6. Lấy ra danh sách người dùng trong đó email người dùng là Gmail

select * from users
where user_email like '%@gmail%';

--Câu 7. Lấy ra danh sách người dùng trong đó email người dùng là Gmail và tên người dùng bắt đầu bằng chữ m

select * from users
where user_email like '%@gmail%' and user_name like 'm%';

--Câu 8. Lấy ra danh sách người dùng trong đó email người dùng là Gmail tên người dùng có chữ i và tên người dùng có chiều dài lớn hơn 5

select * from users
where user_email like '%@gmail%' and user_name like '%i%' and LEN(user_name) > 5

--Câu 9. Lấy ra danh sách người dùng trong đó tên người dùng có chữ a, chiều dài từ 5 đến 9, email dùng dịch vụ Gmail, trong tên email có chữ I 

select * from users 
where user_name like '%a%' and LEN(user_name) BETWEEN 5 AND 9 
and user_email like '%@gmail%' 
AND SUBSTRING(user_email, 1, CHARINDEX('@', user_email) - 1) LIKE '%i%';

--Câu 10.  Lấy ra danh sách người dùng trong đó tên người dùng có chữ a, chiều dài từ 5 đến 9 hoặc tên người dùng có chữ i, chiều dài nhỏ hơn 9 hoặc email dùng dịch vụ Gmail, trong tên email có chữ i

select * from users
where (user_name like '%a%' and LEN(user_name) BETWEEN 5 AND 9)
OR
	  (user_name like '%i%' and LEN(user_name) < 9 )
OR   
	  (user_email like '%@gmail%' and SUBSTRING(user_email, 1, CHARINDEX('@', user_email) - 1) LIKE '%i%' )