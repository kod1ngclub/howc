# ==== deps
# - pip
# - grip

# ==== install python3
sudo apt update
sudo apt install python3-pip -y

# ==== set venv
python3 -m venv env
source env/bin/activate

# ==== install grip
pip install grip