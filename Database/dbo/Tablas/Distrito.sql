﻿CREATE TABLE [dbo].[Distrito]
(
	
 IdDistrito INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Distrito PRIMARY KEY CLUSTERED(IdDistrito),
	NombreDistrito VARCHAR(50) NULL,
    IdCanton INT NOT NULL
 CONSTRAINT FK_Distrito_Canton  FOREIGN KEY(IdCanton) REFERENCES  dbo.Canton(IdCanton)
)WITH (DATA_COMPRESSION = PAGE)
GO

