'''

skip makeOrigins(), makeDestinations(), makeZones() and makeOD() as I already have created that data

'''


import csv
import json
import sys

sys.path.append("..")

from utils import *


def makeOSM():
    download(
        url="https://download.geofabrik.de/europe/portugal-latest.osm.pbf",
        outputFilename="input/portugal-latest.osm.pbf",
    )
    # clip to Lisbon
    run(
        [
            "osmium",
            "extract",
            "-b",
            "-9.2945628,38.6876965,-9.0520177,38.8417927",
            "input/portugal-latest.osm.pbf",
            "-o",
            "input/input.osm.pbf",
        ]
    )
                
if __name__ == "__main__":
    run(["mkdir", "-p", "input"])
    makeOSM()

