window.onload = init;

function init(){
    const map = new ol.Map({
        view: new ol.View({
            center: ol.proj.fromLonLat([-118.28826940037463, 34.026176953170754]),      // USC
            zoom: 14
        }),
        target: 'map',
        layers: [
            new ol.layer.Tile({
            source: new ol.source.OSM()
            })
        ]
    });
}

function addPointOnMap(x, y, ptLayer){
    var pt = new VectorLayer({
        title: '',
        source: new VectorSource({
            features: [x, y]
        }),
        style: new Style({
            image: new Circle({
                radius: 9,
                fill: new Fill({
                    color: 'red'
                })
            })
        })
    });
    ptLayer.getLayers().push(pt);
}

// collect points
var points = {"arr":[{"x":34.02926400675546, "y":-118.28642434194123},
{"x":34.02452802149622, "y":-118.28791766693948},
{"x":34.02065814284973, "y":-118.28988752043367},
{"x":34.0191549413457, "y":-118.28936200646002},
{"x":34.01998998756802, "y":-118.2869430541605},
{"x":34.018872198396636, "y":-118.28417599713117},
{"x":34.01913010540583, "y":-118.28239722579629},
{"x":34.01986975989288, "y":-118.28184151543769},
{"x":34.02170771465292, "y":-118.28171278769516},
{"x":34.022490142655904, "y":-118.2834138467218},
{"x":34.02323844023243, "y":-118.28526937694465},
{"x":34.02065444088764, "y":-118.28499034900311},
{"x":34.021608981481094, "y":-118.2868996671334}]};
// store pts in ls
localStorage.setItem("Points",JSON.stringify(points));
// you'd need to modify the above, to store all your points
var coords = JSON.parse(localStorage.getItem("Points"));
// verify that we fetched our data correctly
console.log(coords);
// we can iterate through our array [of points], like so:
var a = coords.arr; // 'a' will contain our array

var all_layers = map.getLayers;

var ptLayer = new ol.layer.Group({
    name: 'points layer',
    layers: []
});
for(var indx in a) {
    addPointOnMap(a[indx].x,a[indx].y, ptLayer);
}