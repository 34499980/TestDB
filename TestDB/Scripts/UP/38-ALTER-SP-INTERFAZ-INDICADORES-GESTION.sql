
-- =============================================
--  Author:		Sanchez Chimenti, Carolina
-- Create date: 13/01/2015
-- Description:	Interfaz a Excel de tareas de indicadores de Gestion
-- =============================================
ALTER PROCEDURE [dbo].[usp_InterfazIndicadoresGestion]
(
	@FechaFin AS DATETIME
)
AS
BEGIN

	DECLARE @FechaFinA AS DATETIME
	Select @FechaFinA = @FechaFin + 1
	--SELECT @FechaFinA = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE() + 1,105),105) where @FechaFin =''
	SELECT @FechaFinA = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE() + 1,105),105) where @FechaFin IS NULL OR @FechaFin <'19001231'

	DECLARE @FechaComienzo AS DATETIME
--	SELECT @FechaComienzo =CONVERT(DATETIME, CONVERT(VARCHAR, DATEADD(DAY,-(DATEPART ( WeekDay , @FechaFinA )) + 1,@FechaFinA),105), 105)
	SELECT @FechaComienzo =CONVERT(DATETIME, CONVERT(VARCHAR, @FechaFinA - 1,105), 105)

	Select NroTurno,IdTramite,Cheques,CuitBeneficiario,RazonSocialBeneficiario, TipoCheque,RazonSocialCliente
	FROM (	Select
			T.Fecha,
			T.NumeroTurno AS [NroTurno],
			t.IdTramite AS [IdTramite],
			E.NumeroEspecie AS [Cheques],
			B.Cuit AS [CuitBeneficiario],
			B.RazonSocial AS [RazonSocialBeneficiario],	
			CASE WHEN E.ADemanda=1 THEN 'A Demanda'
			ELSE 'Residual'
			END AS [TipoCheque],
			--B.Cuit AS [CuitCliente],
			E.RazonSocial AS [RazonSocialCliente]
			FROM Tramites T
	
				INNER JOIN  Especies E
				ON E.IdTramite = T.IdTramite

				LEFT JOIN Beneficiarios B
				ON E.IdBeneficiario = B.IdBeneficiario

				LEFT JOIN Cajas C
				ON C.IdCaja = T.IdCaja

				LEFT JOIN (Select Valor
					from ConfiguracionGeneral 
					where IdConfiguracion = 6
					)CG
			ON CG.Valor = C.NroSucursal
	

			WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
				AND (C.NroSucursal=(Select Valor
									from ConfiguracionGeneral 
									where IdConfiguracion = 6
									)
						OR NOT T.NumeroTurno IS NULL)
			UNION
		
			Select
			T.Fecha,
			T.NumeroTurno AS [NroTurno],
			t.IdTramite AS [IdTramite],
			E.NumeroEspecie AS [Cheques],
			B.Cuit AS [CuitBeneficiario],
			B.RazonSocial AS [RazonSocialBeneficiario],	
			'Autogestion' AS [TipoCheque],
			--B.Cuit AS [CuitCliente],
			E.RazonSocial AS [RazonSocialCliente]
			FROM Tramites T
	
				INNER JOIN  EspeciesImpresas E
				ON E.IdTramite = T.IdTramite

				LEFT JOIN Beneficiarios B
				ON E.IdBeneficiario = B.IdBeneficiario

				LEFT JOIN Cajas C
				ON C.IdCaja = T.IdCaja

				LEFT JOIN (Select Valor
					from ConfiguracionGeneral 
					where IdConfiguracion = 6
					)CG
			ON CG.Valor = C.NroSucursal
	

			WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
				AND (C.NroSucursal=(Select Valor
									from ConfiguracionGeneral 
									where IdConfiguracion = 6
									)
						OR NOT T.NumeroTurno IS NULL)	
	) A
	Order by Fecha
	
END
