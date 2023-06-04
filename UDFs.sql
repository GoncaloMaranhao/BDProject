use MyLocalDB
go

DROP FUNCTION GetNextFuncionarioID;
DROP FUNCTION dbo.GetBonusPercent;
DROP FUNCTION fn_GetEstado;
DROP FUNCTION NextDepartamentoID;
DROP FUNCTION GetNextAtribuicaoID;

-- Increment Funcionario ID
go
CREATE FUNCTION GetNextFuncionarioID()
RETURNS INT
AS
BEGIN
    DECLARE @nextID INT;
    SELECT @nextID = ISNULL(MAX(ID_Funcionario), 0) + 1 FROM Funcionario;
    RETURN @nextID;
END
go

-- Salary Bonus
go
CREATE FUNCTION dbo.GetBonusPercent (@YearsExperience INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @BonusPercent DECIMAL(10, 2);

    SET @BonusPercent = CASE 
        WHEN @YearsExperience <= 5 THEN 0
        WHEN @YearsExperience <= 10 THEN 5.0
		WHEN @YearsExperience <= 20 THEN 7.5
        ELSE 10.0
    END;

    RETURN @BonusPercent;
END;
go

-- Get Estado CartaoTrabalho 'A' for Active and 'I' for Inactive
CREATE FUNCTION fn_GetEstado(@Data_Validade DATE)
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @Estado CHAR(1)
    SET @Estado = (CASE WHEN @Data_Validade >= CAST(GETDATE() AS DATE) THEN 'A' ELSE 'I' END)
    RETURN @Estado
END
go

-- Increment ID_Departamento
CREATE FUNCTION NextDepartamentoID()
RETURNS INT
AS
BEGIN
    DECLARE @NextID INT;

    SELECT @NextID = ISNULL(MAX(ID_Departamento), 0) + 1 FROM Departamento;

    RETURN @NextID;
END
go

-- Increment ID Atribuicao_ID
CREATE FUNCTION GetNextAtribuicaoID ()
RETURNS INT
AS
BEGIN
    DECLARE @NextID INT;

    SELECT @NextID = ISNULL(MAX(Atribuicao_ID), 0) + 1 
    FROM AtribuicaoCamiao;

    RETURN @NextID;
END;
go

-- 



