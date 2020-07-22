--Para agregar nuevas impresoras INSERT INTO ImpresorasADemandaCaja (IdImpresora,IdCaja) VALUES (x,y) ver documentación, por defecto se configuran las impresoras para la sucursal 414

--Se agrega la impresora 1 para la caja 1 y la caja 2
INSERT INTO ImpresorasADemandaCaja
(IdImpresora,IdCaja)
Select 1,IdCaja
from Cajas C
Where NroSucursal = 414
	AND NroCaja IN (1,2)
	AND NOT EXISTS(SELECT TOP 1 1
					FROM ImpresorasADemandaCaja I
					WHERE C.IdCaja = I.IdCaja
					)

--Se agrega la impresora 1 para la caja 3 y la caja 4
INSERT INTO ImpresorasADemandaCaja
(IdImpresora,IdCaja)
Select 2,IdCaja
from Cajas C
Where NroSucursal = 414
	AND NroCaja IN (3,4)
	AND NOT EXISTS(SELECT TOP 1 1
					FROM ImpresorasADemandaCaja I
					WHERE C.IdCaja = I.IdCaja
					)

--Se agrega la impresora 1 para la caja 5 y la caja 6
INSERT INTO ImpresorasADemandaCaja
(IdImpresora,IdCaja)
Select 3,IdCaja
from Cajas C
Where NroSucursal = 414
	AND NroCaja IN (5,6)
	AND NOT EXISTS(SELECT TOP 1 1
					FROM ImpresorasADemandaCaja I
					WHERE C.IdCaja = I.IdCaja
					)

--Se agrega la impresora 1 para la caja 7 y la caja 8
INSERT INTO ImpresorasADemandaCaja
(IdImpresora,IdCaja)
Select 4,IdCaja
from Cajas C
Where NroSucursal = 414
	AND NroCaja IN (7,8)
		AND NOT EXISTS(SELECT TOP 1 1
					FROM ImpresorasADemandaCaja I
					WHERE C.IdCaja = I.IdCaja
					)