# target file
input=docs/howc.md
output=build/index.html
head=head.html

mkdir build
touch $head

# write custom head
html_keyword='<meta name="keywords" content="coding standard, kod1ngclub, C, C99, Clang" />'
html_description='<meta name="Description" content="C coding standard of Ko1ngclub" />'
html_style='<style> body { font-family: "Courier New", Courier, monospace; } </style>'

echo $html_keyword      > $head
echo $html_description  > $head
echo $html_style        > $head

# convert md to html
pandoc $input -o $output --metadata title="Howc" --standalone --include-in-header=$head
