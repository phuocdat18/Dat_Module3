-- ***Dùng các hàm gộp 
-- -- Câu 1: Cho biết số lượng giáo viên của toàn trường
SELECT COUNT(magv)
FROM giaovien;


-- -- Câu 2: Cho biết số lượng giáo viên của bộ môn HTTT
select count(magv)
from giaovien 
where MABM = 'HTTT';

-- -- Câu 3: Tính số lượng giáo viên có người quản lý về mặt chuyên môn
select count(magv)
from giaovien where GVQLCM is null;


-- -- Câu 4: Tính số lượng giáo viên làm nhiệm vụ quản lý chuyên môn cho giáo viên khác mà
-- thuộc bộ môn HTTT.
select count(GVQLCM)
from giaovien
where GVQLCM is not null and  MABM = 'HTTT';


-- -- Câu 5:  Tính lương trung bình của giáo viên bộ môn Hệ thống thông tin
-- ***Dùng group by
SELECT AVG(luong) AS luong_trung_binh
FROM giaovien WHERE MABM = 'HTTT';

-- Tính lương của giáo viên sau khi tăng 1.1 lần
select magv, hoten, luong as luongtruoc, luong *1.1 as luongsau from giaovien;


-- -- Câu 6: Với mỗn bộ môn cho biết bộ môn (MAMB) và số lượng giáo viên của bộ môn đó.

select MABM, count(magv) from giaovien group by MABM;


-- -- Câu 7: Với mỗi giáo viên, cho biết MAGV và số lượng công việc mà giáo viên đó có tham
-- gia.
-- select MADT, count(sott) from congviec group by MADT;
select mabm, count(congviec.tencv), thamgiadt.MADT 
from giaovien join giaovien gv on gv.MAGV = thamgiadt.MAGV;


-- -- Câu 8: Với mỗi giáo viên, cho biết MAGV và số lượng đề tài mà giáo viên đó có tham gia.
select gv.magv, gv.hoten, count(distinct madt) from thamgiadt tgdt
inner join giaovien gv on gv.magv = tgdt.magv
group by magv;

-- Nâng cấp
select gv.magv, gv.hoten, count(distinct madt) from thamgiadt tgdt
inner join giaovien gv on gv.magv = tgdt.magv
group by magv;


-- -- Câu 9:  Với mỗi bộ môn, cho biết số đề tài mà giáo viên của bộ môn đó chủ trì
SELECT GIAOVIEN.MABM, COUNT(*)
FROM DETAI, GIAOVIEN
WHERE DETAI.GVCNDT = GIAOVIEN.MAGV
GROUP BY GIAOVIEN.MABM;


-- -- Câu 10: Với mỗn bộ môn cho biết tên bộ môn và số lượng giáo viên của bộ môn đó.
select bm.mabm, count(magv), bm.tenbm from giaovien gv
join bomon bm on bm.mabm = gv.mabm 
group by bm.mabm ;


select bm.MABM, count(gv.MAGV) from bomon bm 
left join giaovien gv on bm.MABM = gv.mabm 
group by bm.MABM;


select bm.mabm, (select count(*)
from giaovien where mabm = bm.mabm)
from bomon bm;

-- Hiện danh sách các giáo viên có địa chỉ ở tp HCM.
select *  from giaovien where DIACHI like '%tp hcm';




-- ***Dùng GROUP BY + HAVING
-- -- Câu 11: Cho biết những bộ môn từ 2 giáo viên trở lên.
select mabm, count(magv) from giaovien group by mabm having count(mabm) > 1;


-- -- Câu 12: Cho tên những giáo viên và số lượng đề tài của những GV tham gia từ 3 đề tài trở
-- lên.
select gv.magv, count(distinct madt), gv.hoten from thamgiadt tgdt
join giaovien gv on gv.MAGV = tgdt.magv
group by gv.magv having count(distinct MADT) > 2;


-- -- Câu 13: Cho biết số lượng đề tài được thực hiện trong từng năm.
SELECT YEAR(ngaybd) AS nam, COUNT(madt) AS so_luong
FROM detai
GROUP BY nam
ORDER BY nam;


SELECT YEAR(NGAYBD), COUNT(*)
FROM DETAI
GROUP BY YEAR(NGAYBD)
order by year(ngaybd);



