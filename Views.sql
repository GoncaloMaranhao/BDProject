use myLocalDB
go

DROP VIEW FuncionarioWithAge;
DROP VIEW vw_CartaoTrabalho;
DROP VIEW DepartmentView;
DROP VIEW EngenheiroView;
DROP VIEW ViewEngenheiros;
--DROP VIEW ViewEngenheirosNotManagers;

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
SELECT ct.ID_CartaoTrabalho, 
       f.Nome as Funcionario, 
       ct.ID_Funcionario, 
       dbo.fn_GetEstado(ct.Data_Validade) as Estado, 
       ct.Data_Validade, 
       ct.Data_Emissao
FROM CartaoTrabalho ct
LEFT JOIN Funcionario f ON f.ID_Funcionario = ct.ID_Funcionario;
go

CREATE VIEW DepartmentView AS
SELECT * FROM Departamento
go

CREATE VIEW EngenheiroView AS
SELECT * FROM Engenheiro
go

CREATE VIEW ViewEngenheiros AS
SELECT E.ID_Engenheiro, E.ID_Funcionario, F.Nome, D.Nome as DepartamentoNome
FROM Engenheiro E
JOIN Funcionario F ON E.ID_Funcionario = F.ID_Funcionario
LEFT JOIN Departamento D ON F.ID_Funcionario = D.ID_Gerente;
go

CREATE VIEW ViewEngenheirosNotManagers AS
SELECT E.ID_Engenheiro, E.ID_Funcionario, E.Curso, F.Nome, D.Nome as Nome_Departamento
FROM Engenheiro E
JOIN Funcionario F ON E.ID_Funcionario = F.ID_Funcionario
LEFT JOIN Departamento D ON F.ID_Funcionario = D.ID_Gerente
WHERE D.ID_Gerente IS NULL;
go

