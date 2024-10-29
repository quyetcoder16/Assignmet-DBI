-- trong kho còn bao nhiêu sản phẩm 
select Product_id,Product_Name,Quantity from Product;

-- tìm sản phẩm còn bao nhiêu mặt hàng

drop PROCEDURE if exists PRO_ThongKeSanPhamConBaoNhieu;
CREATE PROCEDURE PRO_ThongKeSanPhamConBaoNhieu
    @TenSanPham NVARCHAR(100)
AS
BEGIN
    select * from Product as pr
	where pr.Product_Name = @TenSanPham;
END;

DECLARE  @TenSanPham NVARCHAR(100);
SET @TenSanPham = N'Tivi Samsung';
exec PRO_ThongKeSanPhamConBaoNhieu @TenSanPham;


--sắp xếp các sản phẩm theo tăng dần của giá nhập
select * 
from Product 
order by Price_Import;

--sắp xếp các sản phẩm theo tăng dần của giá xuất
select * 
from Product 
order by Price_Export;

-- thêm mới sản phẩm 
drop PROCEDURE if exists PRO_AddProduct;
CREATE PROCEDURE PRO_AddProduct
    @Product_Name NVARCHAR(100),
    @Unit NVARCHAR(50),
    @Quantity INT,
    @Price_Import FLOAT,
    @Price_Export FLOAT,
    @Origin NVARCHAR(100),
    @Categorie_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Product (Product_Name, Unit, Quantity, Price_Import, Price_Export, Origin, Categorie_id)
        VALUES (@Product_Name, @Unit, @Quantity, @Price_Import, @Price_Export, @Origin, @Categorie_id);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_AddProduct 
    @Product_Name = N'Tivi Sony 2',
    @Unit = N'Chiếc',
    @Quantity = 50,
    @Price_Import = 6000000,
    @Price_Export = 8000000,
    @Origin = N'Nhật Bản',
    @Categorie_id = 1;


-- update sản phẩm 
drop PROCEDURE if exists PRO_UpdateProduct;
CREATE PROCEDURE PRO_UpdateProduct
    @Product_id INT,
    @Product_Name NVARCHAR(100),
    @Unit NVARCHAR(50),
    @Quantity INT,
    @Price_Import FLOAT,
    @Price_Export FLOAT,
    @Origin NVARCHAR(100),
    @Categorie_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Product
        SET Product_Name = @Product_Name,
            Unit = @Unit,
            Quantity = @Quantity,
            Price_Import = @Price_Import,
            Price_Export = @Price_Export,
            Origin = @Origin,
            Categorie_id = @Categorie_id
        WHERE Product_id = @Product_id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from product;

EXEC PRO_UpdateProduct 
    @Product_id = 50,
    @Product_Name = N'Tivi Samsung 2',
    @Unit = N'Chiếc',
    @Quantity = 120,
    @Price_Import = 5500000,
    @Price_Export = 7500000,
    @Origin = N'Hàn Quốc',
    @Categorie_id = 1;

select * from product;


-- xóa sản phẩm
DROP PROCEDURE if exists PRO_DeleteProduct;
CREATE PROCEDURE PRO_DeleteProduct
    @Product_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM Product
        WHERE Product_id = @Product_id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;

EXEC PRO_DeleteProduct 
    @Product_id = 52;

select * from Product;

-- tạo procedure thêm import_history
CREATE PROCEDURE PRO_AddImportHistory
    @Date_import DATE,
    @Employee_id INT,
    @Supplier_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Import_History (Date_import, Employee_id, Supplier_id)
        VALUES (@Date_import, @Employee_id, @Supplier_id);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Import_History;

EXEC PRO_AddImportHistory 
    @Date_import = '2024-10-29',
    @Employee_id = 11,
    @Supplier_id = 10;

select * from Import_History;

-- tạo procedure update import_history

CREATE PROCEDURE PRO_UpdateImportHistory
    @Import_id INT,
    @Date_import DATE,
    @Employee_id INT,
    @Supplier_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Import_History
        SET Date_import = @Date_import,
            Employee_id = @Employee_id,
            Supplier_id = @Supplier_id
        WHERE Imp_id = @Import_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Import_History;

EXEC PRO_UpdateImportHistory 
    @Import_id = 11,
    @Date_import = '2024-10-29',
    @Employee_id = 2,
    @Supplier_id = 3;

