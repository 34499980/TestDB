
CREATE TABLE [dbo].[SolicitudEntregaEspecial](
	[IdSolicitudEntregaEspecial] [int] IDENTITY(1,1) NOT NULL,
	[IdEstadoSolicitud] [int] NULL,
	[Fecha] [datetime] NOT NULL,
	[NroLegajo] [varchar](16) NOT NULL,
	[NroSucursal] [int] NOT NULL,
 CONSTRAINT [PK_IdSolicitudEntregaEspecial] PRIMARY KEY CLUSTERED 
(
	[IdSolicitudEntregaEspecial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[SolicitudEntregaEspecial]  WITH CHECK ADD  CONSTRAINT [PK_SolicitudEntregaEspecial_EstadoSolicitud] FOREIGN KEY([IdEstadoSolicitud])
REFERENCES [dbo].[EstadoSolicitud] ([IdEstadoSolicitud])


ALTER TABLE [dbo].[SolicitudEntregaEspecial] CHECK CONSTRAINT [PK_SolicitudEntregaEspecial_EstadoSolicitud]


