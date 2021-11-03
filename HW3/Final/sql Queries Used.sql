-- Database: PostGres

-- **** Table creation ****
CREATE TABLE USC_Area (name VARCHAR, geog GEOGRAPHY(Point));

-- ****  Data Insertion into the table ****
INSERT INTO USC_Area VALUES ('Home', 'POINT(-118.28642434194123 34.02926400675546)'); 
INSERT INTO USC_Area VALUES ('Webb_Tower', 'POINT(-118.28791766693948 34.02452802149622)');
INSERT INTO USC_Area VALUES ('DWStructure', 'POINT(-118.28988752043367 34.02065814284973)');
INSERT INTO USC_Area VALUES ('AHRCParkside', 'POINT(-118.28936200646002 34.0191549413457)');
INSERT INTO USC_Area VALUES ('USCDDDCLASciences', 'POINT(-118.2869430541605 34.01998998756802)');
INSERT INTO USC_Area VALUES ('USCLSchool', 'POINT(-118.28417599713117 34.018872198396636)');
INSERT INTO USC_Area VALUES ('TRHall', 'POINT(-118.28239722579629 34.01913010540583)');
INSERT INTO USC_Area VALUES ('FBuilding', 'POINT(-118.28184151543769 34.01986975989288)');
INSERT INTO USC_Area VALUES ('HRHall', 'POINT(-118.28171278769516 34.02170771465292)');
INSERT INTO USC_Area VALUES ('AKDundonBert', 'POINT(-118.2834138467218 34.022490142655904)');
INSERT INTO USC_Area VALUES ('RamoHall', 'POINT(-118.28526937694465 34.02323844023243)');
INSERT INTO USC_Area VALUES ('DonLibrary', 'POINT(-118.28499034900311 34.02065444088764)');
INSERT INTO USC_Area VALUES ('PHBuilding', 'POINT(-118.2868996671334 34.021608981481094)');

-- **** Table Print ****
SELECT * FROM USC_area;

-- ******* Query 1: Convex hull query ************
SELECT st_astext(ST_ConvexHull(ST_Collect(geog::geometry))) AS
polygon FROM usc_area;

-- output of conver hull query: 
-- POLYGON((-118.28417599713117 34.018872198396636,-118.28936200646002 34.0191549413457,-118.28988752043367 34.02065814284973,-118.28642434194123 34.02926400675546,-118.28171278769516 34.02170771465292,-118.28184151543769 34.01986975989288,-118.28239722579629 34.01913010540583,-118.28417599713117 34.018872198396636))
-- see google earth image


-- ******* Query 2: 4 closest points to home ************
SELECT nb.name AS usc_loc, nb.geog AS usc_loc_coord,
ST_Distance(pt.geog, nb.geog) AS dist_to_home
FROM
  USC_Area pt,
  USC_Area nb
WHERE pt.name = 'Home' AND nb.name != 'Home'
ORDER BY ST_Distance(pt.geog, nb.geog) ASC
LIMIT 4;

-- output see table image attached and the google earth image
