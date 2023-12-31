USE [UserManagement1]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/8/2023 10:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/8/2023 10:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[cid] [int] NOT NULL,
	[totalmoney] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/8/2023 10:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/8/2023 10:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [decimal](10, 2) NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](255) NULL,
	[cid] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/8/2023 10:32:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Tea')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Coffee')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Milk Tea')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1, CAST(N'2023-07-07' AS Date), 10, 10.4700)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (2, CAST(N'2023-07-07' AS Date), 10, 14.4600)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (3, CAST(N'2023-07-07' AS Date), 10, 19.4400)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (4, CAST(N'2023-07-07' AS Date), 10, 30.9200)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (5, CAST(N'2023-07-07' AS Date), 1, 26.4300)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (6, CAST(N'2023-07-08' AS Date), 10, 3.4900)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (7, CAST(N'2023-07-08' AS Date), 10, 7.9800)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (8, CAST(N'2023-07-08' AS Date), 1, 25.9500)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (9, CAST(N'2023-07-08' AS Date), 1, 40.4500)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (10, CAST(N'2023-07-08' AS Date), 1, 0.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (11, CAST(N'2023-07-08' AS Date), 1, 40.4500)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (12, CAST(N'2023-07-08' AS Date), 1, 18.4700)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (13, CAST(N'2023-07-08' AS Date), 10, 14.4600)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (14, CAST(N'2023-07-08' AS Date), 10, 18.4700)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 1, 1, 2.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 14, 2, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (3, 1, 4, 2.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (3, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (3, 3, 1, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (4, 2, 2, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (4, 3, 6, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 2, 3, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 3, 4, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (6, 17, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (7, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (7, 5, 1, 4.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (8, 1, 1, 10.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (8, 2, 2, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (8, 6, 2, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (9, 1, 3, 10.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (9, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (9, 3, 1, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (11, 1, 3, 10.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (11, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (11, 3, 1, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (12, 1, 1, 10.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (12, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (12, 3, 1, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (13, 2, 3, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (13, 3, 1, 3.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (14, 1, 1, 10.99)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (14, 2, 1, 3.49)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (14, 3, 1, 3.99)
GO
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (1, N'Green Tea', CAST(10.99 AS Decimal(10, 2)), N'Delicious green tea', N'https://phuclong.com.vn/uploads/dish/7c8006f72742d8-trnhnphclong.png', 1, 10)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (2, N'Black Tea', CAST(3.49 AS Decimal(10, 2)), N'Rich and bold black tea', N'https://phuclong.com.vn/uploads/dish/a66aecd5b760eb-traolongmangcau.png', 1, 3)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (3, N'Earl Grey Tea', CAST(3.99 AS Decimal(10, 2)), N'Classic and aromatic earl grey tea', N'https://phuclong.com.vn/uploads/dish/dae727e03e8092-daccam.png', 1, 1)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (4, N'Jasmine Tea', CAST(3.99 AS Decimal(10, 2)), N'Fragrant jasmine tea', N'https://phuclong.com.vn/uploads/dish/063555c21c4206-trviliphclong.png', 1, 16)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (5, N'Oolong Tea', CAST(4.49 AS Decimal(10, 2)), N'Semi-fermented oolong tea', N'https://phuclong.com.vn/uploads/dish/65a7d028c2229d-sachuaxoicthmphclong.png', 1, 33)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (6, N'Chamomile Tea', CAST(3.99 AS Decimal(10, 2)), N'Soothing chamomile tea', N'https://phuclong.com.vn/uploads/dish/b8f1dd4d4f583c-dacthom.png', 1, 18)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (7, N'Espresso', CAST(4.99 AS Decimal(10, 2)), N'Strong and concentrated coffee', N'https://phuclong.com.vn/uploads/dish/e3a453a57402ee-65000307trsanhnsen.png', 2, 20)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (8, N'Cappuccino', CAST(5.99 AS Decimal(10, 2)), N'Classic Italian coffee', N'https://phuclong.com.vn/uploads/dish/1fc4620223d5c3-6500030265000303hngtrsacaramel.png', 2, 45)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (9, N'Latte', CAST(4.49 AS Decimal(10, 2)), N'Creamy and smooth coffee', N'https://phuclong.com.vn/uploads/dish/e3a453a57402ee-65000307trsanhnsen.png', 2, 15)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (10, N'Mocha', CAST(4.49 AS Decimal(10, 2)), N'Rich and chocolatey coffee', N'https://phuclong.com.vn/uploads/dish/4bab552f7ed0a6-trasuaberryberry60000839.png', 2, 54)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (11, N'Americano', CAST(3.99 AS Decimal(10, 2)), N'Bold and intense coffee', N'https://phuclong.com.vn/uploads/dish/84c7b821bde822-troxay.png', 2, 56)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (12, N'Macchiato', CAST(4.49 AS Decimal(10, 2)), N'Coffee with a hint of milk foam', N'https://aeonmall-binhtan-en.com/wp-content/uploads/2021/05/83168aba00828b-troxayphclong.png', 2, 50)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (13, N'Taro Milk Tea', CAST(3.99 AS Decimal(10, 2)), N'Creamy and flavorful taro milk tea', N'https://aeonmall-binhduongcanary-en.com/wp-content/uploads/2020/05/ngoc-vien-dong.png', 3, 45)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (14, N'Thai Milk Tea', CAST(3.99 AS Decimal(10, 2)), N'Authentic Thai milk tea', N'https://phuclong.com.vn/uploads/dish/90405a9f256f11-cafe5mon04.png', 3, 45)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (15, N'Matcha Milk Tea', CAST(4.49 AS Decimal(10, 2)), N'Green tea flavored milk tea', N'https://aeonmall-binhtan.com.vn/wp-content/uploads/2021/05/010dda166794bc-trxanhxayphclong.png', 3, 48)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (16, N'Honeydew Milk Tea', CAST(4.49 AS Decimal(10, 2)), N'Refreshing honeydew flavored milk tea', N'https://aeonmall-binhtan-en.com/wp-content/uploads/2021/05/4726c0494a3e25-sclacphxay.png', 3, 49)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (17, N'Classic Milk Tea', CAST(3.49 AS Decimal(10, 2)), N'Classic and traditional milk tea', N'https://aeonmall-binhtan-en.com/wp-content/uploads/2021/05/4726c0494a3e25-sclacphxay.png', 3, 49)
INSERT [dbo].[Products] ([id], [name], [price], [description], [image], [cid], [quantity]) VALUES (18, N'Strawberry Milk Tea', CAST(4.49 AS Decimal(10, 2)), N'Sweet and fruity strawberry milk tea', N'https://aeonmall-binhduongcanary-en.com/wp-content/uploads/2020/05/tra-dao-da-xay.png', 3, 20)
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1, 2)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1, 3)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1, 4)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1, 5)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1, 6)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1, 8)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1, 9)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status], [id]) VALUES (N'SE170203', N'Nguyen Trung Hau', N'1', N'US', NULL, 10)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([id])
GO
