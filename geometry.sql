use samplegeometry
GO
CREATE TABLE Warehouse(ObjectName nvarchar(20), Place GEOMETRY);
GO
INSERT Warehouse VALUES('walls', 'LINESTRING(0 0,40 0, 40 40, 0 40, 0 0)')
INSERT Warehouse VALUES('Bean', 'POINT(5 35)');
INSERT Warehouse VALUES('Rod', 'LINESTRING(10 10, 25 25)');
INSERT Warehouse VALUES('Table', 'POLYGON((15 18, 35 18, 35 28, 15 28, 15 18))');
INSERT Warehouse VALUES('Swimblet','CURVEPOLYGON(CIRCULARSTRING(0 4, 4 0, 8 4, 4 8, 0 4), CIRCULARSTRING(2 4, 4 2, 6 4, 4 6, 2 4))');
GO
SELECT *
FROM Warehouse;
