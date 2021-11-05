
**************************** Important Points ************************************************************************

1. The 13 selfies are present inside the folder "Selfies at 13 points".

2. For the 13 coordinates taken from the University and home, the names have been shortened. Please refer to the "13 Points, 12 USC and Home.pdf" file, which lists all the points with the actual name and the label used for each of them. The points have been shown inside the ques5 kml ("ques5.kml"), screenshot for the same can be seen in the "ques5 google earth.png":
	-> if want to see separate file, then navigate to the folder, "USC locations and Ques5 separate kml files" and inside see the files, "usc.kml" and "USC points and Home on G_Earth.png"

3. The sql queries for the following are present inside "sql Queries Used.sql" file. Postgres has been used to implement Spatial DB
	-> Table creation
	-> Insertion of data into the table
	-> Printing the table -> screenshot attached -> "USC_Area Table.png"
	-> Query 1: get the convex hull polygon
	-> Query 2: get the 4 closest point to home

4. Files related to Query1 and Query 2: Convex Hull and 4 closest point: 
	-> query written to get the results are present in the "sql Queries Used.sql"
	-> single kml file for both -> "ques5.kml"
	-> screenshot -> "ques5 google earth.png"

5. If want to view separate kml's and much clearer screenshots for ques 5, the files are present inside "USC locations and Ques5 separate kml files" folder: 

6. A .html file (with the OpenLayers code) from step 6
	-> OL.html
	-> OpenLayer output.png -> output of the OL.html file

7. Spirograph point generation code, the resulting .kml file ("spiro.kml"), shapefile (this needs to be a .zip) and a screenshot
	-> spiro.js -> code to generate coordinates is present in this file. spiro.html file is used to run the JS file. All the coordinates are stored on the "arr" variable which are retrieved by running console.log(arr) in the console tab of the browser. 
	-> spiro.kml -> kml file
	-> mygeodata.zip -> shapefile
	-> Spiro_Graph from Shape File.png -> screenshot of the processed shape file
	-> Spiro_Graph from Google Earth.png -> screenshot of the spiro.kml file on google Earth.

************************************************************************************************************************