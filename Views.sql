use myLocalDB
go

DROP VIEW FuncionarioWithAge;

go
CREATE VIEW FuncionarioWithAge AS
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