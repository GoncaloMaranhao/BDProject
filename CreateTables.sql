use MyLocalDB
go

DROP TABLE IF EXISTS AtribuicaoCamiao;
DROP TABLE IF EXISTS Operario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Encomenda;
DROP TABLE IF EXISTS ProdutoMDF;
DROP TABLE IF EXISTS LoteMadeira;
DROP TABLE IF EXISTS FornecedorMadeira;
DROP TABLE IF EXISTS Camiao;
DROP TABLE IF EXISTS Motorista;
DROP TABLE IF EXISTS Engenheiro;
DROP TABLE IF EXISTS Departamento;
DROP TABLE IF EXISTS CartaoTrabalho;
DROP TABLE IF EXISTS Funcionario;

CREATE TABLE Funcionario (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Funcao VARCHAR(255),
    Salario DECIMAL(10, 2) CHECK (Salario>=0),
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F')),
    Telemovel VARCHAR(15),
    Email VARCHAR(255),
    Data_inicio_trabalho DATE,
    ID_Departamento INT,
    Type VARCHAR(255) NOT NULL,
    CHECK (Type IN ('Engenheiro', 'Motorista', 'Operario'))
);

CREATE TABLE CartaoTrabalho (
    ID_CartaoTrabalho INT PRIMARY KEY,
    Validade DATE,
    Estado CHAR(1) CHECK (Estado IN ('A', 'I')),
    ID_Funcionario INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    ID_Gerente INT,
    Tipo VARCHAR(255),
    TaxaEmissao DECIMAL(10, 2),
    TaxaReciclagem DECIMAL(10, 2),
    ResiduoGerado DECIMAL(10, 2),
    FOREIGN KEY (ID_Gerente) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Engenheiro (
    ID_Engenheiro INT PRIMARY KEY,
    ID_Funcionario INT,
    Curso VARCHAR(255),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Motorista (
    ID_Motorista INT PRIMARY KEY,
    ID_Funcionario INT,
    Carta_Especial CHAR(1) CHECK (Carta_Especial IN ('Y', 'N')),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Camiao (
    ID_Camiao INT PRIMARY KEY,
    Matricula VARCHAR(255),
    Peso DECIMAL(10, 2)
);

CREATE TABLE FornecedorMadeira (
    ID_Fornecedor INT PRIMARY KEY,
    Nome VARCHAR(255),
    Certificacao VARCHAR(255)
);

CREATE TABLE LoteMadeira (
    ID_Lote INT PRIMARY KEY,
    Tipo VARCHAR(255),
    ID_Fornecedor INT,
    Qualidade DECIMAL(10, 2),
    DataRecebimento DATE,
    FOREIGN KEY (ID_Fornecedor) REFERENCES FornecedorMadeira(ID_Fornecedor)
);

CREATE TABLE ProdutoMDF (
    ID_MDF INT PRIMARY KEY,
    ID_Lote INT,
    ID_Operario INT,
    EstagioProducao VARCHAR(255),
    DataProducao DATE,
    FOREIGN KEY (ID_Lote) REFERENCES LoteMadeira(ID_Lote)
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Telemovel VARCHAR(15)
);

CREATE TABLE Encomenda (
    ID_Encomenda INT PRIMARY KEY,
    ID_Cliente INT,
    ID_MDF INT,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')),
    Endereco VARCHAR(255),
    Data_Encomenda DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_MDF) REFERENCES ProdutoMDF(ID_MDF)
);


CREATE TABLE Operario (
    ID_Operario INT PRIMARY KEY,
    ID_Funcionario INT,
    Turno VARCHAR(255),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE AtribuicaoCamiao (
    Atribuicao_ID INT PRIMARY KEY,
    ID_Camiao INT,
    ID_Encomenda INT,
    ID_Motorista INT,
    Data_Inicio DATE,
    Data_Fim DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), 
    FOREIGN KEY (ID_Camiao) REFERENCES Camiao(ID_Camiao),
    FOREIGN KEY (ID_Encomenda) REFERENCES Encomenda(ID_Encomenda),
    FOREIGN KEY (ID_Motorista) REFERENCES Motorista(ID_Motorista)
);
