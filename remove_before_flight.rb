# frozen_string_literal: true

MARKDOWN = <<~MARKDOWN
  This is a test to see if the parser can look for the different unchecked TODOs that can be bundled in a PR description.

  - [ ] This is an unchecked TODO
  - [x] This is a checked TODO
  - [ ] Another unchecked TODO

  Some more text here.

  - [ ] Yet another unchecked TODO

  End of the markdown content.
MARKDOWN


puts ARGV[0]

REGEX = /^\s*-\s+\[\s\]\s+(.+)$/.freeze

uncompleted_todos = MARKDOWN.scan(REGEX)

if uncompleted_todos.empty?
  exit 0
else
  uncompleted_todos.each do |uncomplete_doto|
    puts "□ #{uncomplete_doto.first}\n"
  end

  exit 1
end
