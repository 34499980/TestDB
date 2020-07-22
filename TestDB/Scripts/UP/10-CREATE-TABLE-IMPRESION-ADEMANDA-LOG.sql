

CREATE TABLE [dbo].[ImpresionADemandaLog](
	[IdImpresionADemanda] [int] NULL,
	[IdTramite] [int] NULL,
	[IdEstadoImpresion] [int] NULL,
	[IdSolicitudEntregaEspecial] [int] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaImpresion] [datetime] NULL,
	[Finalizo] [bit] NULL,
	[DescripcionError] [nvarchar](max) NULL,
	[NroLegajo] [varchar](16) NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


