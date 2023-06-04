use MyLocalDB
go

DROP PROCEDURE AddFuncionario;
DROP PROCEDURE RemoveFuncionario;
DROP PROCEDURE GetAverageAge;
DROP PROCEDURE ApplyBonus;
DROP PROCEDURE SearchFuncionario;
DROP PROCEDURE GetFuncionariosOrderedBySalario;
DROP PROCEDURE GetFuncionariosOrderedByAge;
DROP PROCEDURE GetFuncionariosOrderedByDataNascimento;
DROP PROCEDURE GetFuncionariosOrderedByDataInicioTrabalho;
DROP PROCEDURE GenerateCartaoTrabalho;
DROP PROCEDURE AssociateCartaoToFuncionario;
DROP PROCEDURE sp_GetCartaoTrabalhoOrdered;
DROP PROCEDURE SearchCartaoTrabalho;
DROP PROCEDURE SearchCartaoTrabalhoByName;
DROP PROCEDURE DeleteCartaoTrabalho;
DROP PROCEDURE AddDepartamento; 
DROP PROCEDURE RemoveDepartamento; 
DROP PROCEDURE AddEngenheiroManager;
DROP PROCEDURE RemoveEngenheiroManager;
DROP PROCEDURE SearchEngenheiro;
DROP PROCEDURE GetHashedPassword;
DROP PROCEDURE InsertAtribuicaoCamiao;

go


------------------------------------Funcionario--------------------
CREATE PROCEDURE AddFuncionario
    @Nome VARCHAR(256),
    @Salario DECIMAL(10, 2),
    @Sexo CHAR(1),
    @Telemovel VARCHAR(32),
    @Morada VARCHAR(256),
    @Data_nascimento DATE,
    @Email VARCHAR(256),
    @Data_inicio_trabalho DATE,
    @Type VARCHAR(256),
    @Curso VARCHAR(256) = NULL,
    @Data_Renovacao_Carta DATE = NULL,
    @Carta_Especial CHAR(1) = NULL,
    @Turno CHAR(1) = NULL,
    @Especializacao VARCHAR(256) = NULL
AS
BEGIN
    IF @Type NOT IN ('Motorista', 'Operario', 'Engenheiro')
        RAISERROR('Invalid Type.', 16, 1)
    IF @Sexo NOT IN ('M', 'F')
        RAISERROR('Invalid Sexo.', 16, 1)
    IF @Carta_Especial NOT IN ('Y', 'N') AND @Type = 'Motorista'
        RAISERROR('Invalid Carta_Especial.', 16, 1)
    IF @Turno NOT IN ('D', 'N') AND @Type = 'Operario'
        RAISERROR('Invalid Turno.', 16, 1)

    DECLARE @ID_Funcionario INT;
    SELECT @ID_Funcionario = dbo.GetNextFuncionarioID();

    
    BEGIN TRY
	BEGIN TRANSACTION;
        INSERT INTO Funcionario(ID_Funcionario, Nome, Salario, Sexo, Telemovel, Morada, Data_nascimento, Email, Data_inicio_trabalho, Type)
        VALUES(@ID_Funcionario, @Nome, @Salario, @Sexo, @Telemovel, @Morada, @Data_nascimento, @Email, @Data_inicio_trabalho, @Type);

        IF @Type = 'Motorista'
        BEGIN
            INSERT INTO Motorista(ID_Motorista, ID_Funcionario, Data_Renovacao_Carta, Carta_Especial)
            VALUES(@ID_Funcionario, @ID_Funcionario, @Data_Renovacao_Carta, @Carta_Especial);
        END
        ELSE IF @Type = 'Operario'
        BEGIN
            INSERT INTO Operario(ID_Operario, ID_Funcionario, Turno, Especializacao)
            VALUES(@ID_Funcionario, @ID_Funcionario, @Turno, @Especializacao);
        END
        ELSE IF @Type = 'Engenheiro'
        BEGIN
            INSERT INTO Engenheiro(ID_Engenheiro, ID_Funcionario, Curso)
            VALUES(@ID_Funcionario, @ID_Funcionario, @Curso);
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT;
        SELECT @ErrMsg = ERROR_MESSAGE(),
               @ErrSeverity = ERROR_SEVERITY();

        RAISERROR(@ErrMsg, @ErrSeverity, 1);
    END CATCH;
END;
go

go
CREATE PROCEDURE RemoveFuncionario
(
    @ID_Funcionario INT
)
AS
BEGIN
    DELETE FROM Funcionario
    WHERE ID_Funcionario = @ID_Funcionario
END
go

go
CREATE PROCEDURE GetAverageAge
AS
BEGIN
    SELECT 
        AVG(Age) as AverageAge
    FROM 
        FuncionarioWithAge
