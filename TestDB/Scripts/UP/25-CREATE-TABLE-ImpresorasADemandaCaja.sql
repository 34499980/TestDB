if not exists (select * from sysobjects where name='ImpresorasADemandaCaja' and xtype='U')
BEGIN
	CREATE TABLE [dbo].[ImpresorasADemandaCaja](
		[IdImpresora] [int] NOT NULL,
		[IdCaja] [int] NOT NULL,
		CONSTRAINT [PK_ImpresorasADemandaCaja] PRIMARY KEY CLUSTERED 
		(
			[IdImpresora] ASC,
			[IdCaja] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

	ALTER TABLE [dbo].[ImpresorasADemandaCaja]  WITH CHECK ADD  CONSTRAINT [FK_ImpresorasADemandaCaja_Cajas] FOREIGN KEY([IdCaja])
	REFERENCES [dbo].[Cajas] ([IdCaja])
	
	ALTER TABLE [dbo].[ImpresorasADemandaCaja] CHECK CONSTRAINT [FK_ImpresorasADemandaCaja_Cajas]

	ALTER TABLE [dbo].[ImpresorasADemandaCaja]  WITH CHECK ADD  CONSTRAINT [FK_ImpresorasADemandaCaja_ImpresorasADemanda] FOREIGN KEY([IdImpresora])
	REFERENCES [dbo].[ImpresorasADemanda] ([IdImpresoraADemanda])

	ALTER TABLE [dbo].[ImpresorasADemandaCaja] CHECK CONSTRAINT [FK_ImpresorasADemandaCaja_ImpresorasADemanda]

	END




