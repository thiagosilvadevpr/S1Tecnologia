SELECT
	CODIGO,
	ISNULL(LTRIM(UPPER(RAZAO)), '') RAZAO
FROM CLIFORN
WHERE RAZAO <> ''
ORDER BY RAZAO