END
go

-- Bonus Salary given the work experience 
go
CREATE PROCEDURE ApplyBonus
AS
BEGIN
    SELECT 
        ID_Funcionario, 
        Nome, 
        Salario, 
        Salario + Salario * (dbo.GetBonusPercent(Experience) / 100.0) AS SalarioWithBonus,
        Experience,
        dbo.GetBonusPercent(Experience) as BonusPercentage
    FROM 
        (SELECT *,
            DATEPART(year, GETDATE()) - DATEPART(year, Data_inicio_trabalho) -
            CASE 
                WHEN DATEPART(month, GETDATE()) < DATEPART(month, Data_inicio_trabalho) 
                    OR (DATEPART(month, GETDATE()) = DATEPART(month, Data_inicio_trabalho) 
                    AND DATEPART(day, GETDATE()) < DATEPART(day, Data_inicio_trabalho)) 
                THEN 1 
                ELSE 0 
            END as Experience
        FROM Funcionario) AS FuncionarioWithExperience
END;
go
-- Search Funcionario
go
CREATE PROCEDURE SearchFuncionario
    @Search VARCHAR(256) = NULL
AS
BEGIN
    SELECT 
        ID_Funcionario, 
        Nome, 
        Salario, 
        Sexo, 
        Telemovel, 
        Morada, 
        Data_nascimento, 
        Email, 
        Data_inicio_trabalho, 
        Type,
        DATEPART(year, GETDATE()) - DATEPART(year, Data_nascimento) -
        CASE 
            WHEN DATEPART(month, GETDATE()) < DATEPART(month, Data_nascimento) 
                OR (DATEPART(month, GETDATE()) = DATEPART(month, Data_nascimento) 
                AND DATEPART(day, GETDATE()) < DATEPART(day, Data_nascimento)) 
            THEN 1 
            ELSE 0 
        END as Age
    FROM 
        Funcionario
    WHERE 
        (ID_Funcionario = TRY_CAST(@Search AS INT))
        OR (Nome LIKE '%' + @Search + '%')
END;
go
--------------------------------------ORDER BY-----------------------------
go
CREATE PROCEDURE GetFuncionariosOrderedBySalario
AS
BEGIN
    SELECT 
        ID_Funcionario, 
        Nome, 
        Salario, 
        Sexo, 
        Telemovel, 
        Morada, 
        Data_nascimento, 
        Email, 
        Data_inicio_trabalho, 
        Type,
        DATEPART(year, GETDATE()) - DATEPART(year, Data_nascimento) -
        CASE 
            WHEN DATEPART(month, GETDATE()) < DATEPART(month, Data_nascimento) 
                OR (DATEPART(month, GETDATE()) = DATEPART(month, Data_nascimento) 
                AND DATEPART(day, GETDATE()) < DATEPART(day, Data_nascimento)) 
            THEN 1 
            ELSE 0 
        END as Age
    FROM 
        Funcionario
    ORDER BY
        Salario ASC;
END;
go

CREATE PROCEDURE GetFuncionariosOrderedByAge
AS
BEGIN
    SELECT 
        ID_Funcionario, 
        Nome, 
        Salario, 
        Sexo, 
        Telemovel, 
        Morada, 
        Data_nascimento, 
        Email, 
        Data_inicio_trabalho, 
        Type,
        DATEPART(year, GETDATE()) - DATEPART(year, Data_nascimento) -
        CASE 
            WHEN DATEPART(month, GETDATE()) < DATEPART(month, Data_nascimento) 
                OR (DATEPART(month, GETDATE()) = DATEPART(month, Data_nascimento) 
                AND DATEPART(day, GETDATE()) < DATEPART(day, Data_nascimento)) 
            THEN 1 
            ELSE 0 
        END as Age
    FROM 
        Funcionario
    ORDER BY
        Age ASC;
END;
go


CREATE PROCEDURE GetFuncionariosOrderedByDataNascimento
AS
BEGIN
    SELECT 
        ID_Funcionario, 
        Nome, 
        Salario, 
        Sexo, 
        Telemovel, 
        Morada, 
        Data_nascimento, 
        Email, 
        Data_inicio_trabalho, 
        Type,
        DATEPART(year, GETDATE()) - DATEPART(year, Data_nascimento) -
        CASE 
            WHEN DATEPART(month, GETDATE()) < DATEPART(month, Data_nascimento) 
                OR (DATEPART(month, GETDATE()) = DATEPART(month, Data_nascimento) 
                AND DATEPART(day, GETDATE()) < DATEPART(day, Data_nascimento)) 
            THEN 1 
            ELSE 0 
        END as Age
    FROM 
        Funcionario
    ORDER BY
        Data_nascimento ASC;
