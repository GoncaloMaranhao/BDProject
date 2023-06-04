use MyLocalDB
go


DROP INDEX idx_Funcionario_Nome ON Funcionario; 
DROP INDEX idx_CartaoTrabalho_ID_CartaoTrabalho ON CartaoTrabalho;
DROP INDEX idx_Matricula ON Camiao;

CREATE INDEX idx_Funcionario_Nome
ON Funcionario (Nome);
go

CREATE INDEX idx_CartaoTrabalho_ID_CartaoTrabalho
ON CartaoTrabalho (ID_CartaoTrabalho);

CREATE INDEX idx_Matricula
ON Camiao (Matricula);
