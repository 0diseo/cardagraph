# frozen_string_literal: true


module TaskService
  def self.create_task(params, project)
    project.tasks.new(params)
  end

  def self.create_from_project(url, project, access_user, token)
    create_tasks_from[project.organization.app_type.to_sym].(url, project, access_user, token)
  end

  def self.create_tasks_from_jira(url, project, access_user, token)
    tasks = JiraApi.get_tasks(url, project.project_id, access_user, token)
    tasks.map{|params|project.tasks.new(params.merge(project_id: project.id))}
  end

  def self.create_tasks_from
    {
      jira: -> (url, project_id, access_user, token){ create_tasks_from_jira(url, project_id, access_user, token)},
    }
  end
end