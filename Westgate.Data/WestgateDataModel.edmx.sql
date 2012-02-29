
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2011 12:30:31
-- Generated from EDMX file: D:\Amier Haider\Projects\WestGate\WestGate\Westgate.Data\WestgateDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WGData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ImageImageTag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImageTags] DROP CONSTRAINT [FK_ImageImageTag];
GO
IF OBJECT_ID(N'[dbo].[FK_TagImageTag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImageTags] DROP CONSTRAINT [FK_TagImageTag];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Images]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Images];
GO
IF OBJECT_ID(N'[dbo].[UserEnquiries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserEnquiries];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO
IF OBJECT_ID(N'[dbo].[ImageTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImageTags];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Images'
CREATE TABLE [dbo].[Images] (
    [ImageId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Description] varchar(1000)  NULL,
    [BeforeImagePath] varchar(100)  NULL,
    [AfterImagePath] varchar(100)  NULL,
    [CombinedImagePath] varchar(100)  NULL,
    [OrderImage] int  NULL,
    [GalleryImagePathBefore] varchar(100)  NULL,
    [GalleryImagePathAfter] varchar(100)  NULL
);
GO

-- Creating table 'UserEnquiries'
CREATE TABLE [dbo].[UserEnquiries] (
    [id] int IDENTITY(1,1) NOT NULL,
    [companyName] varchar(50)  NOT NULL,
    [personName] varchar(50)  NOT NULL,
    [email] varchar(50)  NOT NULL,
    [postCode] varchar(50)  NULL,
    [phoneNumber] varchar(50)  NULL,
    [enquiry] varchar(50)  NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [TagId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Description] varchar(1000)  NULL,
    [ShowInTabs] bit  NOT NULL,
    [IsEditable] bit  NOT NULL,
    [OrderNumber] int  NOT NULL
);
GO

-- Creating table 'ImageTags'
CREATE TABLE [dbo].[ImageTags] (
    [OrderNumber] int  NOT NULL,
    [ImageId] int  NOT NULL,
    [TagId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ImageId] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [PK_Images]
    PRIMARY KEY CLUSTERED ([ImageId] ASC);
GO

-- Creating primary key on [id] in table 'UserEnquiries'
ALTER TABLE [dbo].[UserEnquiries]
ADD CONSTRAINT [PK_UserEnquiries]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [TagId] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([TagId] ASC);
GO

-- Creating primary key on [ImageId], [TagId] in table 'ImageTags'
ALTER TABLE [dbo].[ImageTags]
ADD CONSTRAINT [PK_ImageTags]
    PRIMARY KEY CLUSTERED ([ImageId], [TagId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ImageId] in table 'ImageTags'
ALTER TABLE [dbo].[ImageTags]
ADD CONSTRAINT [FK_ImageImageTag]
    FOREIGN KEY ([ImageId])
    REFERENCES [dbo].[Images]
        ([ImageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TagId] in table 'ImageTags'
ALTER TABLE [dbo].[ImageTags]
ADD CONSTRAINT [FK_TagImageTag]
    FOREIGN KEY ([TagId])
    REFERENCES [dbo].[Tags]
        ([TagId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TagImageTag'
CREATE INDEX [IX_FK_TagImageTag]
ON [dbo].[ImageTags]
    ([TagId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------