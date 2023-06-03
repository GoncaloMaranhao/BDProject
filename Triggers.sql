use MyLocalDB
go

--select so.name, text
--from sysobjects so, syscomments sc
--where type = 'TR'
--and so.id = sc.id
--and text like 'Funcionario'

DROP TRIGGER trg_Funcionario_Delete_All;
DROP TRIGGER trg_CartaoTrabalho_Delete;
go

-- Delete Funcionario
CREATE TRIGGER trg_Funcionario_Delete_All
ON Funcionario
INSTEAD OF DELETE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE CartaoTrabalho FROM CartaoTrabalho INNER JOIN DELETED ON CartaoTrabalho.ID_Funcionario = DELETED.ID_Funcionario;
            UPDATE Departamento SET ID_Gerente = NULL FROM Departamento INNER JOIN DELETED ON Departamento.ID_Gerente = DELETED.ID_Funcionario;
            DELETE Engenheiro FROM Engenheiro INNER JOIN DELETED ON Engenheiro.ID_Funcionario = DELETED.ID_Funcionario;
            
            DELETE AtribuicaoCamiao FROM AtribuicaoCamiao INNER JOIN Motorista ON AtribuicaoCamiao.ID_Motorista = Motorista.ID_Motorista INNER JOIN DELETED ON Motorista.ID_Funcionario = DELETED.ID_Funcionario;
            DELETE Motorista FROM Motorista INNER JOIN DELETED ON Motorista.ID_Funcionario = DELETED.ID_Funcionario;
            
            UPDATE ProdutoMDF SET ID_Operario = NULL FROM ProdutoMDF INNER JOIN Operario ON ProdutoMDF.ID_Operario = Operario.ID_Operario INNER JOIN DELETED ON Operario.ID_Funcionario = DELETED.ID_Funcionario;
            
            DELETE Operario FROM Operario INNER JOIN DELETED ON Operario.ID_Funcionario = DELETED.ID_Funcionario;
            DELETE UserLogin FROM UserLogin INNER JOIN DELETED ON UserLogin.ID_Funcionario = DELETED.ID_Funcionario;
            
            DELETE Funcionario FROM Funcionario INNER JOIN DELETED ON Funcionario.ID_Funcionario = DELETED.ID_Funcionario;
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

