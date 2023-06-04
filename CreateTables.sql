use MyLocalDB
go

EXEC SearchCamiaoByMatricula @Matricula = 'AAA123'

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
DROP TABLE IF EXISTS UserLogin;
DROP TABLE IF EXISTS Funcionario;

CREATE TABLE Funcionario (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(256) NOT NULL,
    Salario DECIMAL(10, 2) CHECK (Salario>740) NOT NULL,
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F')) NOT NULL,
    Telemovel VARCHAR(32),
	Morada VARCHAR(256),
	Data_nascimento DATE NOT NULL,
    Email VARCHAR(256) UNIQUE,
    Data_inicio_trabalho DATE NOT NULL,
    Type VARCHAR(256) NOT NULL,
    CHECK (Type IN ('Engenheiro', 'Motorista', 'Operario'))
);

CREATE TABLE CartaoTrabalho (
    ID_CartaoTrabalho INT PRIMARY KEY,
    Data_Validade DATE,
	Data_Emissao DATE,
    ID_Funcionario INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
	Nome VARCHAR (256) UNIQUE,
	Orcamento DECIMAL(10, 2),
    ID_Gerente INT,
    TaxaEmissao DECIMAL(10, 2),
    TaxaReciclagem DECIMAL(10, 2),
    ResiduoGerado DECIMAL(10, 2),
    FOREIGN KEY (ID_Gerente) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Engenheiro (
    ID_Engenheiro INT PRIMARY KEY,
    ID_Funcionario INT,
    Curso VARCHAR(256) NOT NULL,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Motorista (
    ID_Motorista INT PRIMARY KEY,
    ID_Funcionario INT,
	Data_Renovacao_Carta DATE,
    Carta_Especial CHAR(1) CHECK (Carta_Especial IN ('Y', 'N')),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Camiao (
    ID_Camiao INT PRIMARY KEY,
    Matricula VARCHAR(256) UNIQUE,
	Ano_Fabricado INT,
	Velocidade_maxima INT CHECK(Velocidade_maxima >= 0),
	Carga_maxima INT CHECK(Carga_maxima >= 0),
	Distancia_Percorrida INT CHECK(Distancia_Percorrida >= 0),
    Peso DECIMAL(10, 2)
);

CREATE TABLE FornecedorMadeira (
    ID_Fornecedor INT PRIMARY KEY,
    Nome VARCHAR(256),
	Morada VARCHAR(256),
	Telemovel VARCHAR(32),
	Data_Inicio_Contrato DATE,
    Certificacao VARCHAR(256)
);

CREATE TABLE LoteMadeira (
    ID_Lote INT PRIMARY KEY,
    Tipo VARCHAR(256),
    ID_Fornecedor INT,
	Peso INT,
	Preco DECIMAL (10,2),
	Morada VARCHAR(256),
    Qualidade DECIMAL(10, 2),
    DataRecebimento DATE,
    FOREIGN KEY (ID_Fornecedor) REFERENCES FornecedorMadeira(ID_Fornecedor)
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(256),
    Morada VARCHAR(256),
	Quantidade_Encomendas_Pedidas INT,
    Telemovel VARCHAR(32)
);

CREATE TABLE Operario (
    ID_Operario INT PRIMARY KEY,
    ID_Funcionario INT,
    Turno CHAR(1) CHECK (Turno IN ('D', 'N')),
	Especializacao VARCHAR(256),
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE ProdutoMDF (
    ID_MDF INT PRIMARY KEY,
    ID_Lote INT,
	Peso INT,
	Preco DECIMAL (10,2),
    ID_Operario INT,
    EstagioProducao VARCHAR(256),
    DataProducao DATE,
    FOREIGN KEY (ID_Lote) REFERENCES LoteMadeira(ID_Lote),
	FOREIGN KEY (ID_Operario) REFERENCES Operario(ID_Operario)
);

CREATE TABLE Encomenda (
    ID_Encomenda INT PRIMARY KEY,
    ID_Cliente INT,
    ID_MDF INT,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')),
    Morada VARCHAR(256),
    Data_Pedido DATE,
	Data_Prevista_Entrega DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_MDF) REFERENCES ProdutoMDF(ID_MDF)
);

CREATE TABLE AtribuicaoCamiao (
    Atribuicao_ID INT PRIMARY KEY,
    ID_Camiao INT,
    ID_Encomenda INT,
    ID_Motorista INT,
    Data_Inicio DATE,
	Distancia_Percorrida INT CHECK (Distancia_Percorrida >= 0),
    Peso_Transportado INT,
    Data_Fim DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), 
    FOREIGN KEY (ID_Camiao) REFERENCES Camiao(ID_Camiao),
    FOREIGN KEY (ID_Encomenda) REFERENCES Encomenda(ID_Encomenda),
    FOREIGN KEY (ID_Motorista) REFERENCES Motorista(ID_Motorista)
);

CREATE TABLE UserLogin (
    ID_User INT PRIMARY KEY,
    Username VARCHAR(256) UNIQUE NOT NULL,
    HashedPassword VARCHAR(256) NOT NULL,
    Salt VARBINARY(16),
);
