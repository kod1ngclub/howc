# ==== target files
INPUT=docs/howc.md
OUTPUT=build/index.html

# ==== set build environment
mkdir -p build

# ==== compile to HTML
grip $INPUT --export $OUTPUT
