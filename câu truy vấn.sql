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