use MyLocalDB
go

DELETE FROM AtribuicaoCamiao;
DELETE FROM Encomenda;
DELETE FROM ProdutoMDF;
DELETE FROM Operario;
DELETE FROM LoteMadeira;
DELETE FROM Cliente;
DELETE FROM FornecedorMadeira;
DELETE FROM Camiao;
DELETE FROM Motorista;
DELETE FROM Engenheiro;
DELETE FROM Departamento;
DELETE FROM CartaoTrabalho;
DELETE FROM UserLogin;
DELETE FROM Funcionario;

INSERT INTO Funcionario VALUES (1, 'John Doe', 5000.00, 'M', '1234567890', '123 St, City, State', '1980-01-01', 'john@example.com', '1994-01-01', 'Engenheiro');
INSERT INTO Funcionario VALUES (2, 'Jane Smith', 6000.00, 'F', '0987654321', '456 St, City, State', '1985-01-01', 'jane@example.com', '2015-01-01', 'Motorista');
INSERT INTO Funcionario VALUES (3, 'James Brown', 5500.00, 'M', '1122334455', '789 St, City, State', '1982-01-01', 'james@example.com', '2017-01-01', 'Operario');
INSERT INTO Funcionario VALUES (4, 'Emma Stone', 6500.00, 'F', '6677889900', '321 St, City, State', '1983-01-01', 'emma@example.com', '2019-07-01', 'Engenheiro');
INSERT INTO Funcionario VALUES (5, 'William Turner', 6200.00, 'M', '2244668800', '654 St, City, State', '1981-01-01', 'william@example.com', '2020-06-01', 'Motorista');

INSERT INTO CartaoTrabalho VALUES (1, '2023-01-01', '2022-01-01', 'Active employee', 'A', 1);
INSERT INTO CartaoTrabalho VALUES (2, '2024-01-01', '2023-01-01', 'Active employee', 'A', 2);
INSERT INTO CartaoTrabalho VALUES (3, '2023-06-01', '2022-06-01', 'Active employee', 'A', 3);
INSERT INTO CartaoTrabalho VALUES (4, '2023-07-01', '2022-07-01', 'Active employee', 'A', 4);
INSERT INTO CartaoTrabalho VALUES (5, '2024-06-01', '2023-06-01', 'Active employee', 'A', 5);

INSERT INTO Departamento VALUES (1, 'Engineering', 50000.00, 1, 'Engineering', 1.2, 0.5, 10.0);
INSERT INTO Departamento VALUES (2, 'Operations', 60000.00, 3, 'Operations', 1.5, 0.6, 12.0);
INSERT INTO Departamento VALUES (3, 'Logistics', 70000.00, 2, 'Logistics', 1.3, 0.7, 15.0);
INSERT INTO Departamento VALUES (4, 'Quality Control', 80000.00, 4, 'Quality Control', 1.4, 0.8, 18.0);
INSERT INTO Departamento VALUES (5, 'HR', 90000.00, 5, 'HR', 1.1, 0.9, 20.0);

INSERT INTO Engenheiro VALUES (1, 1, 'Civil Engineering');
INSERT INTO Engenheiro VALUES (2, 2, 'Electrical Engineering');
INSERT INTO Engenheiro VALUES (3, 3, 'Mechanical Engineering');
INSERT INTO Engenheiro VALUES (4, 4, 'Chemical Engineering');
INSERT INTO Engenheiro VALUES (5, 5, 'Software Engineering');

INSERT INTO Motorista VALUES (1, 1, '2023-01-01', 'Y');
INSERT INTO Motorista VALUES (2, 2, '2024-01-01', 'N');
INSERT INTO Motorista VALUES (3, 3, '2023-06-01', 'Y');
INSERT INTO Motorista VALUES (4, 4, '2024-07-01', 'N');
INSERT INTO Motorista VALUES (5, 5, '2023-12-01', 'Y');

INSERT INTO Camiao VALUES (1, 'AAA123', 2010, 80, 2000, 50000, 15000.00);
INSERT INTO Camiao VALUES (2, 'BBB123', 2011, 85, 2100, 60000, 16000.00);
INSERT INTO Camiao VALUES (3, 'CCC123', 2012, 90, 2200, 70000, 17000.00);
INSERT INTO Camiao VALUES (4, 'DDD123', 2013, 95, 2300, 80000, 18000.00);
INSERT INTO Camiao VALUES (5, 'EEE123', 2014, 100, 2400, 90000, 19000.00);

