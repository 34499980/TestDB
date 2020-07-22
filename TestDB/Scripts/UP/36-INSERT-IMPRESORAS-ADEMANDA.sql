--Se insertan las primeras 4 impresoras que se corresponden a la sucursal 414 (para 8 cajas)
--Impresora para las cajas 1 y 2
IF NOT EXISTS(Select TOP 1 1
				FROM ImpresorasADemanda
				WHERE IdImpresoraADemanda =1)
	BEGIN 
		INSERT INTO ImpresorasADemanda
		(IdImpresoraADemanda)
		VALUES
		(1)
	END

	--Impresora para las cajas 3 y 4
IF NOT EXISTS(Select TOP 1 1
				FROM ImpresorasADemanda
				WHERE IdImpresoraADemanda =2)
	BEGIN 
		INSERT INTO ImpresorasADemanda
		(IdImpresoraADemanda)
		VALUES
		(2)
	END
--Impresora para las cajas 5 y 6
IF NOT EXISTS(Select TOP 1 1
				FROM ImpresorasADemanda
				WHERE IdImpresoraADemanda =3)
	BEGIN 
		INSERT INTO ImpresorasADemanda
		(IdImpresoraADemanda)
		VALUES
		(3)
	END

--Impresora para las cajas 7 y 8
IF NOT EXISTS(Select TOP 1 1
				FROM ImpresorasADemanda
				WHERE IdImpresoraADemanda =4)
	BEGIN 
		INSERT INTO ImpresorasADemanda
		(IdImpresoraADemanda)
		VALUES
		(4)
	END
