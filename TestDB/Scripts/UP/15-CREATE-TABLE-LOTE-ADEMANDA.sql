

CREATE TABLE [dbo].[LoteADemanda](
	[IdLoteADemanda] [int] IDENTITY(1,1) NOT NULL,
	[IdImpresionADemanda] [int] NOT NULL,
	[IdEstadoImpresion] [int] NOT NULL,
	[IdCaja] [int] NOT NULL,
	[NroLegajo] [varchar](16) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NULL,
	[DescripcionError] [varchar](max) NULL,
 CONSTRAINT [PK_LoteADemanda] PRIMARY KEY CLUSTERED 
(
	[IdLoteADemanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE [dbo].[LoteADemanda]  WITH CHECK ADD  CONSTRAINT [FK_LoteADemanda_Cajas] FOREIGN KEY([IdCaja])
REFERENCES [dbo].[Cajas] ([IdCaja])


ALTER TABLE [dbo].[LoteADemanda] CHECK CONSTRAINT [FK_LoteADemanda_Cajas]


ALTER TABLE [dbo].[LoteADemanda]  WITH CHECK ADD  CONSTRAINT [FK_LoteADemanda_EstadoImpresion] FOREIGN KEY([IdEstadoImpresion])
REFERENCES [dbo].[EstadoImpresion] ([IdEstadoImpresion])


ALTER TABLE [dbo].[LoteADemanda] CHECK CONSTRAINT [FK_LoteADemanda_EstadoImpresion]


ALTER TABLE [dbo].[LoteADemanda]  WITH CHECK ADD  CONSTRAINT [FK_LoteADemanda_ImpresionADemanda] FOREIGN KEY([IdImpresionADemanda])
REFERENCES [dbo].[ImpresionADemanda] ([IdImpresionADemanda])

ALTER TABLE [dbo].[LoteADemanda] CHECK CONSTRAINT [FK_LoteADemanda_ImpresionADemanda]


