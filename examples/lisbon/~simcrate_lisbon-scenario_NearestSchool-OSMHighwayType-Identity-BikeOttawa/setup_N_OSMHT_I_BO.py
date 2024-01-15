import json
import sys

sys.path.append("..")

from utils import *


def makeOSM():
    download(
        url="http://download.geofabrik.de/europe/portugal-latest.osm.pbf",
        outputFilename="input/portugal-latest.osm.pbf",
    )
    # clip to Lisbon
    run(
        [   # learn more about osmium @ https://osmcode.org/osmium-tool/manual.html
            "osmium",                          # calls osmium
            "extract", 			       # command extract clips pbf data	
            "-b",			       # -b selects clip method of bounding box (vs -p for geojson polygon)
            "-9.295,38.688,-9.052,38.842",     # our bounding box
            "input/portugal-latest.osm.pbf",   # name the input dataset
            "-o",                              # ???
            "input/input.osm.pbf",             # name the output dataset
        ]
    )

#def makeOrigins():
#    extractCentroids(
#        pbfInput="input/input.osm.pbf", geojsonOutput="input/#buildings.geojson"
#    )

#def makeDestinations():
#    # Same as origins
#    pass

if __name__ == "__main__":
    run(["mkdir", "-p", "input"])
    makeOSM()
    #makeOrigins()
    #makeDestinations()

