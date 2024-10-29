-- tạo trigger khi thêm sản phẩm vào import_detail thì sẽ cộng số lượng thêm vào product có id đc thêm vào
drop trigger if exists trg_UpdateProductQuantity;
CREATE TRIGGER trg_UpdateProductQuantity
ON Import_Detail
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Product
    SET Quantity = p.Quantity + i.Quantity,
		Price_Import = i.Price_Import
    FROM Product p
    INNER JOIN inserted i ON p.Product_id = i.Product_id;
END;

-- giảm số lượng sản phẩm trong kho khi xóa import detail
CREATE TRIGGER trg_SubtractProductQuantity
ON Import_Detail
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Product
        SET Quantity = p.Quantity - d.Quantity
        FROM Product p
        INNER JOIN deleted d ON p.Product_id = d.Product_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

-- tạo tigger khi update dữ liệu ở bảng import_detail sẽ cập nhật lại giá trị của bảng product

CREATE TRIGGER trg_UpdateProductQuantityOnUpdate
ON Import_Detail
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    BEGIN TRY
        -- Cập nhật số lượng sản phẩm
        UPDATE Product
        SET Quantity = p.Quantity + i.Quantity - d.Quantity,
		Price_Import = i.Price_Import
        FROM Product p
        INNER JOIN inserted i ON p.Product_id = i.Product_id
        INNER JOIN deleted d ON p.Product_id = d.Product_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
