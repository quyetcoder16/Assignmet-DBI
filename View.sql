-- t?o view th?ng kê s?n ph?m ? trong kho: mã s?n ph?m, tên s?n ph?m, ??n v?, s? l??ng còn ? trong kho, s? l??ng ?ã nh?p, s? l??ng ?ã su?t
IF EXISTS (SELECT * FROM sys.views WHERE name = 'Warehouse_Stock')
DROP VIEW Warehouse_Stock;

CREATE VIEW Warehouse_Stock AS
SELECT 
    p.Product_id,
    p.Product_Name,
    p.Unit,
    ISNULL(SUM(id.Quantity), 0) AS Total_Imported,
    ISNULL(SUM(ed.Quantity), 0) AS Total_Exported,
    (p.Quantity + ISNULL(SUM(id.Quantity), 0) - ISNULL(SUM(ed.Quantity), 0)) AS Remaining_Stock
FROM 
    Product p
LEFT JOIN 
    Import_Detail id ON p.Product_id = id.Product_id
LEFT JOIN 
    Export_Detail ed ON p.Product_id = ed.Product_id
GROUP BY 
    p.Product_id, p.Product_Name, p.Unit, p.Quantity;

SELECT * FROM Warehouse_Stock;

-- view th?ng kê s? ti?n dùng ?? nh?p hàng, s? ti?n thu ???c và lãi theo tháng, theo n?m
drop view Monthly_Financial_Overview
CREATE VIEW Monthly_Financial_Overview AS
SELECT 
    Year,
    Month,
    SUM(Total_Cost_Import) AS Total_Cost_Import,
    SUM(Total_Revenue_Export) AS Total_Revenue_Export,
    SUM(Total_Revenue_Export - Total_Cost_Import) AS Profit
FROM (
    SELECT 
        YEAR(ih.Date_import) AS Year,
        MONTH(ih.Date_import) AS Month,
        ISNULL(SUM(id.Quantity * id.Price_Import), 0) AS Total_Cost_Import,
        0 AS Total_Revenue_Export
    FROM 
        Import_History ih
    LEFT JOIN 
        Import_Detail id ON ih.Imp_id = id.Imp_id
    GROUP BY 
        YEAR(ih.Date_import), MONTH(ih.Date_import)

    UNION ALL

    SELECT 
        YEAR(eh.Date_Export) AS Year,
        MONTH(eh.Date_Export) AS Month,
        0 AS Total_Cost_Import,
        ISNULL(SUM(ed.Quantity * ed.Price_Export), 0) AS Total_Revenue_Export
    FROM 
        Export_History eh
    LEFT JOIN 
        Export_Detail ed ON eh.Exp_id = ed.Exp_id
    GROUP BY 
        YEAR(eh.Date_Export), MONTH(eh.Date_Export)
) AS Combined
GROUP BY 
    Year, Month;

SELECT * FROM Monthly_Financial_Overview;

-- t?o view th?ng kê doanh thu c?a nhân viên
CREATE VIEW Employee_Revenue_Overview AS
SELECT 
    e.Employee_id,
    e.Employee_name,
    SUM(ed.Quantity * ed.Price_Export) AS Total_Revenue_Export
FROM 
    Employee e
JOIN 
    Export_History eh ON e.Employee_id = eh.Employee_id
JOIN 
    Export_Detail ed ON eh.Exp_id = ed.Exp_id
GROUP BY 
    e.Employee_id, e.Employee_name;

SELECT * FROM Employee_Revenue_Overview;

-- t?o View th?ng kê doanh thu theo phòng ban
CREATE VIEW Department_Revenue_Overview AS
SELECT 
    d.Dep_id,
    d.Dep_Name,
    SUM(ed.Quantity * ed.Price_Export) AS Total_Revenue_Export
FROM 
    Department d
JOIN 
    Employee e ON d.Dep_id = e.Department_id
JOIN 
    Export_History eh ON e.Employee_id = eh.Employee_id
JOIN 
    Export_Detail ed ON eh.Exp_id = ed.Exp_id
GROUP BY 
    d.Dep_id, d.Dep_Name;

SELECT * FROM Department_Revenue_Overview;


-- t?o View th?ng kê top 10 khách hàng v?i t?ng giá tr? mua s?m cao nh?t
CREATE VIEW Top10_Customers_By_Spending AS
SELECT 
    c.Customer_id,
    c.Customer_name,
    SUM(ed.Quantity * ed.Price_Export) AS Total_Spending
FROM 
    Customer c
JOIN 
    Export_History eh ON c.Customer_id = eh.Customer_id
JOIN 
    Export_Detail ed ON eh.Exp_id = ed.Exp_id
GROUP BY 
    c.Customer_id, c.Customer_name
ORDER BY 
    Total_Spending DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT * FROM Top10_Customers_By_Spending;



-- t?o th?ng kê top5 nhà cung c?p v?i t?ng giá tr? nh?p hàng cao nh?t
CREATE VIEW Top5_Suppliers_By_Import_Price AS
SELECT 
    s.Supplier_id,
    s.Supplier_name,
    SUM(id.Quantity * id.Price_Import) AS Total_Import_Value
FROM 
    Supplier s
JOIN 
    Import_History ih ON s.Supplier_id = ih.Supplier_id
JOIN 
    Import_Detail id ON ih.Imp_id = id.Imp_id
GROUP BY 
    s.Supplier_id, s.Supplier_name
ORDER BY 
    Total_Import_Value DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT * FROM Top5_Suppliers_By_Import_Price;
