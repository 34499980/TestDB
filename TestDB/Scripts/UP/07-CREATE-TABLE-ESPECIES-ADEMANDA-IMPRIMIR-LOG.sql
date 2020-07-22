

CREATE TABLE [dbo].[EspeciesADemandaImprimirLog](
	[IdEspeciesADemandaImprimir] [int] NOT NULL,
	[IdTipoEspecie] [int] NULL,
	[NumeroEspecie] [varchar](20) NULL,
	[IdTipoEntrega] [int] NULL,
	[IdEstadoImpresion] [int] NULL,
	[IdSolicitudEntregaEspecial] [int] NULL,
	[IdLista] [varchar](8) NULL,
	[FechaEspecie] [datetime] NULL,
	[NroLegajoImpresion] [varchar](16) NULL,
	[FechaCreacion] [datetime] NULL,
	[IdCajaImpresion] [int] NULL,
	[RazonSocial] [varchar](50) NULL,
	[IdBeneficiario] [int] NULL,
	[NroCuenta] [varchar](25) NULL,
	[FechaImpreso] [datetime] NULL,
	[Importe] [money] NULL,
	[NroLegajoLog] [varchar](16) NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[AccionLog] [char](1) NOT NULL
) ON [PRIMARY]


