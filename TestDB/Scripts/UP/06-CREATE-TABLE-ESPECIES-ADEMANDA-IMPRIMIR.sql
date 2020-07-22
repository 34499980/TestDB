

CREATE TABLE [dbo].[EspeciesADemandaImprimir](
	[IdEspeciesADemandaImprimir] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoEspecie] [int] NOT NULL,
	[NumeroEspecie] [varchar](20) NOT NULL,
	[IdTipoEntrega] [int] NOT NULL,
	[IdEstadoImpresion] [int] NOT NULL,
	[IdSolicitudEntregaEspecial] [int] NULL,
	[FechaEspecie] [datetime] NOT NULL,
	[NroLegajoImpresion] [varchar](16) NULL,
	[FechaCreacion] [datetime] NULL,
	[IdCajaImpresion] [int] NULL,
	[RazonSocial] [varchar](50) NULL,
	[IdBeneficiario] [int] NOT NULL,
	[NroCuenta] [varchar](25) NULL,
	[FechaImpreso] [datetime] NULL,
	[Importe] [money] NOT NULL,
	[IdLista] [varchar](8) NULL,
 CONSTRAINT [PK_IdEspeciesADemandaImprimir] PRIMARY KEY CLUSTERED 
(
	[IdEspeciesADemandaImprimir] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[EspeciesADemandaImprimir]  WITH CHECK ADD  CONSTRAINT [FK_EspeciesADemandaImprimir_SolicitudEntregaEspecial] FOREIGN KEY([IdSolicitudEntregaEspecial])
REFERENCES [dbo].[SolicitudEntregaEspecial] ([IdSolicitudEntregaEspecial])


ALTER TABLE [dbo].[EspeciesADemandaImprimir] CHECK CONSTRAINT [FK_EspeciesADemandaImprimir_SolicitudEntregaEspecial]


ALTER TABLE [dbo].[EspeciesADemandaImprimir]  WITH CHECK ADD  CONSTRAINT [FK_IdEspeciesADemandaImprimir_Beneficiario] FOREIGN KEY([IdBeneficiario])
REFERENCES [dbo].[Beneficiarios] ([IdBeneficiario])


ALTER TABLE [dbo].[EspeciesADemandaImprimir] CHECK CONSTRAINT [FK_IdEspeciesADemandaImprimir_Beneficiario]


ALTER TABLE [dbo].[EspeciesADemandaImprimir]  WITH CHECK ADD  CONSTRAINT [FK_IdEspeciesADemandaImprimir_Caja] FOREIGN KEY([IdCajaImpresion])
REFERENCES [dbo].[Cajas] ([IdCaja])


ALTER TABLE [dbo].[EspeciesADemandaImprimir] CHECK CONSTRAINT [FK_IdEspeciesADemandaImprimir_Caja]


ALTER TABLE [dbo].[EspeciesADemandaImprimir]  WITH CHECK ADD  CONSTRAINT [FK_IdEspeciesADemandaImprimir_EstadoImpresion] FOREIGN KEY([IdEstadoImpresion])
REFERENCES [dbo].[EstadoImpresion] ([IdEstadoImpresion])


ALTER TABLE [dbo].[EspeciesADemandaImprimir] CHECK CONSTRAINT [FK_IdEspeciesADemandaImprimir_EstadoImpresion]


ALTER TABLE [dbo].[EspeciesADemandaImprimir]  WITH CHECK ADD  CONSTRAINT [FK_IdEspeciesADemandaImprimir_TipoEntrega] FOREIGN KEY([IdTipoEntrega])
REFERENCES [dbo].[TipoEntrega] ([IdTipoEntrega])


ALTER TABLE [dbo].[EspeciesADemandaImprimir] CHECK CONSTRAINT [FK_IdEspeciesADemandaImprimir_TipoEntrega]


