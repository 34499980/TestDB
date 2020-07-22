
CREATE TABLE [dbo].[ImpresionADemanda](
	[IdImpresionADemanda] [int] IDENTITY(1,1) NOT NULL,
	[IdTramite] [int] NULL,
	[IdEstadoImpresion] [int] NOT NULL,
	[IdSolicitudEntregaEspecial] [int] NULL,
	[FechaImpresion] [datetime] NULL,
	[NroLegajo] [varchar](16) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Finalizo] [bit] NOT NULL,
	[DescripcionError] [nvarchar](max) NULL,
 CONSTRAINT [PK_IdImpresionADemanda] PRIMARY KEY CLUSTERED 
(
	[IdImpresionADemanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE [dbo].[ImpresionADemanda]  WITH CHECK ADD  CONSTRAINT [FK_ImpresionADemanda_EstadoImpresion] FOREIGN KEY([IdEstadoImpresion])
REFERENCES [dbo].[EstadoImpresion] ([IdEstadoImpresion])


ALTER TABLE [dbo].[ImpresionADemanda] CHECK CONSTRAINT [FK_ImpresionADemanda_EstadoImpresion]


ALTER TABLE [dbo].[ImpresionADemanda]  WITH CHECK ADD  CONSTRAINT [FK_ImpresionADemanda_SolicitudEntregaEspecial] FOREIGN KEY([IdSolicitudEntregaEspecial])
REFERENCES [dbo].[SolicitudEntregaEspecial] ([IdSolicitudEntregaEspecial])


ALTER TABLE [dbo].[ImpresionADemanda] CHECK CONSTRAINT [FK_ImpresionADemanda_SolicitudEntregaEspecial]


ALTER TABLE [dbo].[ImpresionADemanda]  WITH CHECK ADD  CONSTRAINT [FK_ImpresionADemanda_Tramites] FOREIGN KEY([IdTramite])
REFERENCES [dbo].[Tramites] ([IdTramite])


ALTER TABLE [dbo].[ImpresionADemanda] CHECK CONSTRAINT [FK_ImpresionADemanda_Tramites]


