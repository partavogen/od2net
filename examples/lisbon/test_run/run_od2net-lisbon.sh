### record terminal I/O
script bashLogs_od2net-lisbon_1stTestRun.txt

### run od2net-lisbon (direct)
cd ~/Documents/daniel/od2net/examples/lisbon
python3 setup.py
cargo run --release config_direct.json



### run od2net-lisbon (quiet)
cargo run --release config-quiet.json
### stop recording terminal I/O
exit

