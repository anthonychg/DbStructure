IF OBJECT_ID ('MyTable') IS NOT NULL
	DROP TABLE MyTable
CREATE TABLE dbo.MyTable
(
RowID		INT NOT NULL IDENTITY(1,1),
ColumnA		INT NOT NULL,
ColumnB		INT NOT NULL
CONSTRAINT DF_MyTable_ColumnB_Zero DEFAULT(0),
CONSTRAINT [PK_MyTable] PRIMARY KEY CLUSTERED
	(
	RowID ASC
	) ON [PRIMARY],
CONSTRAINT [UNQ_MyTable] UNIQUE NONCLUSTERED
	(
	[ColumnA],
	[ColumnB],
	) ON [PRIMARY],
CONSTRAINT [FK_MyTable_ColumnA] FOREIGN KEY (ColumnA) REFERENCES OtherTable([OtherTableColumn]) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT [FK_MyTable_ColumnB] FOREIGN KEY (ColumnB) REFERENCES OtherTable([OtherTableColumn]) ON DELETE NO ACTION ON UPDATE NO ACTION
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_MyTable_Column_cl] ON MyTable([Column])
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = OFF, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE INDEX [IX_MyTable_ColumnA_ncl] ON MyTable([ColumnA])
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = OFF, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE MyTable
ADD CONSTRAINT DF_MyTable_ColumnB_DEFAULT_ZERO DEFAULT 0 FOR ColumnB
GO
ALTER TABLE MyTable
ADD CONSTRAINT PK_MyTable PRIMARY KEY CLUSTERED (ColumnName)
GO
