use MyLocalDB
go

CREATE INDEX idx_Funcionario_ID 
ON Funcionario (ID_Funcionario);

CREATE INDEX idx_Funcionario_Nome
ON Funcionario (Nome);
