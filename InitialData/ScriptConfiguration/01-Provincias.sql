DROP TABLE IF EXISTS #ProvinciaTemp
SELECT
IdProvincia, NombreProvincia INTO #ProvinciaTemp
FROM(
VALUES 
(1, 'San Jose'),
(2, 'Alajuela'),
(3, 'Cartago'),
(4, 'Heredia'),
(5, 'Guanacaste'),
(6, 'Puntarenas'),
(7, 'Limon')
)AS TEMP(IdProvincia, NombreProvincia)

----Actualizar datos

UPDATE P SET
P.NombreProvincia = TM.NombreProvincia
FROM dbo.Provincias P
INNER JOIN #ProvinciaTemp TM
ON P.IdProvincia=MT.IdProvincia

----Insert Datos----
SET IDENTITY_INSERT dbo.Provincias ON
INSERT INTO dbo.Provincias(
IdProvincia, NombreProvincia)
SELECT 
IdProvincia, NombreProvincia
FROM #ProvinciaTemp
EXCEPT 
SELECT 
IdProvincia, NombreProvincia
FROM dbo.Provincias
SET IDENTITY_INSERT dbo.Provincias OFF
GO

