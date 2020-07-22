

CREATE TABLE [dbo].[CambioEstadosImpresionLog](
	[IdTipoEspecie] [int] NULL,
	[NumeroEspecie] [varchar](20) NULL,
	[CodigoEstadoAnterior] [varchar](2) NULL,
	[CodigoEstadoNuevo] [varchar](2) NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL
) ON [PRIMARY]

