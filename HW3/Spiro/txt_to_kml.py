import os
import xml.etree.ElementTree as et

#file location and name
path = os.getcwd()+"/HW3/Spiro/"
print(path)
filename = path+"spiro-coords-tt.txt"

# create xml document
xml_name =path+"test.kml"
root = et.Element("kml")
root.set("xmlns", "http://www.opengis.net/kml/2.2")
doc = et.Element("Document")
root.append(doc)

# style tag
style = et.Element("Style")
style.set("id", "z1")
iconstyle = et.Element("IconStyle")
icon = et.Element("Icon")
href = et.Element("href")
href.text = "http://www.google.com/intl/en_us/mapfiles/ms/micons/red-dot.png"
icon.append(href)
iconstyle.append(icon)
style.append(iconstyle)
doc.append(style)

# add rest of the points
file1 = open(path+"spiro-coords-tt.txt", 'r')
lines = file1.readlines()
count = 0
for line in lines:
    count += 1
    placemark = et.Element("Placemark")
    doc.append(placemark)
    styleurl = et.Element("styleUrl")
    styleurl.text = "#z1"
    point = et.Element("Point")
    c1 = et.SubElement(point, "coordinates")
    c1.text = line
    placemark.append(styleurl)
    placemark.append(point)

tree = et.ElementTree(root)

# writing to kml file
with open(xml_name, "wb") as files:
    tree.write(files)





