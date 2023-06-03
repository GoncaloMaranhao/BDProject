use myLocalDB
go

DROP VIEW FuncionarioWithAge;
DROP VIEW vw_CartaoTrabalho;

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
go


-- To see active or inactive cartao trabalho
CREATE VIEW vw_CartaoTrabalho
AS
SELECT ct.ID_Funcionario, f.Nome as Funcionario, ct.ID_CartaoTrabalho, dbo.fn_GetEstado(ct.Data_Validade) as Estado, ct.Data_Validade, ct.Data_Emissao
FROM CartaoTrabalho ct
JOIN Funcionario f ON f.ID_Funcionario = ct.ID_Funcionario;
go

