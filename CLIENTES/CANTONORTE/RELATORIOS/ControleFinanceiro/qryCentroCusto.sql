SELECT DISTINCT
	CODIGO,
	CAST(CODIGO as varchar(15)) + ' - ' + NOME NOME

FROM GCENTROCUSTO GCC
WHERE CODIGO IN (
       SELECT DISTINCT CENTROCUSTO FROM LANCAMENTOS)

ORDER BY NOME