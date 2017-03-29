USE [master]
GO
/****** Object:  Database [ShaanFoods]  ******/
CREATE DATABASE [ShaanFoods]
GO
ALTER DATABASE [ShaanFoods] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShaanFoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShaanFoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShaanFoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShaanFoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShaanFoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShaanFoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShaanFoods] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShaanFoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShaanFoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShaanFoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShaanFoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShaanFoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShaanFoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShaanFoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShaanFoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShaanFoods] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShaanFoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShaanFoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShaanFoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShaanFoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShaanFoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShaanFoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShaanFoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShaanFoods] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShaanFoods] SET  MULTI_USER 
GO
ALTER DATABASE [ShaanFoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShaanFoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShaanFoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShaanFoods] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShaanFoods]
/****** don't touch before this   *******/
/****** Object:  Table [dbo].[employee]  ******/
/****** standard template on how to create tables *****/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[street] [varchar](50),
	[postalCode] [varchar](50),
    [email]	[varchar](50),
    [sin] [varchar](50) NOT NULL,
    [phone][varchar](50) NOT NULL,
    [emergency_contact] [varchar],
    [isAdministrator] [bit] NULL CONSTRAINT [DF_isAdministrator]  DEFAULT ((1))
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[productCategory]  ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productsCategory](
	[p_category_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[category_name] [varchar](50) NOT NULL,
	[price] [float] DEFAULT ((0)),
	[description] [varchar](50) NOT NULL,
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_products_category] PRIMARY KEY CLUSTERED 
(
	[p_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[products]  ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,	
	[product_name] [varchar](50) NOT NULL
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[customer_order]  ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,	
	[description] [varchar](50),
	[customer_name] [varchar](50) NOT NULL,
	[customer_phone] [varchar](50) NOT NULL,
	[pickup_time] [time] NOT NULL,
	[pickup_date] [date] NOT NULL,
	[order_weight] [decimal](18,0) NOT NULL,
	[order_quantity] [int] NOT NULL,
	[order_total_price] [decimal](18,0) NOT NULL,
	[order_status] [varchar](50)
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_customer_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[order_details]  ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,	
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[order_weight] [decimal](18,0) NOT NULL,
	[order_quantity] [int] NOT NULL,
	[order_price] [decimal](18,0) NOT NULL	
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[feedback]  ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[feed_id] [int] IDENTITY(1,1) NOT NULL,	
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](50),
	[feedback] [varchar](50),	
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[feed_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[account]  ******/
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[user_id] [int] IDENTITY(1,1) NOT NULL,	
	[user_name] [varchar](50) NOT NULL,
	[user_password] [varchar](50) NOT NULL,
	[role] [varchar](50),
	
	/* you can leave this we will do this just define the variables*/
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/***** set fields just put random data for now *****/
SET IDENTITY_INSERT [dbo].[employee] ON
INSERT [dbo].[employee] ([employee_id], [first_name], [last_name], [middle_name],[dob],[gender],[street],[postalCode],[sin],[phone]) 
VALUES 
(1, N'Gordon', N'Ramsey', N'Ramsey, Gordon', CAST(N'1990-06-23' AS Date),N'Male',N'299 Doon Vallye Drive123', N'K8V 4C4', N'123456789',N'519-748-0000')
INSERT [dbo].[employee] ([employee_id], [first_name], [last_name], [middle_name],[dob],[gender],[street],[postalCode],[sin],[phone]) 
VALUES 
(2, N'John', N'Cena', N'John, Cena', CAST(N'1990-06-26' AS Date),N'Male',N'299 Doon Vallye Drive456', N'K8V 6D4', N'123456789',N'519-748-0001')
INSERT [dbo].[employee] ([employee_id], [first_name], [last_name], [middle_name],[dob],[gender],[street],[postalCode],[sin],[phone]) 
VALUES 
(3, N'Luther', N'King', N'Luther, king', CAST(N'1990-06-2' AS Date),N'Male',N'299 Doon Vallye Drive789', N'K8V 7E4', N'123456789',N'519-748-0002') 
SET IDENTITY_INSERT [dbo].[employee] OFF

/* Products Table */
SET IDENTITY_INSERT [dbo].[products] ON
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (1, N'Beef')
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (2, N'Beef Steaks')
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (3, N'Veal')
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (4, N'Veal Steaks')
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (5, N'Lamb')
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (6, N'Goat')
INSERT [dbo].[products] ([product_id],[product_name])
VALUES (7, N'Chicken')
SET IDENTITY_INSERT [dbo].[products] OFF

/* Product Category */
SET IDENTITY_INSERT [dbo].[productsCategory] ON
/* Category '1-Beef'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (1, 1, N'Beef Boneless', 6.99, N'No fat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (2, 1, N'Beef Boneless with Fat', 5.49, N'Thin layer of fat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (3, 1, N'Stewing Beef', 5.99, N'Lean Beef')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (4, 1, N'Beef Shoulder', 3.79, N'Bone-in shoulder')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (5, 1, N'Beef Shanks Bone-In', 4.99, N'Nihary meat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (6, 1, N'Beef Boneless Shanks', 5.99, N'Nihary meat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (7, 1, N'Beef Eye-Round', 6.99, N'Arabic Kebbeh')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (8, 1, N'Beef Sirloin', 6.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (9, 1, N'Beef Inside', 6.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (10, 1, N'Beef Top-Butt', 6.99, N'Shish Taouk or Beef Skewer')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (11, 1, N'Lean Ground Beef', 3.99, N'17% fat $3.99 more than 5lb (Regular price $4.25)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (12, 1, N'Regular Ground Beef', 2.99, N'30% fat $2.99 more than 5lb (Regular price $2.99)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (13, 1, N'Beef Liver', 2.25, N'Liver slices')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (14, 1, N'Beef Kidney', 2.25, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (15, 1, N'Beef Heart', 2.25, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (16, 1, N'Beef Brisket', 3.99, N'')
/* Category '2-Beef Steaks'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (17, 2, N'Beef T-Bone', 6.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (18, 2, N'Beef Rib-Eye', 5.99, N'Bone-in steak (CANADA AA)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (19, 2, N'Beef Boneless Rib-Eye', 6.99, N'CANADA AA')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (20, 2, N'Beef Strip Loin', 6.99, N'CANADA AA')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (21, 2, N'Beef Sirloin Tip', 5.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (22, 2, N'Beef Sirloin Butt', 3.99, N'')
/* Category '3-Veal'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (23, 3, N'Veal Boneless', 6.99, N'No Fat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (24, 3, N'Veal Shoulder', 4.99, N'Bone-in shoulder')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (25, 3, N'Veal Neck', 4.29, N'Bone-in neck')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (26, 3, N'Veal Shanks Bone-In', 4.99, N'Nihary meat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (27, 3, N'Veal Boneless Shanks', 5.99, N'Nihary meat')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (28, 3, N'Veal Eye-Round', 6.99, N'Arabic Kebbeh')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (29, 3, N'Veal Sirloin', 6.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (30, 3, N'Veal Inside', 6.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (31, 3, N'Veal Top-Butt', 6.99, N'Shish Taouk or Beef Skewer')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (32, 3, N'Veal Liver', 2.25, N'Liver slices')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (33, 3, N'Veal Kidney', 2.25, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (34, 3, N'Veal Brain', 4.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (35, 3, N'Veal Brisket', 3.99, N'Bone-in Brisket')
/* Category '4-Veal-Steaks'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (36, 4, N'Veal T-Bone', 5.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (37, 4, N'Veal Rib-Eye', 5.99, N'Bone-in steak')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (38, 4, N'Veal Boneless Rib-Eye', 6.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (39, 4, N'Veal Strip Loin', 6.99, N'CANADA AA')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (40, 4, N'Veal Sirloin Tip', 6.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (41, 4, N'Veal Sirloin Butt', 6.99, N'')
/* Category '5-Lamb'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (42, 5, N'Whole Lamb', 280.00, N'$280 per lamb. Between 40lb to 45lb')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (43, 5, N'Lamb Leg', 7.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (44, 5, N'Lamb Shoulder', 7.49, N'Bone-in shoulder')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (45, 5, N'Lamb Ribs', 3.99, N'Bone-in ribs')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (46, 5, N'Lamb Liver(Set)', 7.99, N'$7.99 whole set. Liver, Lungs, Kidney, and Heart')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (47, 5, N'Lamb Head', 2.99, N'$2.99 each.')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (48, 5, N'Frozen Lamb Shanks', 4.99, N'Australian Lamb Shanks')
/* Category '6-Goat'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (49, 6, N'Whole Goat', 7.49, N'$7.49 per pound, Between 30lb to 35lb')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (50, 6, N'Goat Leg', 9.99, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (51, 6, N'Goat Shoulder', 9.49, N'Bone-in shoulder')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (52, 6, N'Goat Ribs', 4.99, N'Bone-in ribs')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (53, 6, N'Goat Liver(Set)', 7.99, N'$7.99 whole set. Liver, Lungs, Kidney, and Heart')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (54, 6, N'Goat Head', 2.99, N'$2.99 each.')
/* Category '7-Chicken'  */
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (55, 7, N'Whole Chicken', 2.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (56, 7, N'Chicken Legs', 1.89, N'Quater legs')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (57, 7, N'Boneless Chicken Breast', 5.25, N'Fryer Breast')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (58, 7, N'Boneless Chicken Leg-Meat', 4.25, N'Boneless Thighs')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (59, 7, N'Chicken Drums', 2.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (60, 7, N'Chicken Bone-In Thighs', 1.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (61, 7, N'Ground Chicken', 4.25, N'Breast Ground')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (62, 7, N'Chicken Whole Wings', 3.69, N'Fryer Wings')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (63, 7, N'Chicken Split Wings', 2.49, N'Cut 2 Wings')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (64, 7, N'Chicken Liver', 2.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (65, 7, N'Chicken Gizzar', 2.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (66, 7, N'Chicken Heart', 2.49, N'')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (67, 7, N'Whole Chicken Tandoori', 3.99, N'Marinated with Tikha and Tandoori')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (68, 7, N'Whole Chicken Achari', 3.99, N'Marinated with Achar Gosht Spice')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (69, 7, N'Whole Lahori Charga', 3.99, N'Marinated with Lahori Charga Spice(Whole Chicken)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (70, 7, N'Tandoori Chicken Legs', 3.50, N'Marinated with Tikha and Tandoori')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (71, 7, N'Tandoori Chicken Breast', 5.99, N'Marinated with Tikha and Tandoori(Boneless Breast)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (72, 7, N'Tandoori Chicken Thighs', 4.99, N'Marinated with Tikha and Tandoori (Boneless Leg Meat)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (73, 7, N'Tandoori Chicken Wings', 3.99, N'Marinated with Tikha and Tandoori(Whole Wings)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (74, 7, N'Achari Chicken Legs', 3.50, N'Marinated with Achar Gosht Spice')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (75, 7, N'Achari Chicken Breast', 5.99, N'Marinated with Tikha and Tandoori(Boneless Breast)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (76, 7, N'Achari Chicken Thighs', 4.99, N'Marinated with Tikha and Tandoori (Boneless Leg Meat)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (77, 7, N'Achari Chicken Wings', 3.99, N'Marinated with Tikha and Tandoori(Whole Wings)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (78, 7, N'Lahori Chicken Legs', 3.50, N'Marinated with Achar Gosht Spice')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (79, 7, N'Lahori Chicken Breast', 5.99, N'Marinated with Tikha and Tandoori(Boneless Breast)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (80, 7, N'Lahori Chicken Thighs', 4.99, N'Marinated with Tikha and Tandoori (Boneless Leg Meat)')
INSERT [dbo].[productsCategory] ([p_category_id],[product_id],[category_name],[price],[description])
VALUES (81, 7, N'Lahori Chicken Wings', 3.99, N'Marinated with Tikha and Tandoori(Whole Wings)')
SET IDENTITY_INSERT [dbo].[productsCategory] OFF
/***** don't forget to set identity off ******/
ALTER TABLE [dbo].[productsCategory] WITH CHECK ADD CONSTRAINT [FK_productsCategory_products] FOREIGN KEY ([product_id])
REFERENCES [dbo].[products] ([product_id])
GO 
ALTER TABLE [dbo].[productsCategory] CHECK CONSTRAINT [FK_productsCategory_products] 
/***** dont touch after this *******/
GO
USE [master]
GO
ALTER DATABASE [ShaanFoods] SET  READ_WRITE 
GO