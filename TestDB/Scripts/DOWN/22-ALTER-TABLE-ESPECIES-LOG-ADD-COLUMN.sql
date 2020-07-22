
 declare @table_name nvarchar(256)
 declare @col_name nvarchar(256)
 declare @constraint nvarchar(50)
 set @table_name = N'EspeciesLog'
 set @col_name = N'ADemanda'

 select @constraint = d.name
 from 
     sys.tables t
     join sys.default_constraints d on d.parent_object_id = t.object_id
     join sys.columns c on c.object_id = t.object_id
                           and c.column_id = d.parent_column_id
 where 
     t.name = @table_name
     and c.name = @col_name
IF(@constraint IS NOT NULL)
 DECLARE  @DropConstraintSQL AS NVARCHAR(255)
 SET @DropConstraintSQL = 'ALTER TABLE ' + @table_name + ' DROP ' + @constraint

--Execute the sql to drop the constraint
EXEC (@DropConstraintSQL)

 set @col_name = N'Impreso'

 select @constraint = d.name
 from 
     sys.tables t
     join sys.default_constraints d on d.parent_object_id = t.object_id
     join sys.columns c on c.object_id = t.object_id
                           and c.column_id = d.parent_column_id
 where 
     t.name = @table_name
     and c.name = @col_name
IF(@constraint IS NOT NULL)
 SET @DropConstraintSQL = 'ALTER TABLE ' + @table_name + ' DROP ' + @constraint

--Execute the sql to drop the constraint
EXEC (@DropConstraintSQL)

ALTER TABLE EspeciesLog DROP COLUMN ADemanda 
ALTER TABLE EspeciesLog DROP COLUMN Impreso 
ALTER TABLE EspeciesLog DROP COLUMN IdEspecieADemandaImprimir 