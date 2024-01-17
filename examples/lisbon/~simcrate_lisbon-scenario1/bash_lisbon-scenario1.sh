# start recording terminal logs
script  

# run od2net
cd examples/lisbon/~simcrate_lisbon-scenario1


python3 setup_lisbon-scenario1.py

###
### calculate segment slope
###

cargo run --release config_lisbon-scenario1.json

# stop recording terminal logs


