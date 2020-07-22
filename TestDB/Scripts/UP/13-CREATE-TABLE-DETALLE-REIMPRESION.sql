

CREATE TABLE [dbo].[DetalleReImpresion](
	[IdDetalleReImpresion] [int] IDENTITY(1,1) NOT NULL,
	[IdReImpresionADemanda] [int] NOT NULL,
	[NumeroEspecie] [varchar](20) NOT NULL,
	[IdMotivoReImpresion] [int] NOT NULL,
	[FechaReImpresion] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleReImpresion] PRIMARY KEY CLUSTERED 
(
	[IdDetalleReImpresion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DetalleReImpresion] ADD  DEFAULT (getdate()) FOR [FechaReImpresion]

ALTER TABLE [dbo].[DetalleReImpresion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReImpresion_MotivoReimpresion] FOREIGN KEY([IdMotivoReImpresion])
REFERENCES [dbo].[MotivoReimpresion] ([IdMotivoReImpresion])


ALTER TABLE [dbo].[DetalleReImpresion] CHECK CONSTRAINT [FK_DetalleReImpresion_MotivoReimpresion]

