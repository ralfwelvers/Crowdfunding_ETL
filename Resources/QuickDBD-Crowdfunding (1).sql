-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/MZ4QJj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] varchar  NOT NULL ,
    [description] varchar  NOT NULL ,
    [goal] double  NOT NULL ,
    [pledged] double  NOT NULL ,
    [outcome] varchar  NOT NULL ,
    [backers_count] double  NOT NULL ,
    [country] varchar  NOT NULL ,
    [currency] varchar  NOT NULL ,
    [launch_date] date  NOT NULL ,
    [end_date] date  NOT NULL ,
    [category_id] varchar  NOT NULL ,
    [subcategory_id] varchar  NOT NULL ,
    CONSTRAINT [PK_campaign] PRIMARY KEY CLUSTERED (
        [cf_id] ASC
    )
)

CREATE TABLE [category] (
    [category_id] int  NOT NULL ,
    [category] varchar  NOT NULL 
)

CREATE TABLE [contacts] (
    [contact_id] int  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [email] varchar  NOT NULL 
)

CREATE TABLE [subcategory] (
    [subcategory_id] int  NOT NULL ,
    [subcategory] varchar  NOT NULL 
)

ALTER TABLE [category] WITH CHECK ADD CONSTRAINT [FK_category_category_id] FOREIGN KEY([category_id])
REFERENCES [campaign] ([category_id])

ALTER TABLE [category] CHECK CONSTRAINT [FK_category_category_id]

ALTER TABLE [contacts] WITH CHECK ADD CONSTRAINT [FK_contacts_contact_id] FOREIGN KEY([contact_id])
REFERENCES [campaign] ([contact_id])

ALTER TABLE [contacts] CHECK CONSTRAINT [FK_contacts_contact_id]

ALTER TABLE [subcategory] WITH CHECK ADD CONSTRAINT [FK_subcategory_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [campaign] ([subcategory_id])

ALTER TABLE [subcategory] CHECK CONSTRAINT [FK_subcategory_subcategory_id]

COMMIT TRANSACTION QUICKDBD