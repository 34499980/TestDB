

CREATE TABLE [dbo].[LoteDetalleLog](
	[IdLoteADemanda] [int] NULL,
	[IdEspecieADemandaImprimir] [int] NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY]


