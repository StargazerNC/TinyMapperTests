-- TinyMapperTests.Person
CREATE TABLE [Person] (
    [TypeID] int NOT NULL,                  -- _personType
    [name] varchar(255) NULL,               -- _name
    [Id] int NOT NULL,                      -- _id
    CONSTRAINT [pk_Person] PRIMARY KEY ([Id])
)
go

-- TinyMapperTests.Contact
CREATE TABLE [contact] (
    [phone] varchar(255) NULL,              -- _phone
    [person_i_d] int NOT NULL,              -- _person
    [id] int NOT NULL,                      -- _id
    [type_i_d] int NOT NULL,                -- _contactType
    [address] varchar(255) NULL,            -- _address
    CONSTRAINT [pk_contact] PRIMARY KEY ([id])
)
go

-- TinyMapperTests.ContactType
CREATE TABLE [contact_type] (
    [id] int NOT NULL,                      -- _id
    [description] varchar(255) NULL,        -- _description
    CONSTRAINT [pk_contact_type] PRIMARY KEY ([id])
)
go

-- TinyMapperTests.PersonType
CREATE TABLE [person_type] (
    [id] int NOT NULL,                      -- _id
    [description] varchar(255) NULL,        -- _description
    CONSTRAINT [pk_person_type] PRIMARY KEY ([id])
)
go

CREATE INDEX [idx_Person_TypeID] ON [Person]([TypeID])
go

CREATE INDEX [idx_contact_type_i_d] ON [contact]([type_i_d])
go

CREATE INDEX [idx_contact_person_i_d] ON [contact]([person_i_d])
go

ALTER TABLE [Person] ADD CONSTRAINT [ref_Person_person_type] FOREIGN KEY ([TypeID]) REFERENCES [person_type]([id])
go

ALTER TABLE [contact] ADD CONSTRAINT [ref_contact_contact_type] FOREIGN KEY ([type_i_d]) REFERENCES [contact_type]([id])
go

ALTER TABLE [contact] ADD CONSTRAINT [ref_contact_Person] FOREIGN KEY ([person_i_d]) REFERENCES [Person]([Id])
go

