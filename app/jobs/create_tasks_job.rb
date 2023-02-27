class CreateTasksJob < ApplicationJob
  queue_as :default

  def perform(url, project, access_user, access_token)
    TaskService.create_from_project(url, project, access_user, access_token)
    project.save
  end
end
