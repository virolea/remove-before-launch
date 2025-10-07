# frozen_string_literal: true

# MARKDOWN = <<~MARKDOWN
#   This is a test to see if the parser can look for the different unchecked TODOs that can be bundled in a PR description.
#
#   - [ ] This is an unchecked TODO
#   - [x] This is a checked TODO
#   - [ ] Another unchecked TODO
#
#   Some more text here.
#
#   - [ ] Yet another unchecked TODO
#
#   End of the markdown content.
# MARKDOWN



REGEX = /^\s*-\s+\[\s\]\s+(.+)$/.freeze

pull_request_body = ARGV[0]

uncompleted_todos = pull_request_body.scan(REGEX)

if uncompleted_todos.empty?
  exit 0
else
  uncompleted_todos.each do |uncomplete_todo|
    puts "□ #{uncomplete_todo.first}\n"
  end

  exit 1
end
