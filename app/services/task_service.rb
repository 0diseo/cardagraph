# frozen_string_literal: true


module TaskService
  def self.create_task(params, project)
    project.tasks.new(params)
  end
end