INSERT INTO FornecedorMadeira VALUES (1, 'Supplier 1', '123 St, City, State', '1234567890', '2020-01-01', 'Certification 1');
INSERT INTO FornecedorMadeira VALUES (2, 'Supplier 2', '456 St, City, State', '0987654321', '2019-01-01', 'Certification 2');
INSERT INTO FornecedorMadeira VALUES (3, 'Supplier 3', '789 St, City, State', '1122334455', '2021-01-01', 'Certification 3');
INSERT INTO FornecedorMadeira VALUES (4, 'Supplier 4', '321 St, City, State', '6677889900', '2020-06-01', 'Certification 4');
INSERT INTO FornecedorMadeira VALUES (5, 'Supplier 5', '654 St, City, State', '2244668800', '2019-07-01', 'Certification 5');

INSERT INTO LoteMadeira VALUES (1, 'Type 1', 1, 1000, 1000.00, '123 St, City, State', 9.5, '2022-01-01');
INSERT INTO LoteMadeira VALUES (2, 'Type 2', 2, 1100, 1100.00, '456 St, City, State', 9.6, '2022-02-01');
INSERT INTO LoteMadeira VALUES (3, 'Type 3', 3, 1200, 1200.00, '789 St, City, State', 9.7, '2022-03-01');
INSERT INTO LoteMadeira VALUES (4, 'Type 4', 4, 1300, 1300.00, '321 St, City, State', 9.8, '2022-04-01');
INSERT INTO LoteMadeira VALUES (5, 'Type 5', 5, 1400, 1400.00, '654 St, City, State', 9.9, '2022-05-01');

INSERT INTO Cliente VALUES (1, 'Client 1', '123 St, City, State', 10, '1234567890');
INSERT INTO Cliente VALUES (2, 'Client 2', '456 St, City, State', 20, '0987654321');
INSERT INTO Cliente VALUES (3, 'Client 3', '789 St, City, State', 30, '1122334455');
INSERT INTO Cliente VALUES (4, 'Client 4', '321 St, City, State', 40, '6677889900');
INSERT INTO Cliente VALUES (5, 'Client 5', '654 St, City, State', 50, '2244668800');

INSERT INTO Operario VALUES (1, 1, 'D', 'Specialization 1');
INSERT INTO Operario VALUES (2, 2, 'N', 'Specialization 2');
INSERT INTO Operario VALUES (3, 3, 'D', 'Specialization 3');
INSERT INTO Operario VALUES (4, 4, 'N', 'Specialization 4');
INSERT INTO Operario VALUES (5, 5, 'D', 'Specialization 5');

INSERT INTO ProdutoMDF VALUES (1, 1, 100, 100.00, 1, 'Stage 1', '2022-06-01');
INSERT INTO ProdutoMDF VALUES (2, 2, 110, 110.00, 2, 'Stage 2', '2022-07-01');
INSERT INTO ProdutoMDF VALUES (3, 3, 120, 120.00, 3, 'Stage 3', '2022-08-01');
INSERT INTO ProdutoMDF VALUES (4, 4, 130, 130.00, 4, 'Stage 4', '2022-09-01');
INSERT INTO ProdutoMDF VALUES (5, 5, 140, 140.00, 5, 'Stage 5', '2022-10-01');

INSERT INTO Encomenda VALUES (1, 1, 1, 'Y', '123 St, City, State', '2022-11-01', '2023-01-01');
INSERT INTO Encomenda VALUES (2, 2, 2, 'N', '456 St, City, State', '2022-12-01', '2023-02-01');
INSERT INTO Encomenda VALUES (3, 3, 3, 'Y', '789 St, City, State', '2023-01-01', '2023-03-01');
INSERT INTO Encomenda VALUES (4, 4, 4, 'N', '321 St, City, State', '2023-02-01', '2023-04-01');
INSERT INTO Encomenda VALUES (5, 5, 5, 'Y', '654 St, City, State', '2023-03-01', '2023-05-01');

INSERT INTO AtribuicaoCamiao VALUES (1, 1, 1, 1, '2022-06-01', 10, 15, '2023-06-01', 'Y');
INSERT INTO AtribuicaoCamiao VALUES (2, 2, 2, 2, '2022-07-01', 13, 19, '2023-05-01', 'Y');
INSERT INTO AtribuicaoCamiao VALUES (3, 3, 3, 3, '2022-08-01', 20, 24, '2023-04-01', 'Y');
INSERT INTO AtribuicaoCamiao VALUES (4, 4, 4, 4, '2022-09-01', 27, 34, '2023-02-01', 'Y');
INSERT INTO AtribuicaoCamiao VALUES (5, 5, 5, 5, '2022-10-01', 35, 38, '2023-01-01', 'Y');

INSERT INTO UserLogin (ID_User, Username, HashedPassword, Funcao, ID_Funcionario) 
VALUES (1, 'admin1', 'hashedpassword1', 'Admin', 1),
 (2, 'eng1', 'hashedpassword2', 'Engenheiro', 4),
 (3, 'mot1', 'hashedpassword3', 'Motorista', 2),
 (4, 'opr1', 'hashedpassword4', 'Operario', 3),
 (5, 'admin2', 'hashedpassword5', 'Admin', 5);