-- ************************************************A
-- Dùng truy vấn con + mệnh đề SELECT
-- -- Câu A1: Với mỗi bộ môn, cho biết tên bộ môn và số lượng giáo viên của bộ môn đó.
select bm.mabm, count(magv), bm.tenbm from giaovien gv
join bomon bm on bm.mabm = gv.mabm 
group by bm.mabm ;


--  Tính tuổi của các giáo viên từ ngày sinh
SELECT HOTEN, YEAR(CURDATE()) - YEAR(NGSINH) AS TUOI
FROM giaovien;

--  liệt kê danh sách giáo viên có năm sinh 1975 theo thứ tự mã gv giảm dần;
select giaovien.magv, hoten from giaovien
where year(NGSINH) = 1975
order by magv desc;


-- Dùng truy vấn con + mệnh đề FROM
-- -- Câu A2: Cho biết họ tên và lương của các giáo viên bộ môn HTTT
SELECT T.HOTEN, T.LUONG, T.MAGV
FROM ( SELECT MAGV, HOTEN, LUONG as LUONG 
FROM GIAOVIEN
WHERE MABM= 'HTTT') as T;


-- Dùng truy vấn con + mệnh đề WHERE
-- -- Câu A3: Cho biết những giáo viên có lương lớn hơn lương của giáo viên có MAGV=‘001’
select magv, luong from giaovien where luong > (
select luong from giaovien where MAGV = 001); 


-- -- Câu A4: Cho biết họ tên những giáo viên mà không có một người thân nào


SELECT * FROM giaovien
LEFT JOIN nguoithan ON giaovien.magv = nguoithan.magv
WHERE nguoithan.magv IS NULL;

-- cách 1:
select * from giaovien where magv not in (
select magv from nguoithan);
-- cách 2:
select *
from giaovien gv left join nguoithan nt on gv.MAGV = nt.MAGV
where nt.MAGV is null;
-- cách 3: dùng not exist
select * from giaovien gv
where not exists (select * from nguoithan nt where nt.MAGV = gv.MAGV);

-- -- Cho biết những giáo viên có người thân
select giaovien.magv, giaovien.HOTEN,  ten as nguoi_than from nguoithan
inner join giaovien on giaovien.magv = nguoithan.magv;


-- -- Câu A5: Cho những giáo viên có tham gia đề tài
select distinct giaovien.MAGV, giaovien.hoten from giaovien
inner join thamgiadt on giaovien.MAGV = thamgiadt.magv
where thamgiadt.MAGV
order by (magv) asc;


select distinct gv.* from giaovien gv join thamgiadt tgdt on gv.magv = tgdt.magv
order by (magv) asc;


select * from giaovien where magv in ( select magv from thamgiadt);

-- cho biết tên đề tài theo thời gian bắt đầu, sắp xếp theo năm giảm dần giảm dần
select madt, tendt, year(ngaybd) as NamBD from detai
order by year(ngaybd) asc;

-- -- Câu A6: Cho những giáo viên có lương nhỏ nhất
select hoten, luong from giaovien where luong = ( select min(luong) from giaovien
where luong);

select min(luong) from giaovien
where luong;

SELECT HOTEN, LUONG
FROM giaovien
ORDER BY LUONG ASC
LIMIT 3;


SELECT *
FROM GIAOVIEN
WHERE LUONG <= ALL (SELECT LUONG FROM GIAOVIEN);

-- -- Câu A7: Cho những giáo viên có lương cao hơn tất cả các giáo viên của bộ môn HTTT
SELECT * FROM GIAOVIEN
WHERE LUONG > ALL(SELECT LUONG FROM GIAOVIEN
WHERE MABM= 'HTTT');


SELECT LUONG FROM GIAOVIEN
WHERE MABM= 'HTTT';

-- -- Câu A8: Cho biết bộ môn (MABM) có đông giáo viên nhất
select mabm, count(*) from giaovien group by mabm having count(*) >= ALL ( select count(*) from giaovien group by mabm);

select mabm, count(*) as Dem from giaovien group by mabm having Dem >= all (select count(*) from giaovien group by mabm);


select max(temp.dem1) from (select count(*) as dem from giaovien group by mabm) as temp;


-- -- Câu A9: Cho biết họ tên những giáo viên mà không có một người thân nào. (Sử dụng ALL
-- thay vì NOT IN)
select * from giaovien where magv != all (select MAGV from nguoithan);


-- -- Câu A10: Cho biết họ tên những giáo viên có tham gia đề tài. (Sử dụng = ANY thay vì IN)
select hoten from giaovien where magv = any ( select magv from thamgiadt);


