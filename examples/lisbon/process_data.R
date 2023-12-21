# readme ------------------------------------------------------------------

### PREPARE OD2NET INPUTS > od_raw.xlsx
## In this script I process my "od.csv" according to od2net's input requirements.  
## I am modifying "od_raw.xlsx", a file that contains the exported attribute table
## from zones.shp (file from which I also exported zones.geojson).

## NOTES
##        1) student point data consists of 31k randomly created points (constrained 
##        to all building footprints (extracted from national land use dataset) within
##        a 5km buffer of the Lisbon municipality administrative borders (excluding 
##        buildings located on the opposite margin of the Tagus river)).
##
##        2) my destinations consist of primary, middle and high schools within
##        Lisbon administrative borders.
##        

## columns: 
##               id: int32 (len 8); stores zone id
##  [REQUIRED]   count: int32 (len 4); stores number of students within that zone
##               wkt: string (len 254); stores polygon geometry as wkt
##  [REQUIRED]   name: string (len 10); stores zone id as text
##               nschool_we: int32 (len 2); stores number of schools within polygon


# script ------------------------------------------------------------------

library(sf)
library(readxl)

## load data, erase unnecessary columns
zones <- read_sf("od2net/processing/od_raw.xlsx")
od <- zones[, -c(1, 3)]
#rm(zones)

## manage columns, randomly assign destinations (schools)
# create required columns
od$from <- 'undefined'
od$from <- od$name
od$to <- 'undefined'
od <- od[ , -2]

## randomly assign destinations (weighted sampling)
# destination assignment loop 
schools <- od[od$nschool_we != '0', c(2, 3)]
for (i in 1:length(od$from)) {
  od[i, 4] <- sample(schools$from, size = 1, replace = TRUE, prob = schools$nschool_we)
}
# get histograms of assigned destinations 
nschool1 <- od[od$nschool_we == 1, ]
nschool2 <- od[od$nschool_we == 2, ]
hist(as.numeric(nschool1$to), breaks = length(unique(nschool1$to)))
hist(as.numeric(nschool2$to), breaks = length(unique(nschool2$to)))
# check for normality, use Kolmogorov for nschool_we == 1 (96 instances) and Shapiro-Wilk for nschool_we == 2 (9 instances)
### IGNORE THESE LINES, END THIS SECTION WHEN POSSIBLE 
###     ~run kolmogorov~ ks.test(as.numeric(nschool1$to), as.numeric(nschool2$to))
###     ~run shapiro~ 
# clean env
#rm(schools, nschool1, nschool2, i)

## tidy od up, save od datarframe and R session image
od <- od[ , -2]
od <- od[ , c(2, 3, 1)]
write.csv(od, "od2net/input/od.csv", row.names = FALSE)
save.image("od2net/processing/process_data.Rdata")

