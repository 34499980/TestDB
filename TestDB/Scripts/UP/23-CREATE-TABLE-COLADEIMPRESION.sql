

CREATE TABLE [dbo].[ColaDeImpresion](
	[IdImpresoraADemanda] [int] NOT NULL,
	[IdImpresionADemanda] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_ColaDeImpresion] PRIMARY KEY CLUSTERED 
(
	[IdImpresoraADemanda] ASC,
	[IdImpresionADemanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[ColaDeImpresion]  WITH CHECK ADD  CONSTRAINT [FK_ColaDeImpresion_ImpresionADemanda] FOREIGN KEY([IdImpresionADemanda])
REFERENCES [dbo].[ImpresionADemanda] ([IdImpresionADemanda])


ALTER TABLE [dbo].[ColaDeImpresion] CHECK CONSTRAINT [FK_ColaDeImpresion_ImpresionADemanda]


ALTER TABLE [dbo].[ColaDeImpresion]  WITH CHECK ADD  CONSTRAINT [FK_ColaDeImpresion_ImpresorasADemanda] FOREIGN KEY([IdImpresoraADemanda])
REFERENCES [dbo].[ImpresorasADemanda] ([IdImpresoraADemanda])


ALTER TABLE [dbo].[ColaDeImpresion] CHECK CONSTRAINT [FK_ColaDeImpresion_ImpresorasADemanda]