-- tạo procedure xóa import history
drop PROCEDURE if exists Pro_DeleteImportHistory;
CREATE PROCEDURE Pro_DeleteImportHistory
    @Import_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

		DELETE FROM Import_Detail
        WHERE Imp_id = @Import_id;

        DELETE FROM Import_History
        WHERE Imp_id = @Import_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC Pro_DeleteImportHistory 
    @Import_id = 11;

select * from Product;
select * from Import_Detail;
select * from Import_History;


-- tạo procedure thêm import_detail

CREATE PROCEDURE PRO_AddImportDetail
    @Import_id INT,
    @Product_id INT,
    @Quantity INT,
    @Price FLOAT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Import_Detail (Imp_id, Product_id, Quantity, Price_Import)
        VALUES (@Import_id, @Product_id, @Quantity, @Price);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Import_Detail;
select * from Import_History;

EXEC PRO_AddImportDetail 
    @Import_id = 11,
    @Product_id = 51,
    @Quantity = 100,
    @Price = 50000;

select * from Import_Detail;
select * from Import_History;
select * from Product;

-- xóa import detail 
CREATE PROCEDURE PRO_DeleteImportDetail
    @Import_id INT,
    @Product_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        DELETE FROM Import_Detail
        WHERE Imp_id = @Import_id AND Product_id = @Product_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_DeleteImportDetail 
    @Import_id = 11,
    @Product_id = 51;

select * from Import_Detail;
select * from Import_History;
select * from Product;

--  Update Import Detail 

CREATE PROCEDURE PRO_UpdateImportDetail
    @Import_id INT,
    @Product_id INT,
    @NewQuantity INT,
    @NewPrice FLOAT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        
        -- Cập nhật bản ghi trong bảng Import_Detail
        UPDATE Import_Detail
        SET Quantity = @NewQuantity,
            Price_Import = @NewPrice
        WHERE Imp_id = @Import_id AND Product_id = @Product_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_UpdateImportDetail 
    @Import_id = 11,
    @Product_id = 51,
    @NewQuantity = 150,
    @NewPrice = 55000;

select * from Import_Detail;
select * from Import_History;
select * from Product;

-- thêm export history
CREATE PROCEDURE PRO_AddExportHistory
    @Date_export DATE,
    @Employee_id INT,
    @Customer_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Export_History (Date_export, Employee_id, Customer_id)
        VALUES (@Date_export, @Employee_id, @Customer_id);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Export_History;
select * from Export_Detail;

EXEC PRO_AddExportHistory 
    @Date_export = '2024-10-29',
    @Employee_id = 11,
    @Customer_id = 10;

-- cập nhật export_history
CREATE PROCEDURE PRO_UpdateExportHistory
    @Export_id INT,
    @Date_export DATE,
    @Employee_id INT,
    @Customer_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Export_History
        SET Date_export = @Date_export,
            Employee_id = @Employee_id,
            Customer_id = @Customer_id
        WHERE Exp_id = @Export_id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Export_History;
select * from Export_Detail;

EXEC PRO_UpdateExportHistory 
    @Export_id = 11,
    @Date_export = '2024-10-29',
    @Employee_id = 2,
    @Customer_id = 3;

-- xóa export history
CREATE PROCEDURE PRO_DeleteExportHistory
    @Export_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM Export_Detail
        WHERE Exp_id = @Export_id;

        DELETE FROM Export_History
        WHERE Exp_id = @Export_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Export_History;
select * from Export_Detail;

EXEC PRO_DeleteExportHistory 
    @Export_id = 11;


-- thêm export detail
CREATE PROCEDURE PRO_AddExportDetail
    @Export_id INT,
    @Product_id INT,
    @Quantity INT,
    @Price FLOAT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Export_Detail (Exp_id, Product_id, Quantity, Price_Export)
        VALUES (@Export_id, @Product_id, @Quantity, @Price);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Export_History;
select * from Export_Detail;

EXEC PRO_AddExportDetail 
    @Export_id = 11,
    @Product_id = 51,
    @Quantity = 20,
    @Price = 50000;


-- cập nhật export detail
CREATE PROCEDURE PRO_UpdateExportDetail
    @Export_id INT,
    @Product_id INT,
    @NewQuantity INT,
    @NewPrice FLOAT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Export_Detail
        SET Quantity = @NewQuantity,
            Price_Export = @NewPrice
        WHERE Exp_id = @Export_id AND Product_id = @Product_id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Export_History;
select * from Export_Detail;

EXEC PRO_UpdateExportDetail 
    @Export_id = 11,
    @Product_id = 51,
    @NewQuantity = 15,
    @NewPrice = 55000;


-- xóa export detail
CREATE PROCEDURE PRO_DeleteExportDetail
    @Export_id INT,
    @Product_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM Export_Detail
        WHERE Exp_id = @Export_id AND Product_id = @Product_id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Product;
