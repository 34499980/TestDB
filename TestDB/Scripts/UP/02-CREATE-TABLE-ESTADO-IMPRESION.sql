

CREATE TABLE [dbo].[EstadoImpresion](
	[IdEstadoImpresion] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Codigo] [varchar](2) NULL,
 CONSTRAINT [PK_IdEstadoImpresion] PRIMARY KEY CLUSTERED 
(
	[IdEstadoImpresion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


