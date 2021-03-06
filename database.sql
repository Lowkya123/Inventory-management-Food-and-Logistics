USE [master]
GO
/****** Object:  Database [Inventory]    Script Date: 8/10/2016 9:12:15 PM ******/
CREATE DATABASE [Inventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Inventory.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Inventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Inventory_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Inventory] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Inventory] SET  MULTI_USER 
GO
ALTER DATABASE [Inventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventory] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Inventory] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Inventory]
GO
/****** Object:  Table [dbo].[item]    Script Date: 8/10/2016 9:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [nvarchar](max) NULL,
	[visibility] [int] NULL,
	[typeID] [int] NOT NULL,
	[threshold] [int] NULL,
	[Brand] [nvarchar](max) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[itemCollection]    Script Date: 8/10/2016 9:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemCollection](
	[itemID] [int] NOT NULL,
	[subItemID] [int] NOT NULL,
 CONSTRAINT [PK_itemCollection] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC,
	[subItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[log]    Script Date: 8/10/2016 9:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[unit] [nvarchar](50) NULL,
	[io] [nvarchar](50) NOT NULL,
	[dateofpurchase] [nvarchar](max) NOT NULL,
	[dateofexpiry] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[type]    Script Date: 8/10/2016 9:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](max) NOT NULL,
	[subtype] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (63, N'Real Apple Juice', 0, 30, 10, N'Real')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (64, N'Real Mixed Fruit Juice', 0, 30, 10, N'Real')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (65, N'Real Pomegranate', 0, 30, 10, N'Real')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (66, N'Real Cranberry Juice', 0, 30, 10, N'Real')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (67, N'Real Litchi Fruit Juice', 0, 30, 10, N'Real')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (68, N'Real Guava Juice', 0, 30, 10, N'Real')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (69, N'Minute Maid Pulpy Orange ', 0, 30, 10, N'Minute Maid')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (70, N'Minute Maid Nimbu Flavour', 0, 30, 10, N'Minute Maid')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (71, N'Maaza Bottle', 0, 30, 10, N'Mazza')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (72, N'Nandini Good Life Cow Milk', 0, 30, 10, N'Nandini')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (73, N'Haldiram Nimbu Masala', 0, 30, 10, N'Haldiram')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (74, N'Haldiram Bhujia Sev', 0, 30, 10, N'Haldiram')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (75, N'Haldiram Moong Dal', 0, 30, 10, N'Haldiram')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (76, N'MTR Snakup Ompudi', 0, 30, 10, N'MTR')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (77, N'Rose Kodubele Small', 0, 30, 10, N'Rose')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (78, N'Thumbs Up Bottle ', 0, 30, 10, N'Thumbs Up')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (80, N'Madhur Pure & Hygienic Sugar', 0, 30, 10, N'Madhur Pure')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (81, N'Kelloggs Real Honey', 0, 30, 10, N'Kelloggs')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (82, N'Kelloggs Chocos', 0, 30, 10, N'Kelloggs')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (83, N'Britannia Good Day Rich Pista Badam Cookies', 0, 30, 10, N'Britannia')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (84, N'Parle Hide & Seek Bourbon Chocolate Cream Biscuit', 0, 30, 10, N'Parle')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (85, N'Cadbury Oreo Chocolatey Sandwich Biscuits', 0, 30, 10, N'Cadbury')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (86, N'Knorr Cup a Soup Tomato Chatpata', 0, 30, 10, N'Knorr')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (87, N'Knorr Cup a Soup Sweet Corn Veg', 0, 30, 10, N'Knorr')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (88, N'Knorr Mixed Vegetable Cup a Soup', 0, 30, 10, N'Knorr')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (89, N'Britannia 50-50 Maska Chaska Biscuit ', 0, 30, 10, N'Britannia')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (90, N'Britannia Nutri Choice Hi Fibre Digestive Biscuit', 0, 30, 10, N'Britannia')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (91, N'Kelloggs Muesli Nuts Delight ', 0, 30, 10, N'Kelloggs')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (92, N'Sundrop Honey Roast Crunchy Peanut Butter', 0, 30, 10, N'Sundrop')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (93, N'Sundrop Honey Roast Creamy Peanut Butter', 0, 30, 10, N'Sundrop')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (94, N'Horlicks Standard Classis Malt Jar', 0, 30, 10, N'Horlicks')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (95, N'Cadbury Bournvita Jar 5 Star Magic', 0, 30, 10, N'Cadbury')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (96, N'Boost Jar', 0, 30, 10, N'Boost')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (97, N'Amul Butter', 0, 30, 10, N'Amul')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (98, N'Britannia Premium Bake Rusk', 0, 30, 10, N'Britannia')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (99, N'Amul Masti Spiced Buttermilk', 0, 30, 10, N'Amul')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (100, N'Kissan Mixed Fruit Jam', 0, 30, 10, N'Kissan')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (101, N'Fun Foods Egg Less Veg Mayonnaise', 0, 30, 10, N'Fun Foods')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (102, N' AirWick Lavender Dew Air Freshener Spray', 1, 96, 10, N'AirWick')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (103, N'Odonil Nature Lavender Air Freshener', 1, 96, 10, N'Odonil')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (104, N'Mothers Mixed South Indian Style Pickle', 1, 30, 10, N'Mothers Mixed')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (105, N'Aquafina Water Bottle', 0, 30, 10, N'Aquafina')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (106, N'Duracell AA Alkaline Battery', 1, 31, 10, N'Duracell')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (107, N'Kissan Squeezo Fresh Tomato Ketchup', 0, 30, 10, N'Kissan')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (108, N'Baba Ramdev Patanjali Pure Honey', 0, 30, 10, N'Patanjali')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (109, N'Scotch Brite Scrub Pad', 0, 96, 10, N'Scotch Brite')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (110, N'Lizol Sandal 3 In 1 Surface Cleaner', 1, 96, 10, N'Lizol')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (111, N'Vim Double Power Lime Liquid Dishwash', 1, 96, 10, N'Vim')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (112, N'Harpic Plus Bleach', 1, 96, 10, N'Harpic')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (113, N'Colin Glass & Household Cleaner', 1, 96, 10, N'Colin')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (114, N'Parle Hide & Seek Chocolate Chip Cookies', 0, 30, 10, N'Parle')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (115, N'MTR Gulab Jamun Jar 1', 0, 30, 10, N'MTR ')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (116, N'Maggi Masala Noodles', 0, 30, 10, N'Maggi')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (117, N'bag', 0, 31, 10, N'Dell')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (118, N'bottles', 0, 31, 10, N'Kitchenkraft Aquasafe')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (119, N'Pen', 0, 31, 10, N'Reynolds')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (120, N'Notepad', 0, 31, 10, N'Classmate')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (121, N'Marker', 0, 31, 10, N'Brustro Acrylic')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (122, N'Duster', 0, 31, 10, N'Oddy')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (123, N'Au Kit', 0, 31, 10, N'null')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (124, N'Emplyoee Kit', 0, 31, 10, N'null')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (139, N'abc', 0, 30, 10, N'null')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (145, N'pawan', 1, 96, 2, N'human')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (146, N'pawan MS', 1, 96, 5, N'being human')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (148, N'abc', 1, 30, 2, N'brand')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (149, N'abc', 1, 30, 2, N'brand')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (150, N'abc', 1, 30, 2, N'brand')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (151, N'abc', 1, 30, 1, N'def')
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (154, N'abc123', NULL, 30, NULL, NULL)
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (156, N'heybye', NULL, 30, NULL, NULL)
INSERT [dbo].[item] ([itemID], [itemName], [visibility], [typeID], [threshold], [Brand]) VALUES (157, N'heybye', NULL, 30, NULL, NULL)
SET IDENTITY_INSERT [dbo].[item] OFF
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (123, 117)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (123, 118)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (123, 119)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (123, 120)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (124, 117)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (124, 118)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (124, 119)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (124, 120)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (124, 121)
INSERT [dbo].[itemCollection] ([itemID], [subItemID]) VALUES (124, 122)
SET IDENTITY_INSERT [dbo].[log] ON 

INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (1, 63, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (2, 64, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (3, 65, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (4, 66, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (5, 67, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (6, 68, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (7, 69, 70, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (8, 70, 15, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (9, 71, 15, N'1.5 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (10, 72, 65, N'500 ml', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (11, 72, 75, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (12, 74, 20, N'150 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (13, 75, 8, N'350 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (14, 76, 12, N'350 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (15, 77, 10, N'180 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (16, 78, 20, N'150 gm', N'i', N'2016-08-01', N'2016-10-22', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (17, 69, 16, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (18, 69, 16, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (19, 81, 15, N'1 Kg', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (20, 82, 16, N'300 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (21, 83, 15, N'700 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (22, 84, 70, N'90 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (23, 85, 30, N'150 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (24, 86, 20, N'127.4 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (25, 87, 20, N'18 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (26, 88, 20, N'15 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (27, 89, 20, N'18 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (28, 90, 20, N'55 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (29, 91, 25, N'100 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (30, 92, 20, N'550 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (31, 93, 5, N'462 gm', N'i', N'2016-08-01', N'2016-10-22', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (32, 94, 5, N'462 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (33, 95, 3, N'400 gm', N'i', N'2016-08-01', N'2016-10-26', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (34, 96, 3, N'500 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (35, 97, 3, N'500 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (36, 98, 5, N'500 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (37, 98, 12, N'200 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (38, 99, 90, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (39, 101, 15, N'100 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (40, 102, 5, N'500 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (41, 103, 5, N'275 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (42, 105, 10, N'300 ml', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (43, 100, 10, N'50 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (44, 106, 3, N'300 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (45, 107, 5, N'500 ml', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (46, 106, 40, N'Pcs', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (47, 109, 3, N'900 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (48, 110, 3, N'500 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (49, 111, 5, N'7.5*2.5 cm 1 pc', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (50, 105, 10, N'500 ml', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (51, 105, 5, N'250 ml', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (52, 105, 5, N'500 ml', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (53, 105, 5, N'500 ml', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (54, 116, 15, N'82 gm', N'i', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (55, 97, 10, N'1 Kg', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (56, 97, 75, N'70 gm', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (82, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (83, 64, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (84, 65, 3, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (85, 66, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (86, 67, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (87, 68, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (88, 69, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (89, 70, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (90, 123, 60, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (91, 123, 18, N'null', N'o', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (92, 63, 10, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (93, 63, 4, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (94, 63, 4, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (95, 63, 4, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (96, 123, 42, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (97, 63, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (98, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (99, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (100, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (101, 63, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (102, 63, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (103, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (104, 123, 1, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (105, 123, 1, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (106, 123, 1, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (107, 123, 1, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (108, 123, 1, N'null', N'o', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (109, 123, 1, N'null', N'o', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (110, 123, 1, N'null', N'o', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (111, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (112, 66, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (113, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (114, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (115, 66, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (116, 66, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (117, 66, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (118, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (119, 66, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (120, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (121, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (122, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (123, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (124, 66, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
GO
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (125, 65, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (126, 65, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (127, 65, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (128, 65, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (129, 65, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (130, 65, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (131, 65, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (132, 63, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (133, 63, 5, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (134, 63, 5, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (135, 64, 2, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (136, 64, 2, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (137, 64, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (138, 65, 4, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (139, 65, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (140, 65, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (141, 66, 3, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (142, 67, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (143, 67, 2, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (144, 67, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (145, 67, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (146, 67, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (147, 68, 3, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (148, 68, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (149, 68, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (150, 70, 2, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (151, 70, 2, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (152, 70, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (153, 70, 4, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (154, 123, 2, N'null', N'i', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (155, 123, 2, N'null', N'o', N'2015-07-30', N'2016-10-05', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (156, 69, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (157, 69, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (159, 69, 10, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (162, 139, 12, N'1 Ltr', N'i', N'2016-08-01', N'2016-08-09', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (175, 139, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (176, 63, 1, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (181, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (183, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (184, 64, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (185, 69, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (187, 69, 4, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (189, 69, 4, N'1 Ltr', N'i', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (190, 69, 4, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-26', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (191, 69, 5, N'1 Ltr', N'i', N'2016-08-09', N'2016-09-08', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (194, 69, 0, N'1 Ltr', N'o', N'2016-08-09', N'2016-09-08', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (202, 69, 1, N'1 Ltr', N'o', N'2016-08-09', N'2016-09-08', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (208, 69, 0, N'null', N'o', N'2016-08-01', N'2016-10-26', N'Hyderabad')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (233, 145, 4, N'person', N'i', N'2016-08-10', N'2016-08-10', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (234, 145, 0, N'person', N'o', N'2016-08-10', N'2016-08-10', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (235, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (236, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (237, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (238, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (239, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (240, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (241, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (242, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (243, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (244, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (245, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (246, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (247, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (248, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (249, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (250, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (251, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (252, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (253, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (254, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (255, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (256, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (257, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (258, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (259, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (260, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (261, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (262, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (263, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (264, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (265, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (266, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (267, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (268, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (269, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (270, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (271, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (272, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (273, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (274, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (275, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (276, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (277, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (278, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (279, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (280, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (281, 146, 10, N'null', N'i', N'2016-08-08', N'2016-09-09', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (282, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (283, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (284, 145, 0, N'null', N'e', N'null', N'null', N'null')
GO
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (285, 146, 0, N'null', N'o', N'2016-08-08', N'2016-09-09', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (286, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (287, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (288, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (289, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (290, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (291, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (292, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (293, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (294, 146, 6, N'null', N'o', N'2016-08-08', N'2016-09-09', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (295, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (296, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (297, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (298, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (299, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (300, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (301, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (302, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (303, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (304, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (305, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (306, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (307, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (308, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (309, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (310, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (311, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (312, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (313, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (314, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (315, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (316, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (317, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (318, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (319, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (320, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (321, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (322, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (323, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (324, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (325, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (326, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (327, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (328, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (329, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (330, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (331, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (332, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (333, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (334, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (335, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (336, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (337, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (338, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (339, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (340, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (341, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (342, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (343, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (344, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (345, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (346, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (347, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (348, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (349, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (350, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (351, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (352, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (353, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (354, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (355, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (356, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (357, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (358, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (359, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (360, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (361, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (362, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (363, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (364, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (365, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (366, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (367, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (368, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (369, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (370, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (371, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (372, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (373, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (374, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (375, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (376, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (377, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (378, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (379, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (380, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (381, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (382, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (383, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (384, 145, 0, N'null', N'e', N'null', N'null', N'null')
GO
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (385, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (386, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (387, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (388, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (389, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (390, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (391, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (392, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (393, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (394, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (395, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (396, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (397, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (398, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (399, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (400, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (401, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (402, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (403, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (404, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (405, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (406, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (407, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (408, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (409, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (410, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (411, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (412, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (413, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (414, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (415, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (416, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (417, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (418, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (419, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (420, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (421, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (422, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (423, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (424, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (425, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (426, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (427, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (428, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (429, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (430, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (431, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (432, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (433, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (434, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (435, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (436, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (437, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (438, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (439, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (440, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (441, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (442, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (443, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (444, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (445, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (446, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (447, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (448, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (449, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (450, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (451, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (452, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (453, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (454, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (455, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (456, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (457, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (458, 63, 1, N'1 Ltr', N'i', N'2016-08-10', N'2016-08-17', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (459, 146, 3, N'null', N'o', N'2016-08-08', N'2016-09-09', N'Delhi')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (460, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (461, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (462, 63, 3, N'1 Ltr', N'i', N'2016-08-10', N'2016-08-17', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (463, 63, 3, N'1 Ltr', N'i', N'2016-08-10', N'2016-08-17', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (464, 123, 1, N'null', N'i', N'2016-08-08', N'2016-09-02', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (465, 123, 1, N'null', N'i', N'2016-08-08', N'2016-09-02', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (466, 123, 1, N'null', N'i', N'2016-08-08', N'2016-09-02', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (467, 123, 1, N'null', N'i', N'2016-08-08', N'2016-09-02', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (471, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (472, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (473, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (474, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (475, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (476, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (477, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (478, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (479, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'9999-99-99', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (480, 63, 1, N'1 Ltr', N'o', N'2016-08-01', N'2016-10-22', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (481, 63, 1, N'1 Ltr', N'i', N'2016-08-10', N'2016-08-31', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (482, 63, 1, N'1 Ltr', N'i', N'2016-08-10', N'2016-08-31', N'Bangalore')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (483, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (484, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (485, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (486, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (491, 145, 0, N'null', N'e', N'null', N'null', N'null')
GO
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (492, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (495, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (496, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (497, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (502, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (503, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (505, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (506, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (507, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (510, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (513, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (514, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (519, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (520, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (521, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (522, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (525, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (526, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (527, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (528, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (531, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (532, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (535, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (536, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (537, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (538, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (539, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (540, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (541, 145, 0, N'null', N'e', N'null', N'null', N'null')
INSERT [dbo].[log] ([id], [itemID], [Quantity], [unit], [io], [dateofpurchase], [dateofexpiry], [Location]) VALUES (542, 145, 0, N'null', N'e', N'null', N'null', N'null')
SET IDENTITY_INSERT [dbo].[log] OFF
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([typeID], [type], [subtype]) VALUES (30, N'root', N'food')
INSERT [dbo].[type] ([typeID], [type], [subtype]) VALUES (31, N'root', N'stationary')
INSERT [dbo].[type] ([typeID], [type], [subtype]) VALUES (96, N'root', N'cleaner')
SET IDENTITY_INSERT [dbo].[type] OFF
ALTER TABLE [dbo].[item]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[type] ([typeID])
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD  CONSTRAINT [FK_item_type] FOREIGN KEY([typeID])
REFERENCES [dbo].[type] ([typeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[item] CHECK CONSTRAINT [FK_item_type]
GO
ALTER TABLE [dbo].[itemCollection]  WITH CHECK ADD  CONSTRAINT [FK_itemCollection_item] FOREIGN KEY([itemID])
REFERENCES [dbo].[item] ([itemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[itemCollection] CHECK CONSTRAINT [FK_itemCollection_item]
GO
ALTER TABLE [dbo].[log]  WITH CHECK ADD FOREIGN KEY([itemID])
REFERENCES [dbo].[item] ([itemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Inventory] SET  READ_WRITE 
GO
