# frozen_string_literal: true

REGEX = /^\s*-\s+\[\s\]\s+(.+)$/.freeze

pull_request_body = ARGV[0]

incomplete_todos = pull_request_body.scan(REGEX)

if incomplete_todos.empty?
  exit 0
else
  puts "⚠️ There are still uncompleted todos that need your attention:\n\n"

  incomplete_todos.each do |incomplete_todo|
    puts "□ #{incomplete_todo.first}\n"
  end

  exit 1
end
