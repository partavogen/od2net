# start recording terminal logs
script  

# run od2net
cd examples/lisbon/~simcrate_lisbon-scenario1


python3 setup_N_OSMHT_I_BO.py

###
### calculate segment slope
###

cargo run --release config_N_OSMHT_I_BO.json

# stop recording terminal logs


