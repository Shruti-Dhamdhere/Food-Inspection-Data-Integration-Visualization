select * from dbo.Dallas_11

Select * from stg_chicago_fi


UPDATE dbo.Dallas_11 
SET Lat_Long_Location = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Lat_Long_Location, '[', ''), ']', ''), '(', ''), ')', ''), '''', '');