END;
go

CREATE PROCEDURE GetFuncionariosOrderedByDataInicioTrabalho
AS
BEGIN
    SELECT 
        ID_Funcionario, 
        Nome, 
        Salario, 
        Sexo, 
        Telemovel, 
        Morada, 
        Data_nascimento, 
        Email, 
        Data_inicio_trabalho, 
        Type,
        DATEPART(year, GETDATE()) - DATEPART(year, Data_nascimento) -
        CASE 
            WHEN DATEPART(month, GETDATE()) < DATEPART(month, Data_nascimento) 
                OR (DATEPART(month, GETDATE()) = DATEPART(month, Data_nascimento) 
                AND DATEPART(day, GETDATE()) < DATEPART(day, Data_nascimento)) 
            THEN 1 
            ELSE 0 
        END as Age
    FROM 
        Funcionario
    ORDER BY
        Data_inicio_trabalho ASC;
END;
go

--------------------------------------CartaoTrabalho-----------------------------

--Produce CartaoTrabalho
CREATE PROCEDURE GenerateCartaoTrabalho
AS
BEGIN
    DECLARE @ID_CartaoTrabalho INT;
    DECLARE @Data_Validade DATE;
    DECLARE @Data_Emissao DATE;

    SELECT @Data_Emissao = GETDATE();
    SELECT @Data_Validade = DATEADD(year, 4, @Data_Emissao);

    SELECT @ID_CartaoTrabalho = ISNULL(MAX(ID_CartaoTrabalho), 0) + 1 FROM CartaoTrabalho;

    BEGIN TRY
        BEGIN TRANSACTION;
            INSERT INTO CartaoTrabalho(ID_CartaoTrabalho, Data_Validade, Data_Emissao)
            VALUES(@ID_CartaoTrabalho, @Data_Validade, @Data_Emissao);
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT;
        SELECT @ErrMsg = ERROR_MESSAGE(),
               @ErrSeverity = ERROR_SEVERITY();
        RAISERROR(@ErrMsg, @ErrSeverity, 1);
    END CATCH;
END;
go

-- Associate it to a Funcionario
CREATE PROCEDURE AssociateCartaoToFuncionario
    @ID_CartaoTrabalho INT,
    @ID_Funcionario INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Set any active CartaoTraablho of Funcionario to inactive
            UPDATE CartaoTrabalho
            SET ID_Funcionario = NULL
            WHERE ID_Funcionario = @ID_Funcionario AND dbo.fn_GetEstado(Data_Validade) = 'A';
            
            UPDATE CartaoTrabalho
            SET ID_Funcionario = @ID_Funcionario
            WHERE ID_CartaoTrabalho = @ID_CartaoTrabalho;
            
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT;
        SELECT @ErrMsg = ERROR_MESSAGE(),
               @ErrSeverity = ERROR_SEVERITY();
        RAISERROR(@ErrMsg, @ErrSeverity, 1);
    END CATCH;
END;
go

-- Order by ID
CREATE PROCEDURE sp_GetCartaoTrabalhoOrdered
AS
BEGIN
    SELECT * FROM vw_CartaoTrabalho ORDER BY ID_Funcionario ASC;
END
go

--Search Cartao
CREATE PROCEDURE SearchCartaoTrabalho
    @SearchTerm VARCHAR(50)
AS
BEGIN
    IF ISNUMERIC(@SearchTerm) = 1
        SELECT ct.ID_Funcionario, f.Nome as Funcionario, ct.ID_CartaoTrabalho, dbo.fn_GetEstado(ct.Data_Validade) as Estado, ct.Data_Validade, ct.Data_Emissao
        FROM CartaoTrabalho ct
        LEFT JOIN Funcionario f ON f.ID_Funcionario = ct.ID_Funcionario
        WHERE ct.ID_Funcionario = CAST(@SearchTerm AS INT);
        
    ELSE
        SELECT ct.ID_Funcionario, f.Nome as Funcionario, ct.ID_CartaoTrabalho, dbo.fn_GetEstado(ct.Data_Validade) as Estado, ct.Data_Validade, ct.Data_Emissao
        FROM CartaoTrabalho ct
        LEFT JOIN Funcionario f ON f.ID_Funcionario = ct.ID_Funcionario
        WHERE dbo.fn_GetEstado(ct.Data_Validade) = @SearchTerm;
END;
go

--Search by name
CREATE PROCEDURE SearchCartaoTrabalhoByName
    @SearchTerm VARCHAR(50)
