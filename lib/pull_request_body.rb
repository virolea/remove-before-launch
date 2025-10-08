# frozen_string_literal: true

class PullRequestBody
  INCOMPLETE_TODO_REGEX = /^\s*-\s+\[\s\]\s+(.+)$/.freeze

  def initialize(text:)
    @text = text
  end

  def incomplete_todos
    @text.scan(INCOMPLETE_TODO_REGEX).map(&:first)
  end
end
