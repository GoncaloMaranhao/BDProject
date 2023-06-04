use MyLocalDB
go

DECLARE @motorista_id INT;
DECLARE @atribuicao_id INT;
DECLARE @data_fim DATE;

DECLARE update_assignment_cursor CURSOR FOR
SELECT M.ID_Motorista, AC.Atribuicao_ID, AC.Data_Fim
FROM Motorista M
JOIN AtribuicaoCamiao AC ON M.ID_Motorista = AC.ID_Motorista
WHERE AC.Estado = 'N' AND AC.Data_Fim < GETDATE();

OPEN update_assignment_cursor;
FETCH NEXT FROM update_assignment_cursor INTO @motorista_id, @atribuicao_id, @data_fim;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE AtribuicaoCamiao
    SET Estado = 'Y'
    WHERE Atribuicao_ID = @atribuicao_id;

    FETCH NEXT FROM update_assignment_cursor INTO @motorista_id, @atribuicao_id, @data_fim;
END;

CLOSE update_assignment_cursor;
DEALLOCATE update_assignment_cursor;
