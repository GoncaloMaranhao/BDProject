use MyLocalDB
go

DROP PROCEDURE AddFuncionario;
go
CREATE PROCEDURE AddFuncionario
(
    @ID_Funcionario INT,
    @Nome VARCHAR(256),
    @Salario DECIMAL(10, 2),
    @Sexo CHAR(1),
    @Telemovel VARCHAR(32),
    @Morada VARCHAR(256),
    @Data_nascimento DATE,
    @Email VARCHAR(256),
    @Data_inicio_trabalho DATE,
    @Type VARCHAR(256)
)
AS
BEGIN
    INSERT INTO Funcionario 
    (
        ID_Funcionario, 
        Nome, 
        Salario, 
        Sexo, 
        Telemovel, 
        Morada, 
        Data_nascimento, 
        Email, 
        Data_inicio_trabalho, 
        Type
    ) 
    VALUES 
    (
        @ID_Funcionario, 
        @Nome, 
        @Salario, 
        @Sexo, 
        @Telemovel, 
        @Morada, 
        @Data_nascimento, 
        @Email, 
        @Data_inicio_trabalho, 
        @Type
    )
END
go

DROP PROCEDURE RemoveFuncionario;
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


EXEC AddFuncionario 
    @ID_Funcionario = 6, 
    @Nome = 'Sara', 
    @Salario = 5000.00, 
    @Sexo = 'M', 
    @Telemovel = '123-456-7890', 
    @Morada = '123 Main St', 
    @Data_nascimento = '1985-01-01', 
    @Email = 'johndoe@gmail.com', 
    @Data_inicio_trabalho = '2023-05-30', 
    @Type = 'Engenheiro'

---- Removing a Funcionario
--EXEC RemoveFuncionario @ID_Funcionario = 3
