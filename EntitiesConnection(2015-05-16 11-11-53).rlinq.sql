ALTER TABLE [contact] DROP CONSTRAINT [ref_contact_Person]

go

-- Dropping index 'idx_contact_person_i_d' which is not configured in OpenAccess but exists on the database.
DROP INDEX [idx_contact_person_i_d] ON [contact]

go

-- add column for field _person
ALTER TABLE [contact] ADD [PersonID] int NULL

go

UPDATE [contact] SET [PersonID] = 0

go

ALTER TABLE [contact] ALTER COLUMN [PersonID] int NOT NULL

go

-- dropping unknown column [person_i_d]
ALTER TABLE [contact] DROP COLUMN [person_i_d]

go

ALTER TABLE [contact] ADD CONSTRAINT [ref_contact_Person] FOREIGN KEY ([PersonID]) REFERENCES [Person]([Id])

go

-- Index 'idx_contact_PersonID' was not detected in the database. It will be created
CREATE INDEX [idx_contact_PersonID] ON [contact]([PersonID])

go

