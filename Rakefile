require "minitest/test_task"

Minitest::TestTask.create(:test) do |t|
  t.libs << "test"
  t.warning = false
  t.verbose = true
  t.test_globs = ["test/**/*_test.rb"]
end
