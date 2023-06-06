--use MyLocalDB
--go

DROP TRIGGER trg_Funcionario_Delete_All;
DROP TRIGGER trg_CartaoTrabalho_Delete;
DROP TRIGGER trg_before_delete_departamento;
DROP TRIGGER trg_before_delete_engenheiro;

go

-- Delete Funcionario
CREATE TRIGGER trg_Funcionario_Delete_All
ON Funcionario
INSTEAD OF DELETE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE CartaoTrabalho FROM CartaoTrabalho WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED);
        UPDATE Departamento SET ID_Gerente = NULL WHERE ID_Gerente IN (SELECT ID_Funcionario FROM DELETED);
        DELETE Engenheiro FROM Engenheiro WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED);

        DELETE AtribuicaoCamiao FROM AtribuicaoCamiao WHERE ID_Motorista IN (SELECT ID_Motorista FROM Motorista WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED));
        DELETE Motorista FROM Motorista WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED);

        UPDATE ProdutoMDF SET ID_Operario = NULL WHERE ID_Operario IN (SELECT ID_Operario FROM Operario WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED));

        DELETE Operario FROM Operario WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED);
        DELETE Funcionario FROM Funcionario WHERE ID_Funcionario IN (SELECT ID_Funcionario FROM DELETED);
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMsg, @ErrorSeverity, @ErrorState);
    END CATCH
END;

go

--_Delete CartaoTrabalho
CREATE TRIGGER trg_CartaoTrabalho_Delete
ON CartaoTrabalho
INSTEAD OF DELETE
AS
BEGIN
    DELETE CartaoTrabalho 
    FROM CartaoTrabalho 
    INNER JOIN DELETED ON CartaoTrabalho.ID_CartaoTrabalho = DELETED.ID_CartaoTrabalho;
END;
go

CREATE TRIGGER trg_before_delete_departamento
ON Departamento
INSTEAD OF DELETE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        UPDATE Departamento
        SET ID_Gerente = NULL
        WHERE ID_Gerente IN (SELECT ID_Departamento FROM deleted);

        DELETE FROM Departamento
        WHERE ID_Departamento IN (SELECT ID_Departamento FROM deleted);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Error occurred during deletion of Departamento', 16, 1);
    END CATCH;
END;
go

CREATE TRIGGER trg_before_delete_engenheiro
ON Engenheiro
INSTEAD OF DELETE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Departamento
        SET ID_Gerente = NULL
        WHERE ID_Gerente IN (SELECT ID_Engenheiro FROM deleted);

        DELETE FROM Engenheiro
        WHERE ID_Engenheiro IN (SELECT ID_Engenheiro FROM deleted);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Error occurred during deletion of Engenheiro', 16, 1);
    END CATCH;
END;
go

--



