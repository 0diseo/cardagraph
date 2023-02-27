# frozen_string_literal: true
require 'rest-client'
class JiraApi

  @@endpoints = {
    get_projects: "rest/api/2/project",
    get_tasks: "rest/api/2/search?jql=project=%s"
  }

  def self.get_projects(url, user, token)
    uri = URI.join(url, @@endpoints[:get_projects])
    response = RestClient::Request.new(method: :get, url:uri.to_s, user:user, password: token).execute
    JSON.parse(response.to_str).map{|project| projects_params(project)}
  end

  def self.get_tasks(url, project_id, user, token)
    uri = URI.join(url, @@endpoints[:get_tasks]%[project_id])
    response = RestClient::Request.new(method: :get, url:uri.to_s, user:user, password: token).execute
    JSON.parse(response.to_str)["issues"].map{|task| task_params(task)}
  end

  def self.projects_params(project)
    {
      name: project["name"],
      url: project["self"],
      project_id: project["id"],
    }
  end

  def self.task_params(task)
    {
      id_task: task["id"],
      url: task["self"],
      name: task["fields"]["summary"],
      created: task["fields"]["created"],
      status: task["fields"]["status"]["name"],
      priority: task["fields"]["priority"]["name"],
      created_by: task["fields"]["creator"]["emailAddress"],
      resolution: task["fields"]["resolutiondate"]
    }
  end
end
