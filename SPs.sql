IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_AddFuncionario')
BEGIN
    DROP PROCEDURE sp_AddFuncionario;
END
GO

CREATE PROCEDURE sp_AddFuncionario
    @ID_Funcionario INT,
    @Nome VARCHAR(255),
    @Funcao VARCHAR(255),
    @Salario DECIMAL(10, 2),
    @Sexo CHAR(1),
    @Telemovel VARCHAR(15),
    @Email VARCHAR(255),
    @Data_inicio_trabalho DATE,
    @ID_Departamento INT,
    @Type VARCHAR(255)
AS
BEGIN
    INSERT INTO Funcionario
    VALUES (@ID_Funcionario, @Nome, @Funcao, @Salario, @Sexo, @Telemovel, @Email, @Data_inicio_trabalho, @ID_Departamento, @Type)
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_DeleteCliente')
BEGIN
    DROP PROCEDURE sp_DeleteCliente;
END
GO

CREATE PROCEDURE sp_DeleteCliente
    @ID_Cliente INT
AS
BEGIN
    DELETE FROM Cliente
    WHERE ID_Cliente = @ID_Cliente
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_UpdateLoteMadeira')
BEGIN
    DROP PROCEDURE sp_UpdateLoteMadeira;
END
GO

CREATE PROCEDURE sp_UpdateLoteMadeira
    @ID_Lote INT,
    @Qualidade DECIMAL(10, 2)
AS
BEGIN
    UPDATE LoteMadeira
    SET Qualidade = @Qualidade
    WHERE ID_Lote = @ID_Lote
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_GetFuncionariosByType')
BEGIN
    DROP PROCEDURE sp_GetFuncionariosByType;
END
GO

CREATE PROCEDURE sp_GetFuncionariosByType
    @Type VARCHAR(255)
AS
BEGIN
    SELECT * FROM Funcionario
    WHERE Type = @Type
END;
GO
