

CREATE TABLE [dbo].[SolicitudEntregaEspecialLog](
	[IdSolicitudEntregaEspecial] [int] NULL,
	[IdEstadoSolicitud] [int] NULL,
	[Fecha] [datetime] NULL,
	[NroLegajoCreacion] [varchar](16) NULL,
	[NroLegajoAutorizado] [varchar](16) NULL,
	[NroSucursal] [int] NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY]


