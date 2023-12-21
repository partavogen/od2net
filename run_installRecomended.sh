### record terminal I/O
script bashLogs_installRecommended.txt

### get recommended apps/pkgs; install rust and osmium, run tippecanoe from docker image
## rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
## tippecanoe
git clone https://github.com/felt/tippecanoe.git
cd tippecanoe
make -j
sudo make install
## osmium
sudo apt-get update -y
sudo apt-get install -y osmium-tool

### stop recording terminal I/O
exit
