USE [master]
GO
/****** Object:  Database [FStore]    Script Date: 5/28/2023 5:30:08 PM ******/
CREATE DATABASE [FStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FStore] SET RECOVERY FULL 
GO
ALTER DATABASE [FStore] SET  MULTI_USER 
GO
ALTER DATABASE [FStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FStore', N'ON'
GO
ALTER DATABASE [FStore] SET QUERY_STORE = OFF
GO
USE [FStore]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 5/28/2023 5:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[Country] [varchar](15) NOT NULL,
	[Password] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/28/2023 5:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/28/2023 5:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/28/2023 5:30:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Weight] [varchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitInStock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (1, N'cwohlers0@blogs.com', N'Zoovu', N'Vitomarci', N'Slovenia', N'TXqth2')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (2, N'sglendining1@e-recht24.de', N'Digitube', N'Bobigny', N'France', N'YhyXDrxcAVQ')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (3, N'dpunt2@census.gov', N'Skidoo', N'Kawambwa', N'Zambia', N'0RrPL9ww')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (4, N'tlocker3@lulu.com', N'Kazio', N'Gapan', N'Philippines', N'6EjX7U')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (5, N'jtesyro4@blogtalkradio.com', N'Blogspan', N'Pasiripis', N'Indonesia', N'T2ymfm5BXgQm')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (7, N'fginty6@house.gov', N'Eimbee', N'Khantaghy', N'Kazakhstan', N'U0Yjcc4')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (8, N'tbraga7@unblog.fr', N'Brightdog', N'Göteborg', N'Sweden', N'6ZfDH4sUqBDl')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (9, N'hnisbith8@lycos.com', N'Bluejam', N'Fulu', N'China', N'chVDAl0A0')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (10, N'abilfoot9@people.com.cn', N'Flashspan', N'Changyuan', N'China', N'4MTnhWsM')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (11, N'jetchesa@netvibes.com', N'Viva', N'Stratónion', N'Greece', N'AiUekcJK')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (12, N'kcaronb@elpais.com', N'Realcube', N'Shishan', N'China', N'jBnIIs')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (13, N'ayurtsevc@google.nl', N'Minyx', N'Paulpietersburg', N'South Africa', N'I7PkAh9sfW')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (14, N'dpilipetsd@smh.com.au', N'Jabbersphere', N'Caper', N'Indonesia', N'8M16e4')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (15, N'orussele@jugem.jp', N'Yodo', N'Xiaoguan', N'China', N'T2muZTdPk')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (16, N'mheynsf@clickbank.net', N'Livetube', N'Waekolong', N'Indonesia', N'Zxsgab1hI')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (17, N'kreederg@amazon.co.jp', N'Eayo', N'Yao', N'Japan', N'NNo4vNLYG89')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (18, N'chaibelh@nsw.gov.au', N'Abata', N'Pakemitan', N'Indonesia', N'GID6xqZ6dEoo')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (19, N'atarlingi@who.int', N'Eire', N'Radoboj', N'Croatia', N'aVpBA6YXy')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (20, N'blemmenj@narod.ru', N'Kazu', N'Rungkam', N'Indonesia', N'JcjZnI6fTr')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (21, N'ycluattk@jugem.jp', N'Youspan', N'Zhencheng', N'China', N'AtmZZNcdKGI')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (22, N'cthodyl@google.pl', N'Myworks', N'Limoeiro', N'Brazil', N'qKmTtoiUlYx')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (23, N'alumbersm@ebay.com', N'Youspan', N'Non Narai', N'Thailand', N'7dPI1C')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (24, N'msandlandn@wordpress.org', N'Jetwire', N'Jieznas', N'Lithuania', N'GrgPHjVF4')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (25, N'nwillowayo@goo.gl', N'Twitterworks', N'Metz', N'France', N'MEL6i67uf')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (26, N'baickenp@webeden.co.uk', N'JumpXS', N'Orenburg', N'Russia', N'3ZFCf5oJcd')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (27, N'avaudinq@sakura.ne.jp', N'Buzzster', N'Paris 15', N'France', N'DptjVd')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (28, N'plutyr@aboutads.info', N'Buzzshare', N'Medvezh’yegorsk', N'Russia', N'qxr3izpx')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (29, N'ccossonss@networksolutions.com', N'Browsedrive', N'Santo Niño', N'Philippines', N'SYqlIB')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (30, N'astennettt@unicef.org', N'Demizz', N'Jiaoqi', N'China', N'5gZS4Vh')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (31, N'amontfortu@mapquest.com', N'Jayo', N'Gandorhun', N'Sierra Leone', N'NLz9Fcnv')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (32, N'mkillev@flavors.me', N'Kwimbee', N'Scholkine', N'Ukraine', N'eXSBOnbuIG')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (33, N'ejelfsw@reuters.com', N'Tagfeed', N'Alegria', N'Philippines', N'7juklaljMJ')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (34, N'amaciejax@nba.com', N'Skimia', N'Majiao', N'China', N'3oMxHw4cxm9')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (35, N'omathersony@google.ca', N'Flipstorm', N'Changgou', N'China', N'dIk0yy4UEGs')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (37, N'dbarrick10@barnesandnoble.com', N'Topicblab', N'Pingle', N'China', N'QU76ooYy')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (38, N'klascelles11@zdnet.com', N'Meevee', N'Bavorov', N'Czech Republic', N'wyXzm5zYK')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (39, N'twey12@cargocollective.com', N'Meevee', N'Volosovo', N'Russia', N'EQnjB8')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (40, N'mcarnson13@networkadvertising.org', N'Innotype', N'Yangying', N'China', N'eFsEtt')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (41, N'clemonnier14@live.com', N'Oyoloo', N'Jinchuan', N'China', N'fFIfWudfM9VX')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (42, N'jtabourel15@bravesites.com', N'Ailane', N'Miaotang', N'China', N'l3cEIvLX')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (43, N'sfairney16@rakuten.co.jp', N'Rhyloo', N'Werasari', N'Indonesia', N'xvTrlJ')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (44, N'vvenditti17@github.com', N'Kwideo', N'Maracanaú', N'Brazil', N'cEACBq3YrQn')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (45, N'tsymers18@etsy.com', N'Rhynoodle', N'Ararat', N'Armenia', N'FlypSY6dNkp8')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (46, N'ccoupman19@linkedin.com', N'Brightbean', N'Åmål', N'Sweden', N'dezQVqKlP')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (47, N'bheard1a@netlog.com', N'Oyonder', N'Maebashi-shi', N'Japan', N'WiJpD6Z')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (48, N'mlevins1b@discuz.net', N'Mycat', N'La Esmeralda', N'Venezuela', N'7ZwnQa')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (49, N'fswetland1c@sakura.ne.jp', N'Jaloo', N'Ngala', N'Nigeria', N'3JDsJUHn1rCj')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (50, N'lyurocjhin1d@japanpost.jp', N'Eadel', N'Parys', N'South Africa', N'3u2Bkae')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (51, N'dalenin1e@webs.com', N'Babbleset', N'Gourcy', N'Burkina Faso', N'ZMCzdz8Oj')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (52, N'rfraschetti1f@nydailynews.com', N'Tagpad', N'Tengrela', N'Ivory Coast', N'YnyJtn')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (53, N'esheron1g@time.com', N'Lajo', N'Brikcha', N'Morocco', N'YpuvHHGFyC')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (54, N'klemm1h@ezinearticles.com', N'Skibox', N'Novorossiysk', N'Russia', N'Huv22JClm')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (55, N'nkenelin1i@bing.com', N'Jatri', N'Chunyang', N'China', N'4EYK5uzTDZE')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (57, N'bgraalmans1k@google.nl', N'Zooveo', N'Huacheng', N'China', N'zAc7W4UMm')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (58, N'cgillespie1l@prnewswire.com', N'Mita', N'Fenglin', N'China', N'h877hI11oFrN')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (59, N'gsimonitto1m@diigo.com', N'LiveZ', N'Qingtong', N'China', N'JZ4ElaiTVu')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (60, N'fjahn1n@youtu.be', N'Tagtune', N'Besko', N'Poland', N'Gh3HZAZw6m')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (61, N'mswetland1o@taobao.com', N'Oba', N'Yicheng', N'China', N'nNbjuLG')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (62, N'pmouncher1p@webmd.com', N'Topicblab', N'Motala', N'Sweden', N'BF7bOIt')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (63, N'cjentgens1q@123-reg.co.uk', N'Oyoyo', N'Mapiripán', N'Colombia', N'Zj1Zgne')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (64, N'ttimbs1r@wix.com', N'Avamba', N'Sakété', N'Benin', N'UEcftYK0')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (65, N'mbutterwick1s@virginia.edu', N'Eabox', N'Luoshanchuan', N'China', N'GdvCvgHZ')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (66, N'gsheard1t@istockphoto.com', N'LiveZ', N'Nozdrzec', N'Poland', N'L7Wp8kmZW1jP')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (67, N'ijentzsch1u@studiopress.com', N'Demivee', N'Khairpur', N'Pakistan', N'9CnljzHl25')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (68, N'rjurczyk1v@noaa.gov', N'Jazzy', N'Martapura', N'Indonesia', N'1lRkkD')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (69, N'vhulburd1w@hexun.com', N'Buzzster', N'Xinpeicun', N'China', N'HUcsQnD3Uu3')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (70, N'kmcconnell1x@ox.ac.uk', N'Trupe', N'Panggung', N'Indonesia', N'vRQnGgENSrm')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (71, N'sgabby1y@slashdot.org', N'Brightdog', N'Staraya Kulatka', N'Russia', N'mAxmIpwcguH')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (72, N'flathbury1z@toplist.cz', N'Babbleopia', N'Galán', N'Colombia', N'zFCqMwWyj')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (73, N'bvalentetti20@wikipedia.org', N'Voonder', N'Tegalloa', N'Indonesia', N'Ord3iRc')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (74, N'aneighbour21@newsvine.com', N'Demivee', N'Khanino', N'Russia', N'rGSqucx')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (75, N'bkain22@prlog.org', N'Demivee', N'Zhagang', N'China', N'yZQx5h')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (76, N'stompkin23@unesco.org', N'Dabvine', N'Quince Mil', N'Peru', N'XTF6lMKs')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (77, N'hjurries24@tinypic.com', N'Tagchat', N'Dong’an', N'China', N'i5YYrAm')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (79, N'nkenewel26@mysql.com', N'Voonte', N'Kotri', N'Pakistan', N'blEX9Q1n1vL')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (81, N'rgianiello28@google.com', N'Babblestorm', N'Cipadung', N'Indonesia', N'YdFfHdiCLc')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (82, N'echevers29@1und1.de', N'Quimba', N'Shakhun’ya', N'Russia', N'3BdBgz1mYrl7')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (83, N'mdukes2a@comcast.net', N'Yadel', N'Melita', N'Canada', N'raKybW5Y')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (84, N'gadkin2b@seesaa.net', N'Realcube', N'Helsingborg', N'Sweden', N'kf0bmIuz')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (85, N'iwinterburn2c@merriam-webster.com', N'Miboo', N'Ponoka', N'Canada', N'KZjXOyW0')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (86, N'nfronsek2d@xing.com', N'Voolith', N'Hodoš', N'Slovenia', N'fqWn6bi5xa')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (87, N'cdoughtery2e@parallels.com', N'Edgepulse', N'Mostovskoy', N'Russia', N'fMdn0R7sOl')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (88, N'sblondell2f@blogs.com', N'Dabshots', N'Kolpny', N'Russia', N'JGnWUN')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (89, N'rwinser2g@loc.gov', N'Tagchat', N'Yongning', N'China', N'fXZP2uq2R')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (90, N'tpoytress2h@fema.gov', N'Jabbersphere', N'Kyonju', N'South Korea', N'Gg77XJa')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (91, N'cboscott2i@chron.com', N'Eimbee', N'Rajo Khanani', N'Pakistan', N'KgBH0EDv7g')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (92, N'bmurr2j@histats.com', N'Skyvu', N'Križanov', N'Czech Republic', N'uiFDSBww68Wi')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (93, N'lbowstead2k@shinystat.com', N'Youspan', N'Huazhou', N'China', N'ZTGjdotX4I')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (94, N'bthaim2l@seesaa.net', N'Realmix', N'Nariño', N'Colombia', N'eCc79xU')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (95, N'bbengefield2m@themeforest.net', N'Realblab', N'Wuxia', N'China', N'Jj8bQBAd')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (96, N'akunat2n@globo.com', N'Skibox', N'Matarraque', N'Portugal', N'3tJObk98M')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (97, N'vnoice2o@newyorker.com', N'Feedfire', N'Ar Rumaythiyah', N'Kuwait', N'QskXep')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (98, N'cwalkden2p@narod.ru', N'Buzzshare', N'Pau', N'Philippines', N'l8KaCwjh')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (99, N'mdebruijn2q@google.co.jp', N'Wikibox', N'Pa Bon', N'Thailand', N'd4I424Km5xHy')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (100, N'dtinman2r@mozilla.org', N'Jabbersphere', N'Wolongquan', N'China', N'YQg4EhxUk')
GO
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (1, 63, CAST(N'2023-02-15T00:00:00.000' AS DateTime), CAST(N'2022-10-07T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 592.0600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (2, 34, CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), CAST(N'2023-06-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 15, CAST(N'2023-01-17T00:00:00.000' AS DateTime), CAST(N'2022-12-13T00:00:00.000' AS DateTime), CAST(N'2023-01-11T00:00:00.000' AS DateTime), 110.6600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4, 20, CAST(N'2023-01-31T00:00:00.000' AS DateTime), NULL, NULL, 83.0200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (5, 14, CAST(N'2023-01-23T00:00:00.000' AS DateTime), CAST(N'2023-05-13T00:00:00.000' AS DateTime), CAST(N'2022-08-15T00:00:00.000' AS DateTime), 372.5300)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (6, 25, CAST(N'2023-02-02T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'2023-02-10T00:00:00.000' AS DateTime), 908.7400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (7, 62, CAST(N'2023-02-09T00:00:00.000' AS DateTime), NULL, NULL, 205.7400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (8, 15, CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'2023-08-02T00:00:00.000' AS DateTime), 498.8500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (9, 54, CAST(N'2023-02-26T00:00:00.000' AS DateTime), CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 877.6200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (10, 7, CAST(N'2023-02-02T00:00:00.000' AS DateTime), CAST(N'2023-04-10T00:00:00.000' AS DateTime), CAST(N'2023-08-21T00:00:00.000' AS DateTime), 460.1200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (11, 23, CAST(N'2023-02-19T00:00:00.000' AS DateTime), NULL, NULL, 452.3300)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (12, 39, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2022-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (13, 75, CAST(N'2023-02-23T00:00:00.000' AS DateTime), CAST(N'2023-01-03T00:00:00.000' AS DateTime), CAST(N'2023-03-17T00:00:00.000' AS DateTime), 571.0600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (14, 100, CAST(N'2023-01-24T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), 214.4000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (15, 20, CAST(N'2023-01-24T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime), CAST(N'2023-04-16T00:00:00.000' AS DateTime), 829.5400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (16, 88, CAST(N'2023-02-05T00:00:00.000' AS DateTime), NULL, NULL, 234.6000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (17, 31, CAST(N'2023-02-14T00:00:00.000' AS DateTime), NULL, NULL, 707.8200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (18, 9, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2023-02-10T00:00:00.000' AS DateTime), 693.4200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (19, 74, CAST(N'2023-03-01T00:00:00.000' AS DateTime), NULL, NULL, 350.9200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (20, 98, CAST(N'2023-02-09T00:00:00.000' AS DateTime), CAST(N'2023-05-23T00:00:00.000' AS DateTime), CAST(N'2022-09-22T00:00:00.000' AS DateTime), 244.7600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (21, 65, CAST(N'2023-02-09T00:00:00.000' AS DateTime), CAST(N'2022-03-15T00:00:00.000' AS DateTime), CAST(N'2023-05-25T00:00:00.000' AS DateTime), 192.4500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (22, 47, CAST(N'2023-03-04T00:00:00.000' AS DateTime), CAST(N'2023-04-20T00:00:00.000' AS DateTime), CAST(N'2022-08-18T00:00:00.000' AS DateTime), 982.9400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (23, 88, CAST(N'2023-02-28T00:00:00.000' AS DateTime), CAST(N'2023-02-13T00:00:00.000' AS DateTime), CAST(N'2022-07-12T00:00:00.000' AS DateTime), 779.1100)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (24, 66, CAST(N'2023-02-19T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-11-29T00:00:00.000' AS DateTime), 520.2700)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (25, 43, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2022-09-17T00:00:00.000' AS DateTime), CAST(N'2023-05-15T00:00:00.000' AS DateTime), 810.2100)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (26, 72, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2022-10-02T00:00:00.000' AS DateTime), CAST(N'2023-06-15T00:00:00.000' AS DateTime), 326.6400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (27, 89, CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2023-03-04T00:00:00.000' AS DateTime), CAST(N'2022-12-01T00:00:00.000' AS DateTime), 790.9500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (28, 45, CAST(N'2023-01-19T00:00:00.000' AS DateTime), CAST(N'2023-03-20T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), 126.1800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (29, 48, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2022-08-30T00:00:00.000' AS DateTime), CAST(N'2023-06-11T00:00:00.000' AS DateTime), 863.5200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (30, 97, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), CAST(N'2023-08-23T00:00:00.000' AS DateTime), 413.4400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (31, 31, CAST(N'2023-02-23T00:00:00.000' AS DateTime), CAST(N'2022-07-29T00:00:00.000' AS DateTime), CAST(N'2023-06-11T00:00:00.000' AS DateTime), 946.4400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (32, 67, CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2022-08-17T00:00:00.000' AS DateTime), CAST(N'2022-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (33, 41, CAST(N'2023-02-14T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2023-01-08T00:00:00.000' AS DateTime), 807.6400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (34, 100, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2022-04-21T00:00:00.000' AS DateTime), CAST(N'2022-10-29T00:00:00.000' AS DateTime), 609.6700)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (35, 21, CAST(N'2023-03-07T00:00:00.000' AS DateTime), CAST(N'2022-09-15T00:00:00.000' AS DateTime), CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (36, 98, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2022-04-10T00:00:00.000' AS DateTime), CAST(N'2022-10-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (37, 10, CAST(N'2023-03-04T00:00:00.000' AS DateTime), NULL, NULL, 973.0800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (38, 20, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (39, 71, CAST(N'2023-01-02T00:00:00.000' AS DateTime), CAST(N'2023-01-11T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (40, 84, CAST(N'2023-01-17T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), CAST(N'2023-05-29T00:00:00.000' AS DateTime), 735.4400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (41, 5, CAST(N'2023-03-02T00:00:00.000' AS DateTime), CAST(N'2022-06-29T00:00:00.000' AS DateTime), CAST(N'2023-08-16T00:00:00.000' AS DateTime), 758.3400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (42, 76, CAST(N'2023-01-20T00:00:00.000' AS DateTime), CAST(N'2022-04-09T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 555.7400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (43, 26, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, NULL, 323.7500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (44, 91, CAST(N'2023-02-02T00:00:00.000' AS DateTime), CAST(N'2022-03-16T00:00:00.000' AS DateTime), CAST(N'2023-04-09T00:00:00.000' AS DateTime), 56.0600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (45, 39, CAST(N'2023-02-22T00:00:00.000' AS DateTime), CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-10-02T00:00:00.000' AS DateTime), 619.6400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (46, 10, CAST(N'2023-01-26T00:00:00.000' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), CAST(N'2022-11-20T00:00:00.000' AS DateTime), 849.3500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (47, 23, CAST(N'2023-01-17T00:00:00.000' AS DateTime), NULL, NULL, 79.1800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (48, 51, CAST(N'2023-01-14T00:00:00.000' AS DateTime), NULL, NULL, 586.2500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (49, 77, CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2022-04-15T00:00:00.000' AS DateTime), CAST(N'2023-07-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (50, 81, CAST(N'2023-02-26T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (51, 26, CAST(N'2023-01-08T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), CAST(N'2022-12-22T00:00:00.000' AS DateTime), 860.2200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (52, 8, CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2022-11-30T00:00:00.000' AS DateTime), CAST(N'2023-03-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (53, 47, CAST(N'2023-02-07T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (54, 19, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 706.5100)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (55, 15, CAST(N'2023-02-24T00:00:00.000' AS DateTime), CAST(N'2023-04-05T00:00:00.000' AS DateTime), CAST(N'2023-06-19T00:00:00.000' AS DateTime), 908.5300)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (57, 67, CAST(N'2023-01-23T00:00:00.000' AS DateTime), CAST(N'2023-01-09T00:00:00.000' AS DateTime), CAST(N'2023-07-04T00:00:00.000' AS DateTime), 728.8500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (58, 9, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, NULL, 521.9600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (59, 33, CAST(N'2023-02-05T00:00:00.000' AS DateTime), NULL, NULL, 804.1700)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (60, 67, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-07-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (61, 69, CAST(N'2023-02-02T00:00:00.000' AS DateTime), CAST(N'2022-03-18T00:00:00.000' AS DateTime), CAST(N'2023-03-22T00:00:00.000' AS DateTime), 496.0500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (62, 47, CAST(N'2023-02-17T00:00:00.000' AS DateTime), CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-02T00:00:00.000' AS DateTime), 663.6000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (64, 32, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'2022-11-18T00:00:00.000' AS DateTime), 390.8800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (65, 22, CAST(N'2023-01-26T00:00:00.000' AS DateTime), CAST(N'2023-04-16T00:00:00.000' AS DateTime), CAST(N'2023-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (66, 85, CAST(N'2023-02-25T00:00:00.000' AS DateTime), NULL, NULL, 217.1800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (67, 59, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2022-05-31T00:00:00.000' AS DateTime), CAST(N'2022-08-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (68, 24, CAST(N'2023-01-03T00:00:00.000' AS DateTime), CAST(N'2023-01-06T00:00:00.000' AS DateTime), CAST(N'2023-06-20T00:00:00.000' AS DateTime), 82.8200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (69, 42, CAST(N'2023-02-17T00:00:00.000' AS DateTime), CAST(N'2022-04-09T00:00:00.000' AS DateTime), CAST(N'2023-06-19T00:00:00.000' AS DateTime), 483.4900)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (70, 91, CAST(N'2023-01-20T00:00:00.000' AS DateTime), CAST(N'2022-04-18T00:00:00.000' AS DateTime), CAST(N'2023-03-14T00:00:00.000' AS DateTime), 17.1800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (71, 35, CAST(N'2023-01-09T00:00:00.000' AS DateTime), NULL, NULL, 419.1300)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (72, 70, CAST(N'2023-02-11T00:00:00.000' AS DateTime), CAST(N'2022-07-16T00:00:00.000' AS DateTime), CAST(N'2022-10-08T00:00:00.000' AS DateTime), 262.9700)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (73, 89, CAST(N'2023-01-01T00:00:00.000' AS DateTime), NULL, NULL, 820.3100)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (74, 96, CAST(N'2023-03-02T00:00:00.000' AS DateTime), CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-03-09T00:00:00.000' AS DateTime), 807.5800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (75, 85, CAST(N'2023-02-21T00:00:00.000' AS DateTime), CAST(N'2022-08-12T00:00:00.000' AS DateTime), CAST(N'2023-05-16T00:00:00.000' AS DateTime), 30.0900)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (76, 47, CAST(N'2023-01-13T00:00:00.000' AS DateTime), CAST(N'2022-07-13T00:00:00.000' AS DateTime), CAST(N'2023-07-21T00:00:00.000' AS DateTime), 619.9100)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (77, 71, CAST(N'2023-02-25T00:00:00.000' AS DateTime), CAST(N'2022-12-24T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 880.3900)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (78, 19, CAST(N'2023-01-07T00:00:00.000' AS DateTime), CAST(N'2023-04-29T00:00:00.000' AS DateTime), CAST(N'2023-06-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (79, 70, CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-18T00:00:00.000' AS DateTime), CAST(N'2023-01-29T00:00:00.000' AS DateTime), 809.1500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (80, 74, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2023-01-07T00:00:00.000' AS DateTime), CAST(N'2023-08-10T00:00:00.000' AS DateTime), 588.1600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (81, 7, CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-04-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (82, 99, CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2023-02-11T00:00:00.000' AS DateTime), CAST(N'2023-07-21T00:00:00.000' AS DateTime), 222.0200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (83, 2, CAST(N'2023-02-14T00:00:00.000' AS DateTime), NULL, NULL, 638.5800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (84, 33, CAST(N'2023-02-07T00:00:00.000' AS DateTime), CAST(N'2022-10-09T00:00:00.000' AS DateTime), CAST(N'2022-10-08T00:00:00.000' AS DateTime), 539.3700)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (85, 51, CAST(N'2023-01-06T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-06-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (86, 70, CAST(N'2023-01-24T00:00:00.000' AS DateTime), CAST(N'2023-04-27T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (87, 11, CAST(N'2023-01-27T00:00:00.000' AS DateTime), NULL, NULL, 897.8600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (88, 3, CAST(N'2023-01-06T00:00:00.000' AS DateTime), CAST(N'2022-07-24T00:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), 248.8400)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (89, 85, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(N'2023-02-16T00:00:00.000' AS DateTime), 704.2600)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (90, 90, CAST(N'2023-03-06T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2023-06-07T00:00:00.000' AS DateTime), 747.5100)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (91, 37, CAST(N'2023-03-07T00:00:00.000' AS DateTime), CAST(N'2022-04-15T00:00:00.000' AS DateTime), CAST(N'2023-07-29T00:00:00.000' AS DateTime), 587.4800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (92, 83, CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL, NULL, 382.9300)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (93, 3, CAST(N'2023-02-10T00:00:00.000' AS DateTime), NULL, NULL, 766.4500)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (94, 68, CAST(N'2023-01-02T00:00:00.000' AS DateTime), CAST(N'2022-03-19T00:00:00.000' AS DateTime), CAST(N'2023-04-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (95, 68, CAST(N'2023-01-18T00:00:00.000' AS DateTime), NULL, NULL, 498.5200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (96, 67, CAST(N'2023-01-18T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (97, 2, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2022-06-25T00:00:00.000' AS DateTime), CAST(N'2023-07-21T00:00:00.000' AS DateTime), 196.1800)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (98, 76, CAST(N'2023-01-25T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (99, 33, CAST(N'2023-01-02T00:00:00.000' AS DateTime), CAST(N'2023-04-22T00:00:00.000' AS DateTime), CAST(N'2023-02-10T00:00:00.000' AS DateTime), 108.6200)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (100, 85, CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2022-06-05T00:00:00.000' AS DateTime), CAST(N'2023-02-19T00:00:00.000' AS DateTime), 135.3700)
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 79, 92.2600, 31, 18.93)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 6, 75.7600, 1, 17.16)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 29, 13.1700, 73, 9.52)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 30, 72.6500, 78, 13.98)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 43, 87.4300, 36, 5.85)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 12, 76.0100, 77, 19.29)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 89, 12.3900, 69, 10.21)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 69, 78.4600, 29, 7.79)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 80, 74.6500, 40, 9.68)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 11, 62.3600, 68, 4.59)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 65, 72.9500, 15, 18.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 43, 65.5000, 50, 15.42)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 41, 8.5300, 19, 2.9)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 64, 12.9700, 36, 6.32)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 61, 13.6500, 27, 5.03)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 55, 75.8100, 17, 13.82)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (17, 25, 45.2500, 70, 7.13)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 84, 69.0000, 72, 16.6)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (19, 12, 76.4900, 74, 18.12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (20, 98, 41.8800, 73, 15.45)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 81, 18.0600, 33, 14.99)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (22, 6, 80.4200, 2, 13.77)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (23, 100, 58.0800, 51, 12.7)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (24, 43, 81.2600, 51, 13.77)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (25, 12, 65.1100, 63, 13.24)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (26, 14, 38.0800, 79, 17.87)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (27, 68, 5.1500, 12, 5.98)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (28, 58, 16.9200, 8, 6.65)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (29, 4, 84.0400, 89, 12.88)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (30, 81, 91.6900, 47, 12.61)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (31, 67, 68.3800, 25, 19.04)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (32, 15, 67.9400, 62, 9.43)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (33, 25, 31.3500, 96, 6.44)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (34, 84, 45.7700, 6, 14.78)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (35, 75, 59.0100, 32, 5.59)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (36, 81, 89.7400, 43, 9.21)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (37, 48, 56.5600, 77, 9.16)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (38, 36, 64.7700, 74, 7.77)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (39, 18, 39.7400, 69, 7.83)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (40, 84, 34.9600, 99, 5.53)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (41, 56, 5.5700, 87, 19.59)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (42, 98, 84.0100, 12, 17.71)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (43, 93, 66.6900, 44, 9.16)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (44, 96, 31.7700, 26, 11.19)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (45, 65, 88.6200, 4, 18.83)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (46, 75, 67.1100, 60, 4.89)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (47, 62, 54.8100, 52, 5.91)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (48, 61, 20.2900, 98, 4.89)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (49, 6, 24.5400, 53, 9.04)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (50, 24, 40.4300, 12, 9.25)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (51, 91, 62.2100, 55, 12.66)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (52, 78, 83.9700, 71, 17.62)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (53, 63, 13.0400, 87, 10.3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (54, 58, 86.2800, 78, 17.68)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (55, 13, 31.4000, 94, 18.9)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (56, 86, 54.6700, 78, 16.84)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (57, 18, 27.7600, 83, 12.89)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (58, 79, 48.1100, 54, 1.74)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (59, 26, 3.1700, 51, 1.88)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (60, 22, 62.2700, 1, 17.97)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (61, 51, 55.3000, 81, 7.38)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (62, 3, 22.1900, 65, 11.22)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (63, 92, 64.1200, 91, 5.46)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (64, 20, 31.2600, 13, 5.65)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (65, 25, 61.3800, 39, 17.7)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (66, 91, 19.4500, 35, 2.87)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (67, 13, 61.4700, 99, 9.1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (68, 49, 98.7600, 82, 3.63)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (69, 16, 46.4200, 18, 19.68)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (70, 65, 54.0600, 32, 3.31)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (71, 84, 72.3300, 49, 14.07)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (72, 39, 6.8400, 14, 5.79)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (73, 52, 17.1000, 36, 1.77)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (74, 57, 64.4000, 69, 6.94)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (75, 51, 36.1200, 72, 15.47)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (76, 50, 62.4400, 31, 11.08)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (77, 76, 76.8200, 50, 2.97)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (78, 20, 64.8200, 53, 2.79)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (79, 68, 97.0200, 14, 18.54)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (80, 64, 57.2700, 26, 9.77)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (81, 94, 56.6100, 33, 6.65)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (82, 36, 15.4100, 10, 19.84)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (83, 9, 31.1000, 87, 12.47)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (84, 83, 74.3200, 100, 14.69)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (85, 15, 53.8800, 12, 5.35)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (86, 56, 86.7100, 72, 19.62)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (87, 46, 83.6200, 83, 6.17)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (88, 64, 8.4300, 35, 17.16)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (89, 14, 84.4100, 89, 11.85)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (90, 18, 66.7800, 65, 2.99)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (91, 10, 85.3100, 57, 15.41)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (92, 2, 48.9600, 72, 17.41)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (93, 66, 46.8300, 21, 4.19)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (94, 4, 9.7800, 62, 17.6)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (95, 52, 38.9700, 89, 18.88)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (96, 45, 94.9400, 89, 2.72)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (97, 46, 4.1400, 91, 5.87)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (98, 22, 47.6000, 29, 17.24)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (99, 89, 6.0000, 66, 6.88)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (100, 83, 66.6100, 70, 5.68)
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (1, 34, N'Oxtail - Cut', N'62.4KG', 7.7000, 658)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (2, 54, N'Brocolinni - Gaylan, Chinese', N'65.2KG', 61.8300, 35)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (3, 62, N'Nut - Peanut, Roasted', N'56.1KG', 18.6100, 962)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (4, 14, N'Swordfish Loin Portions', N'11.2KG', 29.8600, 889)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (5, 3, N'Cafe Royale', N'77.2KG', 64.8900, 538)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (6, 83, N'Wine - Saint - Bris 2002, Sauv', N'21.5KG', 91.7700, 428)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (7, 6, N'Oven Mitts - 15 Inch', N'76.7KG', 29.2600, 619)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (8, 7, N'Rabbit - Whole', N'70.7KG', 72.6100, 317)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (9, 27, N'Cake - Lemon Chiffon', N'30.5KG', 16.9200, 57)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (10, 77, N'Onions - Cooking', N'12.8KG', 21.2400, 254)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (11, 43, N'Bagelers', N'83.3KG', 78.8300, 336)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (12, 85, N'Pepperoni Slices', N'10.4KG', 39.3000, 893)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (13, 31, N'Melon - Cantaloupe', N'93.2KG', 39.1900, 135)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (14, 88, N'Chicken - Livers', N'16.7KG', 34.4400, 472)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (15, 99, N'Cumin - Whole', N'09.6KG', 86.2200, 147)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (16, 64, N'Chivas Regal - 12 Year Old', N'06.5KG', 66.6100, 670)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (17, 100, N'Snapple Lemon Tea', N'01.9KG', 84.0800, 219)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (18, 9, N'Nantucket Cranberry Juice', N'07.5KG', 84.6400, 189)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (19, 75, N'Lettuce - Treviso', N'45.5KG', 9.4500, 827)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (20, 89, N'Ranchero - Primerba, Paste', N'34.3KG', 59.0600, 80)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (21, 40, N'Strawberries - California', N'43.0KG', 86.2500, 622)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (22, 27, N'Appetizer - Chicken Satay', N'21.4KG', 29.7600, 375)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (23, 43, N'Remy Red Berry Infusion', N'24.7KG', 83.0100, 517)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (24, 55, N'Beer - Alexander Kieths, Pale Ale', N'32.4KG', 27.7900, 39)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (25, 34, N'White Fish - Filets', N'56.7KG', 37.4800, 948)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (26, 99, N'Sprouts Dikon', N'02.5KG', 93.5000, 972)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (27, 56, N'Wine - Ruffino Chianti Classico', N'67.7KG', 12.6200, 754)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (28, 75, N'Gatorade - Orange', N'98.4KG', 53.4300, 324)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (29, 56, N'Lemon Grass', N'91.6KG', 46.6400, 563)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (30, 68, N'Island Oasis - Strawberry', N'26.4KG', 54.4500, 385)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (31, 60, N'Salmon Atl.whole 8 - 10 Lb', N'71.0KG', 51.2800, 275)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (32, 95, N'Tomato - Tricolor Cherry', N'94.3KG', 52.4100, 827)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (33, 7, N'Cheese - St. Andre', N'89.2KG', 88.7900, 37)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (34, 45, N'Soup - Base Broth Beef', N'78.1KG', 35.9300, 547)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (35, 92, N'Plums - Red', N'77.4KG', 57.3900, 992)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (36, 49, N'Tomatoes - Roma', N'23.9KG', 73.4300, 6)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (37, 23, N'Oil - Olive Bertolli', N'43.6KG', 2.0800, 786)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (38, 64, N'Lettuce - Arugula', N'64.5KG', 35.6900, 64)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (39, 60, N'Mussels - Cultivated', N'91.2KG', 34.7000, 63)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (40, 74, N'Beef - Baby, Liver', N'59.4KG', 32.8600, 831)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (41, 4, N'Ocean Spray - Ruby Red', N'77.9KG', 94.4300, 227)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (42, 6, N'Crush - Cream Soda', N'04.5KG', 78.1600, 969)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (43, 48, N'Langers - Cranberry Cocktail', N'30.4KG', 57.5700, 95)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (44, 2, N'The Pop Shoppe - Cream Soda', N'78.4KG', 98.4400, 506)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (45, 54, N'Bar - Granola Trail Mix Fruit Nut', N'79.7KG', 76.6400, 617)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (46, 41, N'Wine - Pinot Noir Mondavi Coastal', N'97.6KG', 2.9900, 238)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (47, 16, N'Seedlings - Mix, Organic', N'29.0KG', 4.1900, 53)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (48, 27, N'Cookie - Dough Variety', N'41.6KG', 96.4500, 219)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (49, 81, N'Olives - Stuffed', N'32.7KG', 51.5100, 288)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (50, 40, N'Wine - Tribal Sauvignon', N'27.8KG', 92.9900, 291)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (51, 86, N'Wine - Fat Bastard Merlot', N'81.8KG', 11.2700, 625)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (52, 100, N'Papayas', N'52.1KG', 58.7300, 131)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (53, 81, N'Coffee Beans - Chocolate', N'26.9KG', 26.8200, 182)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (54, 89, N'Blouse / Shirt / Sweater', N'12.9KG', 42.6100, 630)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (55, 7, N'Trout - Smoked', N'75.1KG', 13.1000, 968)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (56, 77, N'Pasta - Penne, Rigate, Dry', N'70.1KG', 48.6600, 307)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (57, 2, N'Beef - Bones, Marrow', N'65.1KG', 86.2800, 930)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (58, 5, N'Beets', N'65.6KG', 44.3400, 908)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (59, 70, N'Horseradish Root', N'69.5KG', 23.0800, 341)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (60, 99, N'Tea - Grapefruit Green Tea', N'03.5KG', 22.4100, 645)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (61, 91, N'Daikon Radish', N'17.5KG', 34.3500, 896)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (62, 40, N'Ranchero - Primerba, Paste', N'82.3KG', 53.4200, 785)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (63, 69, N'Wine - Shiraz South Eastern', N'27.0KG', 65.4800, 15)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (64, 70, N'Pasta - Penne, Lisce, Dry', N'68.3KG', 5.3300, 900)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (65, 2, N'Oil - Shortening,liqud, Fry', N'61.0KG', 61.8300, 225)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (66, 77, N'Wine - Manischewitz Concord', N'19.1KG', 7.7500, 508)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (67, 40, N'Tofu - Firm', N'36.7KG', 85.9300, 322)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (68, 6, N'Guava', N'01.7KG', 67.2300, 813)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (69, 81, N'Ham Black Forest', N'52.2KG', 53.6700, 895)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (70, 16, N'Tamarind Paste', N'56.1KG', 84.3600, 795)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (71, 63, N'True - Vue Containers', N'97.5KG', 38.2000, 591)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (72, 17, N'Bread Roll Foccacia', N'84.7KG', 25.6100, 709)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (73, 49, N'Wine - Chateau Timberlay', N'50.3KG', 65.9100, 636)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (74, 91, N'Soup - Campbells, Beef Barley', N'29.1KG', 89.2700, 983)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (75, 4, N'Ecolab Silver Fusion', N'84.8KG', 55.7200, 53)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (76, 47, N'Carbonated Water - Cherry', N'35.4KG', 95.9200, 690)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (77, 99, N'Wine - Cahors Ac 2000, Clos', N'93.7KG', 42.1500, 710)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (78, 12, N'Waffle Stix', N'71.6KG', 6.0300, 772)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (79, 56, N'Wine - Masi Valpolocell', N'04.1KG', 9.1700, 847)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (80, 23, N'Lettuce - Frisee', N'73.9KG', 91.6600, 110)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (81, 42, N'Beans - Butter Lrg Lima', N'75.1KG', 87.3800, 279)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (82, 90, N'Wine - Rosso Toscano Igt', N'47.4KG', 51.4200, 299)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (83, 44, N'Beer - True North Strong Ale', N'74.6KG', 69.7600, 153)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (84, 23, N'Cup - 4oz Translucent', N'01.9KG', 44.6900, 859)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (85, 19, N'Cream Of Tartar', N'05.5KG', 14.3800, 406)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (86, 57, N'Wine - Vineland Estate Semi - Dry', N'98.2KG', 97.0300, 772)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (87, 64, N'Veal - Shank, Pieces', N'84.9KG', 60.0600, 292)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (88, 41, N'Soup - Cream Of Broccoli', N'32.3KG', 51.4400, 409)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (89, 47, N'Pork - Smoked Kassler', N'65.8KG', 96.8500, 612)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (90, 54, N'Sauce - Hp', N'62.8KG', 69.7200, 17)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (91, 23, N'Coke - Classic, 355 Ml', N'75.3KG', 40.3600, 903)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (92, 2, N'Soup - Campbells, Classic Chix', N'36.0KG', 1.4000, 660)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (93, 46, N'Mix - Cocktail Strawberry Daiquiri', N'83.7KG', 1.1600, 529)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (94, 96, N'Juice - Clam, 46 Oz', N'55.5KG', 4.5500, 756)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (95, 67, N'Cornstarch', N'62.9KG', 76.3500, 975)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (96, 38, N'Sobe - Liz Blizz', N'74.3KG', 22.8300, 803)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (97, 2, N'Wine - Red, Lurton Merlot De', N'26.4KG', 10.0600, 535)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (98, 90, N'Artichoke - Fresh', N'42.6KG', 78.6100, 290)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (99, 11, N'Water Chestnut - Canned', N'74.5KG', 61.3700, 632)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (100, 17, N'Stock - Fish', N'53.1KG', 45.3800, 136)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
USE [master]
GO
ALTER DATABASE [FStore] SET  READ_WRITE 
GO