-- -- Câu A11: Cho biết các giáo viên có tham gia đề tài.   ( dùng Exists)
select * from giaovien gv where exists (select * from thamgiadt tgdt where gv.MAGV = tgdt.MAGV);


-- -- Câu A12: Cho biết các giáo viên không có người thân
select * from giaovien where not exists (select * from nguoithan where giaovien.magv = nguoithan.magv);


-- -- Câu A14: Cho biết những giáo viên có lương lớn hơn lương trung bình của bộ môn mà giáo
-- viên đó làm việc.
select * from giaovien where luong > (select avg(luong) from giaovien);


-- -- Câu A15: Cho biết những giáo viên có lương lớn nhất
select * from giaovien order by luong desc limit 3;

select * from giaovien where luong = ( select max(luong) from giaovien);


-- -- Câu A16: Cho biết những đề tài mà giáo viên ‘001’ không tham gia.
select * from detai where not exists (select * from thamgiadt where detai.madt = thamgiadt.madt and magv = '001');


-- -- Câu A17: Cho biết họ tên những giáo viên có vai trò quản lý về mặt chuyên môn với các giáo
-- viên khác
select * from giaovien gv1 where exists ( select * from giaovien gv2 where gv1.GVQLCM = gv2.GVQLCM );


-- -- Câu A18: Cho biết những giáo viên có lương lớn nhất.
select * from giaovien where luong = ( select max(luong) from giaovien);


-- -- Câu A19: Cho biết những bộ môn (MABM) có đông giáo viên nhất
select mabm from giaovien group by MABM having count(*) >= all ( select count(*) from giaovien gv group by gv.mabm);


-- -- Câu A20: Cho biết những tên bộ môn, họ tên của trưởng bộ môn và số lượng giáo viên của
-- bộ môn có đông giáo viên nhất
select bm.tenbm, tbm.hoten as truong_bo_mon, count(*) as SLGV 
from
giaovien gv, giaovien tbm, bomon bm 
where gv.mabm = bm.mabm and bm.TRUONGBM = tbm.magv
group by gv.mabm, tbm.hoten 
having count(*) >= all ( select count(*) from giaovien group by mabm);


-- -- Câu A21: Cho biết những giáo viên có lương lớn hơn mức lương trung bình của giáo viên bộ
-- môn Hệ thống thông tin mà không trực thuộc bộ môn hệ thống thông tin
select avg(luong) from giaovien where mabm = 'httt';
select * from giaovien where mabm != 'httt' and luong > all (select avg(luong) from giaovien where mabm = 'httt');


-- -- Câu A22: Cho tên biết đề tài có đông giáo viên tham gia nhất
-- viên bộ môn Hệ thống thông tin mà không trực thuộc bộ môn hệ thống thông tin
SELECT MAX (MADT)
FROM DETAI
WHERE LUONG > ( SELECT MADT, COUNT ( MAGV ) AS SL
FROM THAMGIADT
GROUP BY MADT );


-- ************************************************B
-- -- Câu B2: Tìm các giáo viên không tham gia đề tài nào
-- -- Câu B3: Tìm các giáo viên vừa tham gia đề tài vừa là trưởng bộ môn.
-- -- Câu B4: Liệt kê những giáo viên có tham gia đề tài và những giáo viên là trưởng bộ môn.
-- -- Câu B5: Tìm các giáo viên (MAGV) mà tham gia tất cả các đề tài
-- -- Câu B6: Tìm các giáo viên (MAGV) mà tham gia tất cả các đề tài (Dùng NOT EXISTS)
-- -- Câu B7: Tìm các giáo viên (MAGV) mà tham gia tất cả các đề tài (Dùng NOT EXISTS)
-- -- Câu B9: Tìm tên các giáo viên ‘HTTT’ mà tham gia tất cả các đề tài thuộc chủ đề ‘QLGD


-- -- ADVANCED
-- -- Cho biết tên giáo viên và tên của giáo viên có nhiều người thân nhất
-- -- Cho biết tên của giáo viên lớn tuổi nhất của bộ môn hệ thống thông tin
-- -- Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia
-- -- Cho biết tên của giáo viên chủ nhiệm nhiều đề tài nhất.
-- -- Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất
-- -- Cho biết tên đề tài nào mà được tất cả giáo viên của bộ môn hóa hữu cơ tham gia
