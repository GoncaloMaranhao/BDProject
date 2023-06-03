/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID_CartaoTrabalho]
      ,[Data_Validade]
      ,[Data_Emissao]
      ,[Observacoes]
      ,[ID_Funcionario]
  FROM [MyLocalDB].[dbo].[CartaoTrabalho]



  EXEC AssociateCartaoToFuncionario 6, 1;


  SELECT * FROM vw_CartaoTrabalho
