# start recording terminal logs
script logs_lisbon-scenario_N_OSMHT_I_BO.txt

# run od2net
pwd
ls
cd Documents/daniel/od2net/examples/lisbon/~simcrate_lisbon-scenario_NearestSchool-OSMHighwayType-Identity-BikeOttawa

python3 setup_N_OSMHT_I_BO.py

###
### calculate segment slope
###

cargo run --release config_N_OSMHT_I_BO.json

# stop recording terminal logs


