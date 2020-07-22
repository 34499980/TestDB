INSERT INTO Pantallas (IdPantalla,IdAplicativo,Nombre) VALUES(23,1,'ConsultaChequesImpresosYEntregados')
INSERT INTO Pantallas (IdPantalla,IdAplicativo,Nombre) VALUES(24,1,'AnulacionDeChequesADemanda')

IF EXISTS(Select * from Pantallas where IdPantalla = 22)
UPDATE Pantallas SET Nombre='ConsultarChequesReImpresas' WHERE IdPantalla=22
ELSE
INSERT INTO Pantallas (IdPantalla,IdAplicativo,Nombre) VALUES(22,1,'ConsultarChequesReImpresas')

