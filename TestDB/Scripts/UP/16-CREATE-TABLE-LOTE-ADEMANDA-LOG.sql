

CREATE TABLE [dbo].[LoteADemandaLog](
	[IdLoteADemanda] [int] NULL,
	[IdImpresionADemanda] [int] NULL,
	[IdEstadoImpresion] [int] NULL,
	[IdCaja] [int] NULL,
	[NroLegajo] [varchar](16) NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[DescripcionError] [varchar](max) NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


