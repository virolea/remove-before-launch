# frozen_string_literal: true

require_relative "lib/pull_request_body"

pull_request_body = PullRequestBody.new(text: ARGV[0])

if pull_request_body.incomplete_todos.empty?
  exit 0
else
  puts "⚠️ There are still uncompleted todos that need your attention:\n\n"

  pull_request_body.incomplete_todos.each do |incomplete_todo|
    puts "□ #{incomplete_todo}\n"
  end

  exit 1
end
