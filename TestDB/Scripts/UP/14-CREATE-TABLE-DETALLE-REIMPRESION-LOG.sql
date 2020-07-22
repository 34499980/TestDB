

CREATE TABLE [dbo].[DetalleReImpresionLog](
	[IdDetalleReImpresion] [int] NULL,
	[IdReImpresionADemanda] [int] NULL,
	[FechaReImpresion] [datetime] NOT NULL,
	[NumeroEspecie] [varchar](20) NULL,
	[IdMotivoReImpresion] [int] NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY]


ALTER TABLE [dbo].[DetalleReImpresionLog] ADD  CONSTRAINT [DF__DetalleRe__Fecha__0F6D37F0]  DEFAULT (getdate()) FOR [FechaReImpresion]


