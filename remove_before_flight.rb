# frozen_string_literal: true

REGEX = /^\s*-\s+\[\s\]\s+(.+)$/.freeze

pull_request_body = ARGV[0]

uncompleted_todos = pull_request_body.scan(REGEX)

if uncompleted_todos.empty?
  exit 0
else
  puts "⚠️ There are still uncompleted todos that need your attention:\n\n"

  uncompleted_todos.each do |uncompleted_todo|
    puts "□ #{uncompleted_todo.first}\n"
  end

  exit 1
end
