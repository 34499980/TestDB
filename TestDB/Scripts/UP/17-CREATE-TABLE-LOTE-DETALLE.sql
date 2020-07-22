

CREATE TABLE [dbo].[LoteDetalle](
	[IdLoteADemanda] [int] NOT NULL,
	[IdEspecieADemandaImprimir] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[IdLoteDetalle] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLoteDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[LoteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_LoteDetalle_EspeciesADemandaImprimir] FOREIGN KEY([IdEspecieADemandaImprimir])
REFERENCES [dbo].[EspeciesADemandaImprimir] ([IdEspeciesADemandaImprimir])


ALTER TABLE [dbo].[LoteDetalle] CHECK CONSTRAINT [FK_LoteDetalle_EspeciesADemandaImprimir]


