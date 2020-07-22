
CREATE TABLE [dbo].[ReImpresionADemandaLog](
	[IdReImpresionADemanda] [int] NULL,
	[IdImpresionADemanda] [int] NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY]

