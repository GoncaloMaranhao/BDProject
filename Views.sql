use myLocalDB
go

DROP VIEW FuncionarioWithAge;
DROP VIEW vw_CartaoTrabalho;
DROP VIEW DepartmentView;
DROP VIEW EngenheiroView;
DROP VIEW ViewEngenheiros;
DROP VIEW ViewEngenheirosNotManagers;
DROP VIEW FuncionarioView;
DROP VIEW ActiveAssignments;
DROP VIEW vw_AssignmentData;
DROP VIEW View_AtribuicaoCamiao;
DROP VIEW View_Atribuicao_Info;

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

--To refresh dataGrid in interface
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

CREATE VIEW FuncionarioView AS
SELECT * FROM Funcionario
go


CREATE VIEW ActiveAssignments AS
SELECT ac.Atribuicao_ID, f.Nome AS DriverName, c.Matricula AS TruckNumber, e.ID_Encomenda AS OrderID
FROM AtribuicaoCamiao ac
JOIN Funcionario f ON ac.ID_Motorista = f.ID_Funcionario
JOIN Camiao c ON ac.ID_Camiao = c.ID_Camiao
JOIN Encomenda e ON ac.ID_Encomenda = e.ID_Encomenda
WHERE ac.Estado = 'Y';
go

CREATE VIEW Vw_AssignmentData AS
SELECT
    F.ID_Funcionario AS DriverID,
    F.Nome AS DriverName,
    F.Type AS DriverType,
    M.ID_Motorista AS MotoristaID,
    C.ID_Camiao AS TruckID,
    C.Matricula AS TruckMatricula,
    C.Carga_maxima AS TruckCargaMaxima,
    E.ID_Encomenda AS OrderID,
    E.Morada AS OrderAddress,
    E.Data_Pedido AS OrderDate,
    E.Data_Prevista_Entrega AS OrderExpectedDelivery
FROM
    Funcionario F
    INNER JOIN Motorista M ON F.ID_Funcionario = M.ID_Funcionario
    INNER JOIN Camiao C ON 1=1
    INNER JOIN Encomenda E ON 1=1
WHERE
    F.Type = 'Motorista';
go

CREATE VIEW View_AtribuicaoCamiao AS
SELECT 
    AC.Atribuicao_ID,
    AC.ID_Camiao,
    AC.ID_Encomenda,
    AC.ID_Motorista,
    AC.Data_Inicio,
    AC.Data_Fim,
    AC.Estado,
    C.Matricula,
    C.Ano_Fabricado,
    C.Velocidade_maxima,
    C.Carga_maxima,
    C.Peso AS Peso_Camiao,
    M.ID_Funcionario AS ID_Funcionario_Motorista,
    E.ID_Cliente,
    E.ID_MDF,
    E.Estado AS Estado_Encomenda,
    E.Morada AS Morada_Encomenda,
    E.Data_Pedido,
    E.Data_Prevista_Entrega
FROM AtribuicaoCamiao AC
JOIN Camiao C ON AC.ID_Camiao = C.ID_Camiao
JOIN Motorista M ON AC.ID_Motorista = M.ID_Motorista
JOIN Encomenda E ON AC.ID_Encomenda = E.ID_Encomenda;
go

-- for search field in AtribuicaoCamiao
CREATE VIEW View_Atribuicao_Info AS
SELECT A.Atribuicao_ID, F.Nome AS Motorista, C.Matricula, A.ID_Encomenda
FROM AtribuicaoCamiao AS A
INNER JOIN Motorista AS M ON A.ID_Motorista = M.ID_Motorista
INNER JOIN Funcionario AS F ON M.ID_Funcionario = F.ID_Funcionario
INNER JOIN Camiao AS C ON A.ID_Camiao = C.ID_Camiao;

