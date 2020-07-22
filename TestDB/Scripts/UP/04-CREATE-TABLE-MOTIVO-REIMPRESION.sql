
CREATE TABLE [dbo].[MotivoReimpresion](
	[IdMotivoReImpresion] [int] IDENTITY(1,1) NOT NULL,
	[Motivo] [varchar](max) NULL,
	[Seleccionable] [bit] NULL,
 CONSTRAINT [PK_MotivoReImpresion] PRIMARY KEY CLUSTERED 
(
	[IdMotivoReImpresion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

