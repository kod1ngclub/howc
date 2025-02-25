# ==== deps
# - pip
# - grip

# ==== use following commands to install
# sudo apt update
# sudo apt install python3-pip -y
# pip install grip

# ==== target files
INPUT=docs/howc.md
OUTPUT=build/index.html

# ==== set build directory
mkdir build

# ==== compile to HTML
grip $INPUT --export $OUTPUT
