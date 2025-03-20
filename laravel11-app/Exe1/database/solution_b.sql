--Câu 1. Liệt kê các hóa đơn của khách hàng, thông tin hiển thị gồm: mã user, tên user, mã hóa đơn

select 
u.user_id,
u.user_name,
o.order_id
from users u
JOIN orders o ON u.user_id = o.user_id

--Câu 2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng

select 
u.user_id,
u.user_name,
COUNT(o.order_id) as total_orders
From users u
LEFT JOIN orders o ON u.user_id = o.user_id
group by u.user_id,u.user_name
order by total_orders DESC;

--Câu 3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm

select 
o.order_id,
COUNT(od.product_id) as total_orders
from orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
order by total_orders DESC;

--Câu 4. Liệt kê thông tin mua hàng của người dùng: mã user, tên user, mã đơn hàng, tên sản phẩm. Lưu ý: gôm nhóm theo đơn hàng, tránh hiển thị xen kẻ các đơn hàng với nhau

select
u.user_id,
u.user_name,
o.order_id,
STRING_AGG(p.product_name,', ') AS product_name
from orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY  u.user_id ,u.user_name,o.order_id
ORDER BY o.order_id;

--Câu 5:Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất, thông tin hiển thị gồm: mã user, tên user, số lượng đơn hàng

select TOP 7
u.user_id,
u.user_name,
COUNT (o.order_id) as total_orders
FROM users u
JOIN orders o  ON  u.user_id = o.user_id
GROUP BY u.user_id,u.user_name
ORDER BY total_orders DESC;

--Câu 6: Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple trong tên sản phẩm, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT TOP 7 
    u.user_id, 
    u.user_name, 
    o.order_id, 
    p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' 
   OR p.product_name LIKE '%Apple%'
ORDER BY o.order_id;

--Câu 7: Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền
SELECT 
    u.user_id, 
    u.user_name, 
    o.order_id, 
    SUM(p.product_price) AS total_price
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY u.user_id, u.user_name, o.order_id
ORDER BY u.user_id, o.order_id;
--ChatGPT
--Câu 8 Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền lớn nhất.
WITH OrderTotal AS (
    SELECT 
        u.user_id, 
        u.user_name, 
        o.order_id, 
        SUM(p.product_price) AS total_price
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT ot.user_id, ot.user_name, ot.order_id, ot.total_price
FROM OrderTotal ot
WHERE ot.total_price = (
    SELECT MAX(total_price)
    FROM OrderTotal ot2
    WHERE ot2.user_id = ot.user_id
)
ORDER BY ot.total_price DESC;
 --chatGPT
--Câu 9: Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền nhỏ nhất.
WITH OrderTotal AS (
    SELECT 
        u.user_id, 
        u.user_name, 
        o.order_id, 
        SUM(p.product_price) AS total_price,
        COUNT(od.product_id) AS total_products
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT ot.user_id, ot.user_name, ot.order_id, ot.total_price, ot.total_products
FROM OrderTotal ot
WHERE ot.total_price = (
    SELECT MIN(total_price)
    FROM OrderTotal ot2
    WHERE ot2.user_id = ot.user_id
)
ORDER BY ot.total_price ASC;
--ChatGPT
--Câu 10. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có số sản phẩm là nhiều nhất
WITH OrderTotal AS (
    SELECT 
        u.user_id, 
        u.user_name, 
        o.order_id, 
        SUM(p.product_price) AS total_price,
        COUNT(od.product_id) AS total_products
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY u.user_id, u.user_name, o.order_id
)
SELECT ot.user_id, ot.user_name, ot.order_id, ot.total_price, ot.total_products
FROM OrderTotal ot
WHERE ot.total_products = (
    SELECT MAX(total_products)
    FROM OrderTotal ot2
    WHERE ot2.user_id = ot.user_id
)
ORDER BY ot.total_products DESC;

