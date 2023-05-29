use MyLocalDB
go

DELETE FROM AtribuicaoCamiao;
DELETE FROM Operario;
DELETE FROM Encomenda;
DELETE FROM Cliente;
DELETE FROM ProdutoMDF;
DELETE FROM LoteMadeira;
DELETE FROM FornecedorMadeira;
DELETE FROM Camiao;
DELETE FROM Motorista;
DELETE FROM Engenheiro;
DELETE FROM Departamento;
DELETE FROM CartaoTrabalho;
DELETE FROM Funcionario;

INSERT INTO Funcionario VALUES (1, 'John Doe', 'Engenheiro', 5000, 'M', '123456789', 'john.doe@example.com', '2023-01-01', 1, 'Engenheiro');
INSERT INTO Funcionario VALUES (2, 'Jane Smith', 'Operario', 3000, 'F', '234567890', 'jane.smith@example.com', '2023-02-01', 2, 'Operario');
INSERT INTO Funcionario VALUES (3, 'Bob Johnson', 'Motorista', 3500, 'M', '345678901', 'bob.johnson@example.com', '2023-03-01', 3, 'Motorista');
INSERT INTO Funcionario VALUES (4, 'Alice Davis', 'Engenheiro', 6000, 'F', '456789012', 'alice.davis@example.com', '2023-04-01', 4, 'Engenheiro');
INSERT INTO Funcionario VALUES (5, 'Charlie Miller', 'Operario', 2800, 'M', '567890123', 'charlie.miller@example.com', '2023-05-01', 5, 'Operario');

INSERT INTO CartaoTrabalho VALUES (1, '2024-12-31', 'A', 1);
INSERT INTO CartaoTrabalho VALUES (2, '2024-12-31', 'A', 2);
INSERT INTO CartaoTrabalho VALUES (3, '2024-12-31', 'A', 3);
INSERT INTO CartaoTrabalho VALUES (4, '2024-12-31', 'A', 4);
INSERT INTO CartaoTrabalho VALUES (5, '2024-12-31', 'A', 5);

INSERT INTO Departamento VALUES (1, 1, 'Producao', 0.05, 0.1, 100);
INSERT INTO Departamento VALUES (2, 2, 'Logistica', 0.03, 0.08, 200);
INSERT INTO Departamento VALUES (3, 3, 'Engenharia', 0.02, 0.06, 150);
INSERT INTO Departamento VALUES (4, 4, 'Operacoes', 0.04, 0.07, 250);
INSERT INTO Departamento VALUES (5, 5, 'Recursos Humanos', 0.01, 0.05, 50);

INSERT INTO Engenheiro VALUES (1, 1, 'Engenharia de Producao');
INSERT INTO Engenheiro VALUES (2, 4, 'Engenharia Mecanica');

INSERT INTO Motorista VALUES (1, 3, 'Y');
INSERT INTO Motorista VALUES (2, 4, 'N');

INSERT INTO Camiao VALUES (1, 'ABC1234', 2000);
INSERT INTO Camiao VALUES (2, 'BCD2345', 2500);
INSERT INTO Camiao VALUES (3, 'CDE3456', 2200);
INSERT INTO Camiao VALUES (4, 'DEF4567', 2300);
INSERT INTO Camiao VALUES (5, 'EFG5678', 2400);

INSERT INTO FornecedorMadeira VALUES (1, 'Fornecedor A', 'ISO 9001');
INSERT INTO FornecedorMadeira VALUES (2, 'Fornecedor B', 'ISO 14001');
INSERT INTO FornecedorMadeira VALUES (3, 'Fornecedor C', 'ISO 9001');
INSERT INTO FornecedorMadeira VALUES (4, 'Fornecedor D', 'ISO 14001');
INSERT INTO FornecedorMadeira VALUES (5, 'Fornecedor E', 'ISO 9001');

INSERT INTO LoteMadeira VALUES (1, 'Tipo A', 1, 0.8, '2023-01-01');
INSERT INTO LoteMadeira VALUES (2, 'Tipo B', 2, 0.9, '2023-02-01');
INSERT INTO LoteMadeira VALUES (3, 'Tipo C', 3, 0.85, '2023-03-01');
INSERT INTO LoteMadeira VALUES (4, 'Tipo D', 4, 0.75, '2023-04-01');
INSERT INTO LoteMadeira VALUES (5, 'Tipo E', 5, 0.95, '2023-05-01');

INSERT INTO ProdutoMDF VALUES (1, 1, 2, 'Completo', '2023-06-01');
INSERT INTO ProdutoMDF VALUES (2, 2, 5, 'Incompleto', '2023-06-02');
INSERT INTO ProdutoMDF VALUES (3, 3, 2, 'Completo', '2023-06-03');
INSERT INTO ProdutoMDF VALUES (4, 4, 5, 'Incompleto', '2023-06-04');
INSERT INTO ProdutoMDF VALUES (5, 5, 2, 'Completo', '2023-06-05');

INSERT INTO Cliente VALUES (1, 'Cliente A', 'Rua A, 123', '123456789');
INSERT INTO Cliente VALUES (2, 'Cliente B', 'Rua B, 234', '234567890');
INSERT INTO Cliente VALUES (3, 'Cliente C', 'Rua C, 345', '345678901');
INSERT INTO Cliente VALUES (4, 'Cliente D', 'Rua D, 456', '456789012');
INSERT INTO Cliente VALUES (5, 'Cliente E', 'Rua E, 567', '567890123');

INSERT INTO Encomenda VALUES (1, 1, 1, 'Y', 'Rua A, 123', '2023-06-10');
INSERT INTO Encomenda VALUES (2, 2, 2, 'N', 'Rua B, 234', '2023-06-11');
INSERT INTO Encomenda VALUES (3, 3, 3, 'Y', 'Rua C, 345', '2023-06-12');
INSERT INTO Encomenda VALUES (4, 4, 4, 'N', 'Rua D, 456', '2023-06-13');
INSERT INTO Encomenda VALUES (5, 5, 5, 'Y', 'Rua E, 567', '2023-06-14');

INSERT INTO Operario VALUES (1, 2, 'D');
INSERT INTO Operario VALUES (2, 5, 'N');

INSERT INTO AtribuicaoCamiao VALUES (1, 1, 1, 1, '2023-06-20', '2023-06-21', 'Y');
INSERT INTO AtribuicaoCamiao VALUES (2, 2, 2, 2, '2023-06-22', '2023-06-23', 'N');
INSERT INTO AtribuicaoCamiao VALUES (3, 3, 3, 1, '2023-06-24', '2023-06-25', 'Y');
INSERT INTO AtribuicaoCamiao VALUES (4, 4, 4, 2, '2023-06-26', '2023-06-27', 'N');
INSERT INTO AtribuicaoCamiao VALUES (5, 5, 5, 1, '2023-06-28', '2023-06-29', 'Y');
