### record terminal I/O
script bashLogs_od2net-lisbon_1stTestRun.txt

### run od2net-lisbon (direct)
cd ~/Documents/daniel/od2net
cargo run --release examples/lisbon/config_direct.json


cd ~/Documents/daniel/od2net/exam
cargo run --release examples/lisbon/config-direct.json

cargo help run


### run od2net-lisbon (quiet)
cargo run --release config-quiet.json
### stop recording terminal I/O
exit

