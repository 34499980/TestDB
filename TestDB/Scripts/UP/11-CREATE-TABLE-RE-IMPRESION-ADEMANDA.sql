

CREATE TABLE [dbo].[ReImpresionADemanda](
	[IdReImpresionADemanda] [int] IDENTITY(1,1) NOT NULL,
	[IdImpresionADemanda] [int] NOT NULL,
 CONSTRAINT [PK_IdReImpresionADemanda] PRIMARY KEY CLUSTERED 
(
	[IdReImpresionADemanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[ReImpresionADemanda]  WITH CHECK ADD  CONSTRAINT [FK_ReImpresionADemanda_ImpresionADemanda] FOREIGN KEY([IdImpresionADemanda])
REFERENCES [dbo].[ImpresionADemanda] ([IdImpresionADemanda])


ALTER TABLE [dbo].[ReImpresionADemanda] CHECK CONSTRAINT [FK_ReImpresionADemanda_ImpresionADemanda]


