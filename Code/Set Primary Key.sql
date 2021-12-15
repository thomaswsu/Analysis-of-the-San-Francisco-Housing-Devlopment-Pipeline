USE SF_Development_Pipeline_2020_Q4
GO

ALTER TABLE dbo.cases_dim
ADD CONSTRAINT cases_no PRIMARY KEY (CASENO);