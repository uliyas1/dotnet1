CREATE TABLE [dbo].[Product]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ProductName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SupplierId] [int] NOT NULL,
[UnitPrice] [decimal] (12, 2) NULL CONSTRAINT [DF__Product__UnitPri__2D27B809] DEFAULT ((0)),
[Package] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDiscontinued] [bit] NOT NULL CONSTRAINT [DF__Product__IsDisco__2E1BDC42] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IndexProductName] ON [dbo].[Product] ([ProductName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IndexProductSupplierId] ON [dbo].[Product] ([SupplierId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [FK_PRODUCT_REFERENCE_SUPPLIER] FOREIGN KEY ([SupplierId]) REFERENCES [dbo].[Supplier] ([Id])
GO
