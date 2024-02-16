INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
VALUES
(1, 'Laney Fadden', '757536378',  'laney@gmail.com'),
(2, 'Giacopo Bramich', '757536379', 'giacopo@gmail.com'),
(3, 'Lia Bonar', '757536376', 'lia@gmail.com'),
(4, 'Merrill Baudon', '757536375', 'merrill@gmail.com'),
(5, 'Tasia Fautly', '757536374', 'tasia@gmail.com'),
(6, 'Angel Veschambre', '75756373', 'angel@gmail.com'),
(7, 'Sheilah Maestro', '75756372', 'sheilah@gmail.com'),
(8, 'Audie Willcocks', '75756371', 'audie@gmail.com'),
(9, 'Mart Malsher', '75756370', 'mart@gmail.com'),
(10, 'Magdalen Lacheze', '75756376','magdalen@gmail.com');

INSERT INTO MenuItems(MenuItemsID, CourseName, StarterName, DesertName) values
(1, 'Greek salad', 'Olives', 'Greek yoghurt'),
(2, 'Bean soup', 'Flatbread', 'Ice cream'),
(3, 'Pizza', 'Minestrone', 'Cheesecake'),
(4, 'Carbonara', 'Tomato bread', 'Affogato'),
(5, 'Kabasa', 'Falafel', 'Turkish yoghurt'),
(6, 'Shwarma', 'Hummus', 'Baklava'),
(7, 'Greek salad', 'Olives', 'Greek yoghurt');
select * from menuitems;
insert into menus(menuid,menuitemsid,menuname,cuisine) values
(1, 1, 'A', 'Greek'),
(2, 2, 'B', 'Italian'),
(3, 3, 'C', 'Italian'),
(4, 4, 'D', 'Turkish'),
(5, 5, 'E', 'Greek'),
(6, 6, 'F', 'Italian'),
(7, 7, 'G', 'Greek');
select * from menus

insert into orders(orderid, menuid, customerid, quantity, totalcost) values
(1, 1, 1, 2, '235'),
(2, 1, 2, 1, '125'),
(3, 2, 3, 3, '325'),
(4, 3, 4, 3, '220'),
(5, 5, 5, 2, '120'),
(6, 6, 6, 1, '85'),
(7, 6, 6, 1, '100'),
(8, 4, 8, 2, '200'),
(9, 7, 7, 1, '85'),
(10, 2, 3, 2, '155');
select * from orders;
update orders 
set Quantity=5
WHERE orderid=3

insert into bookings(bookingid, customerid, tablenumber, bookingdate) values
(1, 1, 12, '2022-12-11'),
(2, 2, 12, '2022-12-10'),
(3, 3, 15, '2022-12-8'),
(4, 4, 19, '2022-12-9'),
(5, 5, 5, '2022-12-11'),
(6, 6, 6, '2022-12-10'),
(7, 7, 8, '2022-12-8'),
(8, 8, 9, '2022-12-15'),
(9, 9, 11, '2022-12-14'),
(10, 10, 17, '2022-12-5');
select * from orders;

CREATE VIEW OrdersView AS
SELECT 	o.OrderID, o.Quantity, o.TotalCost, c.CustomerID, c.FullName
FROM orders o join customers c on o.CustomerID=c.CustomerID
WHERE quantity >1;


CREATE VIEW CustomersView AS
SELECT 	c.CustomerID,
		c. FullName,
        o.OrderID,
        o.TotalCost,
        m.MenuItemsID, m.coursename, m.startername, m.desertname,
        m1.Cuisine
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN menus m1 ON m1.menuid=o.menuid
JOIN menuitems m on m.menuitemsID=m1.menuitemsID 
WHERE TotalCost > 50
ORDER BY TotalCost DESC;

CREATE VIEW BookingsView AS
SELECT 	c.CustomerID,
		c. FullName,
        b.tablenumber,
        b.BookingDate,
        o.OrderID,
        o.TotalCost,
        m.MenuItemsID, m.coursename, m.startername, m.desertname,
        m1.Cuisine
FROM customers c
join bookings b on c.customerid=b.customerid
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN menus m1 ON m1.menuid=o.menuid
JOIN menuitems m on m.menuitemsID=m1.menuitemsID 
WHERE TotalCost > 50
ORDER BY TotalCost DESC;

SELECT * FROM bookings;
