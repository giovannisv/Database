﻿
DROP TABLE IF EXISTS #CantonTemp
SELECT 
IdCanton, IdProvincia,NombreCanton  INTO #CantonTemp
FROM (
VALUES
(1,1,'SAN JOSÉ'),(2,1,'ESCAZÚ'),(3,1,'DESAMPARADOS'),(4,1,'PURISCAL'),(5,1,'TARRAZU'),(6,1,'ASERRI'),(7,1,'MORA'),(8,1,'GOICOECHEA'),(9,1,'SANTA ANA'),(10,1,'ALAJUELITA'),(11,1,'VÁSQUEZ DE CORONADO'),(12,1,'ACOSTA'),(13,1,'TIBAS'),(14,1,'MORAVIA'),(15,1,'MONTES DE OCA'),(16,1,'TURRUBARES'),(17,1,'DOTA'),(18,1,'CURRIDABAT'),(19,1,'PEREZ ZELEDON'),(20,1,'LEON CORTES'),(21,2,'ALAJUELA'),(22,2,'SAN RAMON'),(23,2,'GRECIA'),(24,2, 'SAN MATEO'),(25,2,'ATENAS'),(26,2,'NARANJO'),(27,2,'PALMARES'),(28,2,'POAS'),(29,2,'OROTINA'),(30,2,'SAN CARLOS'),(31,2,'ALFARO RUIZ'),(32,2,'SARCHI'),(33,2,'UPALA'),(34,2,'LOS CHILES'),(35,2,'GUATUSO'),(36,3,'CARTAGO'),(37,3,'PARAISO'),(38,3,'LA UNIÓN'),(39,3,'JIMENEZ'),(40,3,'TURRIALBA'),(41,3,'ALVARADO'),(42,3,'OREAMUNO'),(43,3,'EL GUARCO'),(44,4,'HEREDIA'),(45,4,'BARVA'),(46,4,'SANTO DOMINGO'),(47,4,'SANTA BÁRBARA'),(48,4, 'SAN RAFAEL'),(49,4,'SAN ISIDRO'),(50,4,'BELÉN'),(51,4,'FLORES'),(52,4,'SAN PABLO'),(53,4,'SARAPIQUI'),(54,5,'LIBERIA'),(55,5,'NICOYA'),(56,5,'SANTA CRUZ'),(57,5,'BAGACES'),(58,5,'CARRILLO'),(59,5,'CAÑAS'),(60,5,'ABANGARES'),(61,5,'TILARAN'),(62,5,'NANDAYURE'),(63,5,'LA CRUZ'),(64,5,'HOJANCHA'),(65,6,'PUNTARENAS'),(66,6,'ESPARZA'),(67,6,'BUENOS AIRES'),(68,6,'MONTES DE ORO'),(69,6,'OSA'),(70,6,'QUEPOS'),(71,6,'GOLFITO'),(72,6, 'COTO BRUS'),(73,6,'PARRITA'),(74,6,'CORREDORES'),(75,6,'GARABITO'),(76,7,'LIMÓN'),(77,7,'POCOCI'),(78,7,'SIQUIRRES'),(79,7,'TALAMANCA'),(80,7,'MATINA'),(81,7,'GUACIMO'),(100,2,'RIO CUARTO')
)AS TEMP (IdCanton, IdProvincia,NombreCanton )


---ACTUALIZAR DATOS----
UPDATE P SET
 P.IdProvincia= TM.IdProvincia,
 P.NombreCanton= TM.NombreCanton
FROM dbo.Canton P
INNER JOIN #CantonTemp TM
 ON P.IdCanton= TM.IdCanton

 ----INSERTAR DATOS---

 SET IDENTITY_INSERT dbo.Canton ON

INSERT INTO dbo.Canton(
IdCanton, IdProvincia,NombreCanton )
SELECT
IdCanton, IdProvincia,NombreCanton 
FROM #CantonTemp

EXCEPT 
SELECT 
IdCanton,IdProvincia, NombreCanton
FROM dbo.Canton
SET IDENTITY_INSERT dbo.Canton OFF
GO


---  DECLARE @VARTEXT VARCHAR(MAX)=NULL

SELECT
@VARTEXT=CONCAT(@VARTEXT,'(',
ISNULL(CAST([COD_CANTON] AS VARCHAR),'NULL'),',',
ISNULL(CAST([COD_PROVINCIA] AS VARCHAR),'NULL'),',',
'''',[DES_CANTON],''''',',')
FROM [dbo]. [CANTON]

SELECT @VARTEXT