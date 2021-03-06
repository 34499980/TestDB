
-- =============================================
-- Author:		Sanchez Chimenti, Carolina
-- Create date: 29/12/2014
-- Description:	Interfaz a Excel de tareas de indicadores
-- =============================================
ALTER PROCEDURE [dbo].[usp_InterfazIndicadores]
(
	@FechaFin AS DATETIME
)
AS
BEGIN 
	
	DECLARE @FechaFinA AS DATETIME
	Select @FechaFinA = @FechaFin + 1
	SELECT @FechaFinA = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE() + 1,105),105) where @FechaFin IS NULL OR @FechaFin <'19001231'

	DECLARE @FechaComienzo AS DATETIME
	--SELECT @FechaComienzo =CONVERT(DATETIME, CONVERT(VARCHAR, DATEADD(DAY,-(DATEPART ( WeekDay , @FechaFinA )) + 1,@FechaFinA),105), 105)
	SELECT @FechaComienzo =CONVERT(DATETIME, CONVERT(VARCHAR, @FechaFinA - 1,105), 105)


	--Select *
	--INTO   TramitesLogTEMP
	--FROM TramitesLog TL
	--WHERE TL.Fecha >= @FechaComienzo AND TL.Fecha <= @FechaFinA
		
	-- Select de las especies entre las fechas de inicio y fin

		Select CONVERT(Date,T.[Fecha],105) as [Fecha], T.IdTramite,
		ISNULL(TA.NroTurno, T.NumeroTurno) NroTurno,
		T.TipoDni as [TipoDocumentoR],
		T.Dni as [NroDocumentoR],
		CONVERT(VARCHAR,(T.Fecha),108) as [HoraIngresoII],
		T.NroLegajoCreacion as [LegajoOpI],
		CONVERT(VARCHAR,(TIM.HoraImpTurno),108) as [HoraImprTurno],
		CONVERT(VARCHAR,(TC.HoraImprimirComandaA),108) as [HoraImprimirComandaA],
		CONVERT(VARCHAR,(TA.FechaHoraEscaneoA),108) as [FechaHoraEscaneoA],
		TA.LegajoOpA,
		CONVERT(VARCHAR,(TS.HoraEnSalon),108) as [HoraEnSalon],
		CONVERT(VARCHAR,(TLl.HoraLlamado),108) as [HoraLlamado] ,
		CONVERT(VARCHAR,(TP.HoraPausa),108) as [HoraPausa],
		TAS.CantAus as[CantTramitesAusente],
		LA.fechas as [HoraRellamado] ,
		CONVERT(VARCHAR,(TCi.HoraCierre),108)  as [HoraCierre],
		C.NroCaja,
		T.NroLegajoEntrega  as [NroLegajo],
		H.CantCheques,
		CEA.CantChequesADemanda as [CantChequesADemanda],
		CERES.CantChequesResiduales as [CantChequesResiduales],
		CONVERT(VARCHAR,(IIA.InicioImpresion),108) as [InicioImpresion],
		CER.CantChequesReImpresos as [CantChequesReImpresos],
		CAG.CantChequesAuditoria as [CantChequesAutogestion]
		FROM dbo.Tramites T
		
		--Obtengo la fecha de escaneo de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
				SELECT TAF.IdTramite, TL2.NroLegajoLog LegajoOpA, TAF.FechaHoraEscaneoA, TL2.NumeroTurno NroTurno, TL2.IdCaja
				FROM TramitesLogTEMP TL2
					INNER JOIN (
								Select TL.IdTramite, MIN(TL.FechaLog) FechaHoraEscaneoA
								FROM TramitesLogTEMP TL
								Where TL.LegajoArmado = 1  
									AND TL.NroLegajoLog <> 'EXTERNO'
								GROUP BY TL.IdTramite
								) TAF
					ON TAF.IdTramite = TL2.IdTramite
						AND TAF.FechaHoraEscaneoA = TL2.FechaLog
				) TA
			ON T.IdTramite = TA.IdTramite
	
		--Obtengo la fecha en que se imprimio el turno de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			Select TIT.IdTramite, TL2.NroLegajoLog LegajoOpC, TIT.HoraImpTurno
			From TramitesLogTEMP TL2
				INNER JOIN (
								Select TL.IdTramite, MIN(TL.FechaLog) HoraImpTurno
								FROM TramitesLogTEMP TL
								Where TL.NumeroTurno IS NOT NULL
								GROUP BY TL.IdTramite
								) TIT
					ON TIT.IdTramite = TL2.IdTramite
						AND TIT.HoraImpTurno = TL2.FechaLog
			) TIM
			ON T.IdTramite = TIM.IdTramite


		--Obtengo la fecha en que se imprimio la comanda de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			SELECT TCF.IdTramite, TL2.NroLegajoLog LegajoOpC, TCF.HoraImprimirComandaA
			FROM TramitesLogTEMP TL2
				INNER JOIN (
							Select TL.IdTramite, MIN(TL.FechaLog) HoraImprimirComandaA
							FROM TramitesLogTEMP TL
							Where TL.ImprimirComanda = 1 
							GROUP BY TL.IdTramite
							) TCF
				ON TCF.IdTramite = TL2.IdTramite
					AND TCF.HoraImprimirComandaA = TL2.FechaLog
				) TC
			ON T.IdTramite = TC.IdTramite

		--Obtengo la fecha en que se ingreso al salon de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			SELECT TSF.IdTramite, TL2.NroLegajoLog LegajoOpI, TSF.HoraEnSalon
			FROM TramitesLogTEMP TL2
				INNER JOIN (
							Select TL.IdTramite, MIN(TL.FechaLog) HoraEnSalon
							FROM TramitesLogTEMP TL
							Where TL.EstaEnSalon= 1 
							GROUP BY TL.IdTramite
							) TSF
				ON TSF.IdTramite = TL2.IdTramite
					AND TSF.HoraEnSalon = TL2.FechaLog
			) TS
			ON T.IdTramite = TS.IdTramite
		
		--Obtengo la fecha en que se llamo de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			SELECT TLF.IdTramite, TL2.NroLegajoLog LegajoOpI, TLF.HoraLlamado 
			FROM TramitesLogTEMP TL2
				INNER JOIN (
							Select TL.IdTramite, MIN(TL.FechaLog) HoraLlamado
							FROM TramitesLogTEMP TL
							Where TL.IdTramiteEstado= 2  
								AND TL.Fecha >= @FechaComienzo AND TL.Fecha <= @FechaFinA
							GROUP BY TL.IdTramite
							) TLF
				ON TLF.IdTramite = TL2.IdTramite
					AND TLF.HoraLlamado = TL2.FechaLog
			) TLl
		ON T.IdTramite = TLl.IdTramite
		
		--Obtengo la cantidad de veces que se lo llamo y estuvo ausente de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			SELECT TAF.IdTramite, TL2.NroLegajoLog LegajoOpI, TAF.CantAus
			FROM TramitesLogTEMP TL2
				INNER JOIN (
							Select TL.IdTramite, MAX(TL.LlamadoAusente) CantAus, MIN(TL.FechaLog) Hora
							FROM TramitesLogTEMP TL
							Where TL.IdTramiteEstado= 5  
							GROUP BY TL.IdTramite
							) TAF
				ON TAF.IdTramite = TL2.IdTramite
					AND TAF.Hora = TL2.FechaLog
			) TAS
		ON T.IdTramite = TAS.IdTramite

		--Obtengo la fecha en que se pauso de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			SELECT TPF.IdTramite, TL2.NroLegajoLog LegajoOpI, TPF.HoraPausa
			FROM TramitesLogTEMP TL2
				INNER JOIN (
							Select TL.IdTramite, MAX(TL.FechaLog) HoraPausa
							FROM TramitesLogTEMP TL
							Where TL.IdTramiteEstado= 4   
							GROUP BY TL.IdTramite
							) TPF
				ON TPF.IdTramite = TL2.IdTramite
					AND TPF.HoraPausa = TL2.FechaLog
			) TP
		ON T.IdTramite = TP.IdTramite

		--Obtengo la fecha se cierre de TramitesLog segun la fecha de comienzo y de fin
		LEFT JOIN (
			SELECT TCF.IdTramite, TL2.NroLegajoLog LegajoOpI, TCF.HoraCierre
			FROM TramitesLogTEMP TL2
				INNER JOIN (
							Select TL.IdTramite, MIN(TL.FechaLog) HoraCierre
							FROM TramitesLogTEMP TL
							Where TL.IdTramiteEstado= 8 
							GROUP BY TL.IdTramite
							) TCF
				ON TCF.IdTramite = TL2.IdTramite
					AND TCF.HoraCierre = TL2.FechaLog
			) TCi
		ON T.IdTramite = TCi.IdTramite
		
		LEFT JOIN Cajas C
		ON C.IdCaja = TA.IdCaja

		LEFT JOIN (Select Valor
		from ConfiguracionGeneral 
		where IdConfiguracion=6
		)CG
		ON CG.Valor = C.NroSucursal

		--Obtengo la cantidad de cheques total de Tramites segun la fecha de comienzo y de fin		
		LEFT JOIN (
					SELECT  A.IdTramite, SUM(A.Cant) as [CantCheques]
					FROM (		
							SELECT E.IdTramite,COUNT(1) Cant
							FROM Especies E
							WHERE EXISTS (SELECT TOP 1 1
										FROM Tramites T
										WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
											AND T.IdTramite = E.IdTramite
										) and  E.IdEspecieEstado = 10
							GROUP BY E.IdTramite

						UNION ALL
							Select EI.IdTramite,COUNT(1) Cant
							From EspeciesImpresas EI
							WHERE EXISTS (SELECT TOP 1 1
										FROM Tramites T
										WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
											AND T.IdTramite = EI.IdTramite
											) 
							GROUP BY EI.IdTramite


							) A
					GROUP BY A.IdTramite
			) H	
					
	
		ON H.IdTramite = T.IdTramite
		--Obtengo la cantidad de cheques ADemanda
		LEFT JOIN (
			SELECT  E.IdTramite,Count(E.IdEspecie) as [CantChequesADemanda]
			FROM Especies E
			WHERE EXISTS (SELECT TOP 1 1
							FROM Tramites T
							WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
								AND T.IdTramite = E.IdTramite
							)	and  E.IdEspecieEstado = 10
				AND E.ADemanda =1
				and  E.IdEspecieEstado = 10
			GROUP BY E.IdTramite
			
		) CEA
		ON CEA.IdTramite = T.IdTramite
		--Obtiene la cantidad de especies residuales 
		LEFT JOIN (
			SELECT E.IdTramite, Count(E.IdEspecie) as [CantChequesResiduales]
			FROM Especies E
			WHERE EXISTS (SELECT TOP 1 1
							FROM Tramites T
							WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
								AND T.IdTramite = E.IdTramite
							)
			AND E.ADemanda =0
			and  E.IdEspecieEstado = 10
			GROUP BY E.IdTramite
		) CERES

		ON CERES.IdTramite = T.IdTramite

		--Obtiene la hora de impresión
		LEFT JOIN (
			SELECT I.IdTramite, MIN(L.FechaInicio) as [InicioImpresion]
			FROM LoteADemanda L
			INNER JOIN ImpresionADemanda I on L.IdImpresionADemanda = I.IdImpresionADemanda			
			WHERE EXISTS (SELECT TOP 1 1
							FROM Tramites T
							WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
								AND T.IdTramite = I.IdTramite
							)							
				GROUP BY I.IdTramite
		) IIA
		ON IIA.IdTramite = T.IdTramite


		--Obtiene la hora de impresión
		LEFT JOIN (
			SELECT I.IdTramite, Count(D.IdDetalleReImpresion) as [CantChequesReImpresos]
			FROM DetalleReImpresion D
			INNER JOIN ReImpresionADemanda R on D.IdReImpresionADemanda = R.IdReImpresionADemanda
			INNER JOIN ImpresionADemanda I on R.IdImpresionADemanda = I.IdImpresionADemanda
			WHERE EXISTS (SELECT TOP 1 1
							FROM Tramites T
							WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
								AND T.IdTramite = I.IdTramite
							)							
				GROUP BY I.IdTramite
		) CER
		ON CER.IdTramite = T.IdTramite
		--Obtiene la cantidad de cheques impresos en autogestion
		LEFT JOIN (
			SELECT AD.IdTramite, Count(AD.IdEspecie) as [CantChequesAuditoria]
			FROM EspeciesImpresas AD					
			WHERE EXISTS (SELECT TOP 1 1
							FROM Tramites T
							WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
								AND T.IdTramite = AD.IdTramite
							)							
			GROUP BY AD.IdTramite
		) CAG
		ON CAG.IdTramite = T.IdTramite
	
		--Obtengo las horas de los rellamados
		LEFT JOIN (
				select distinct TL1.IdTramite,
					stuff((select distinct '/' + rankAusente.fechas from (
								SELECT   
										P.IdTramite,
										CONVERT(VARCHAR, P.FechaLog, 108) fechas,
										[Rank],
										P.IdTramiteEstado
									FROM(
									SELECT  [IdTramite]
											,[IdTramiteEstado]
											,[LlamadoAusente]
											,[FechaLog]
											,RANK ( ) OVER (PARTITION BY  [LlamadoAusente], IdTramite order by IdTramite, [FechaLog] ) as [Rank]
										FROM TramitesLogTEMP TL
										where LlamadoAusente > 0
										) P
								WHERE [Rank] = 2) rankAusente
							where TL1.IdTramite = rankAusente.idtramite
						FOR XML PATH('')),1,1,'') fechas 
					FROM TramitesLogTEMP TL1
				) LA
			ON T.IdTramite = LA.IdTramite

			
	WHERE T.Fecha >= @FechaComienzo AND T.Fecha <= @FechaFinA 
	AND (C.NroSucursal=(Select Valor
						from ConfiguracionGeneral 
						where IdConfiguracion=6
						)
		OR NOT T.NumeroTurno IS NULL )
		
	Order by Fecha		
END