select * from Export_History;
select * from Export_Detail;

EXEC PRO_DeleteExportDetail 
    @Export_id = 11,
    @Product_id = 51;

-- xóa supplier 
CREATE PROCEDURE PRO_DeleteSupplier
    @Supplier_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        DELETE FROM Supplier
        WHERE Supplier_id = @Supplier_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_DeleteSupplier 
    @Supplier_id = 11;

select * from Supplier;

-- xóa Employee
CREATE PROCEDURE PRO_DeleteEmployee
    @Employee_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DELETE FROM Employee
        WHERE Employee_id = @Employee_id;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_DeleteEmployee 
    @Employee_id = 20;

select * from Employee;

-- xóa department 

CREATE PROCEDURE PRO_DeleteDepartment
    @Department_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Xóa phòng ban từ bảng Department
        DELETE FROM Department
        WHERE Dep_id = @Department_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

INSERT INTO Department (Dep_Name, Phone, Address, Manager_id) VALUES 
(N'Phòng n', '0132456987', N'Tầng n', NULL);

EXEC PRO_DeleteDepartment 
    @Department_id = 7;

select * from Department;

-- xóa customer

CREATE PROCEDURE PRO_DeleteCustomer
    @Customer_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
    
        DELETE FROM Customer
        WHERE Customer_id = @Customer_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_DeleteCustomer 
    @Customer_id = 20;

select * from Customer;

-- xóa catagories
CREATE PROCEDURE PRO_DeleteCategories
    @Category_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        

        -- Xóa danh mục từ bảng Category
        DELETE FROM Categories
        WHERE Categorie_id = @Category_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_DeleteCategories
    @Category_id = 6;


INSERT INTO Categories (Categorie_Name, Description) VALUES 
(N'Thiết bị gia dụng', N'Sản phẩm điện tử gia dụng như tivi, tủ lạnh, máy giặt, điều hòa, bếp ga, quạt điện, bàn là, bếp từ, nồi cơm điện, máy xay sinh tố');


select * from Categories;

-- lấy ra danh sách các import từ ngày a ngày b 

CREATE PROCEDURE PRO_GetImportsByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT *
        FROM Import_History
        WHERE Date_import BETWEEN @StartDate AND @EndDate;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

select * from Import_History;

EXEC PRO_GetImportsByDateRange 
    @StartDate = '2023-01-01',
    @EndDate = '2023-07-31';

-- thống kê số lượng sản phẩm nhập và tổng số tiền phải trả theo id nhập 
CREATE PROCEDURE PRO_StatisticsImportDetails
    @Import_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT 
            ih.Imp_id,
            ih.Date_import,
            e.Employee_name,
            s.Supplier_name,
            SUM(id.Quantity) AS TotalQuantity,
            SUM(id.Quantity * id.Price_Import) AS TotalAmount
        FROM Import_History ih
        JOIN Employee e ON ih.Employee_id = e.Employee_id
        JOIN Supplier s ON ih.Supplier_id = s.Supplier_id
        JOIN Import_Detail id ON ih.Imp_id = id.Imp_id
        WHERE ih.Imp_id = @Import_id
        GROUP BY ih.Imp_id, ih.Date_import, e.Employee_name, s.Supplier_name;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_StatisticsImportDetails 
    @Import_id = 10;

-- export từ ngày A đến ngày B
CREATE PROCEDURE PRO_GetExportsByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT *
        FROM Export_History
        WHERE Date_export BETWEEN @StartDate AND @EndDate;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_GetExportsByDateRange 
    @StartDate = '2023-01-01',
    @EndDate = '2023-07-31';


-- thống kê chi tiết export

CREATE PROCEDURE PRO_StatisticsExportDetails
    @Export_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        SELECT 
            eh.Exp_id,
            eh.Date_export,
            e.Employee_name,
            c.Customer_name,
            SUM(ed.Quantity) AS TotalQuantity,
            SUM(ed.Quantity * ed.Price_Export) AS TotalAmount
        FROM Export_History eh
        JOIN Employee e ON eh.Employee_id = e.Employee_id
        JOIN Customer c ON eh.Customer_id = c.Customer_id
        JOIN Export_Detail ed ON eh.Exp_id = ed.Exp_id
        WHERE eh.Exp_id = @Export_id
        GROUP BY eh.Exp_id, eh.Date_export, e.Employee_name, c.Customer_name;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC PRO_StatisticsExportDetails 
    @Export_id = 10;
