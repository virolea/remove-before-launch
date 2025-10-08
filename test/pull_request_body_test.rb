# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/pull_request_body"

class PullRequestBodyTest < Minitest::Test
  TEST_MARKDOWN = <<~MARKDOWN
    This is a test to see if the parser can look for the different unchecked TODOs that can be bundled in a PR description.

    - [ ] Good syntax
    - [x] This is a checked TODO
      - [ ] Nested
    -  [ ] Bad syntax: extra space after the dash

  MARKDOWN

  def test_find_variously_formatted_incomplete_todos
    pull_request_body = PullRequestBody.new(text: TEST_MARKDOWN)
    incomplete_todos = pull_request_body.incomplete_todos

    assert incomplete_todos.length, 3
    assert incomplete_todos == ["Good syntax", "Nested", "Bad syntax: extra space after the dash"]
  end
end