AS
BEGIN
    SELECT ct.ID_Funcionario, f.Nome as Funcionario, ct.ID_CartaoTrabalho, dbo.fn_GetEstado(ct.Data_Validade) as Estado, ct.Data_Validade, ct.Data_Emissao
    FROM CartaoTrabalho ct
    LEFT JOIN Funcionario f ON f.ID_Funcionario = ct.ID_Funcionario
    WHERE f.Nome LIKE '%' + @SearchTerm + '%';
END;
go

--
CREATE PROCEDURE DeleteCartaoTrabalho
    @ID INT
AS
BEGIN
    DELETE FROM CartaoTrabalho WHERE ID_CartaoTrabalho = @ID;
END
go


--------------------------------------Departamento-----------------------------
CREATE PROCEDURE AddDepartamento 
    @Nome VARCHAR (256),
    @Orcamento DECIMAL(10, 2),
    @TaxaEmissao DECIMAL(10, 2),
    @TaxaReciclagem DECIMAL(10, 2),
    @ResiduoGerado DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Departamento(ID_Departamento, Nome, Orcamento, TaxaEmissao, TaxaReciclagem, ResiduoGerado)
    VALUES (dbo.NextDepartamentoID(), @Nome, @Orcamento, @TaxaEmissao, @TaxaReciclagem, @ResiduoGerado)
END
go

CREATE PROCEDURE RemoveDepartamento
    @Nome_Departamento NVARCHAR(128)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Departamento WHERE Nome = @Nome_Departamento)
    BEGIN
        DELETE FROM Departamento WHERE Nome = @Nome_Departamento
    END
    ELSE
    BEGIN
        RAISERROR('The department does not exist.', 16, 1)
    END
END

go

CREATE PROCEDURE AddEngenheiroManager
    @ID_Departamento INT,
    @ID_Engenheiro INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Departamento WHERE ID_Departamento = @ID_Departamento AND ID_Gerente IS NOT NULL)
    BEGIN
        IF EXISTS (SELECT 1 FROM Engenheiro WHERE ID_Engenheiro = @ID_Engenheiro)
        BEGIN
            DECLARE @ID_Funcionario INT;
            SELECT @ID_Funcionario = ID_Funcionario FROM Engenheiro WHERE ID_Engenheiro = @ID_Engenheiro;

            UPDATE Departamento
            SET ID_Gerente = @ID_Funcionario
            WHERE ID_Departamento = @ID_Departamento;
        END
        ELSE
        BEGIN
            RAISERROR('The person is not an engineer.', 16, 1)
        END
    END
    ELSE
    BEGIN
        RAISERROR('The department already has a manager.', 16, 1)
    END
END
go

CREATE PROCEDURE RemoveEngenheiroManager
    @ID_Departamento INT
AS
BEGIN
    UPDATE Departamento
    SET ID_Gerente = NULL
    WHERE ID_Departamento = @ID_Departamento
END
go

CREATE PROCEDURE SearchEngenheiro
    @Nome VARCHAR(256)
AS
BEGIN
    SELECT F.ID_Funcionario, F.Nome, E.ID_Engenheiro, E.Curso, D.Nome as Nome_Departamento
    FROM Funcionario F
    INNER JOIN Engenheiro E ON F.ID_Funcionario = E.ID_Funcionario
    LEFT JOIN Departamento D ON F.ID_Funcionario = D.ID_Gerente
    WHERE F.Nome LIKE '%' + @Nome + '%' AND F.Type = 'Engenheiro'
END
go


--------------------------------------HashedPassword-----------------------------
CREATE PROCEDURE GetHashedPassword
    @Username VARCHAR(256)
AS
BEGIN
    SELECT HashedPassword, Salt
    FROM UserLogin
    WHERE Username = @Username
END
go

-------------------------------------AtribuicaoCamiao------------------------------------
CREATE PROCEDURE InsertAtribuicaoCamiao
    @ID_Camiao INT,
    @ID_Encomenda INT,
    @ID_Motorista INT,
    @Data_Inicio DATE,
    @Distancia_Percorrida INT,
    @Peso_Transportado INT,
    @Data_Fim DATE
AS
BEGIN
    DECLARE @Atribuicao_ID INT;
    SET @Atribuicao_ID = dbo.GetNextAtribuicaoID();

    INSERT INTO AtribuicaoCamiao (
        Atribuicao_ID, 
        ID_Camiao, 
        ID_Encomenda, 
        ID_Motorista, 
        Data_Inicio, 
        Distancia_Percorrida, 
        Peso_Transportado, 
        Data_Fim, 
        Estado
    )
    VALUES (
        @Atribuicao_ID, 
        @ID_Camiao, 
        @ID_Encomenda, 
        @ID_Motorista, 
        @Data_Inicio, 
        @Distancia_Percorrida, 
        @Peso_Transportado, 
        @Data_Fim,
		--default Estado
        'Y'
    )
END;


