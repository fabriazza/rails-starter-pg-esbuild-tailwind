require "test_helper"

class ApplicationJobTest < ActiveJob::TestCase
  class ExampleJob < ApplicationJob
    def perform(value)
      value
    end
  end

  test "enqueues through Active Job" do
    assert_enqueued_with(job: ExampleJob, args: [ "ok" ]) do
      ExampleJob.perform_later("ok")
    end
  end
end
