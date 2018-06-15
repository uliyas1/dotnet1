CREATE TABLE [dbo].[OrderItem]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NOT NULL,
[ProductId] [int] NOT NULL,
[UnitPrice] [decimal] (12, 2) NOT NULL CONSTRAINT [DF__OrderItem__UnitP__29572725] DEFAULT ((0)),
[Quantity] [int] NOT NULL CONSTRAINT [DF__OrderItem__Quant__2A4B4B5E] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItem] ADD CONSTRAINT [PK_ORDERITEM] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IndexOrderItemOrderId] ON [dbo].[OrderItem] ([OrderId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IndexOrderItemProductId] ON [dbo].[OrderItem] ([ProductId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItem] ADD CONSTRAINT [FK_ORDERITE_REFERENCE_ORDER] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] ADD CONSTRAINT [FK_ORDERITE_REFERENCE_PRODUCT] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id])
GO
