const Filesystem = require('fs')
const MarkdownIt = require('markdown-it')

const INPUT = "docs/howc.md"
const OUTPUT = "build/index.html"

// ==== set environment
Filesystem.mkdirSync('build', { recursive: true })

// ==== build
const content = Filesystem.readFileSync(INPUT, 'utf-8')
const result = new MarkdownIt().render(content)

// ==== write result
Filesystem.writeFileSync(OUTPUT, result)
