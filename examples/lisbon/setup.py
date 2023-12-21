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


def makeOrigins():
    # Not every zone has a school, so for now, just use all buildings for both
    # origins and destinations
    extractCentroids(
        pbfInput="input/input.osm.pbf", geojsonOutput="input/buildings.geojson"
    )


def makeDestinations():
    # Same as origins
    pass


def makeZones():
    download(
        url="https://raw.githubusercontent.com/nptscot/npt/main/data-raw/zones_edinburgh.geojson",
        outputFilename="input/zones_edinburgh.geojson",
    )

    with open("input/zones_edinburgh.geojson") as f1:
        gj = json.load(f1)
        for f in gj["features"]:
            props = {"name": f["properties"]["InterZone"]}
            f["properties"] = props

        with open("input/zones.geojson", "w") as f2:
            f2.write(json.dumps(gj))

    download(
        url="https://raw.githubusercontent.com/nptscot/npt/main/data-raw/od_subset.csv",
        outputFilename="input/od_subset.csv",
    )
    # TODO Or in-place
    with open("input/od_subset.csv") as f1:
        with open("input/od.csv", "w") as f2:
            writer = csv.DictWriter(f2, fieldnames=["from", "to", "count"])
            writer.writeheader()

            for row in csv.DictReader(f1):
                writer.writerow(
                    {
                        "from": row["geo_code1"],
                        "to": row["geo_code2"],
                        # TODO Change depending on the goal. To compare against
                        # current cycle counters, just bicycle. To estimate mode
                        # shift, driving or all could be useful
                        "count": row["bicycle"],
                    }
                )
                
if __name__ == "__main__":
    run(["mkdir", "-p", "input"])
    makeOSM()

