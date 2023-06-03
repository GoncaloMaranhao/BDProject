use MyLocalDB
go


DROP INDEX idx_Funcionario_Nome ON Funcionario; 

CREATE INDEX idx_Funcionario_Nome
ON Funcionario (Nome);
go