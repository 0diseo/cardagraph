# frozen_string_literal: true
require 'rest-client'
class JiraApi

  @@endpoints = {
    get_projects: "rest/api/2/project"
  }

  def self.get_projects(url, user, token)
    uri = URI.join(url, @@endpoints[:get_projects])
    response = RestClient::Request.new(method: :get, url:uri.to_s, user:user, password: token).execute
    JSON.parse(response.to_str).map{|project| projects_params(project)}
  end

  def self.projects_params(project)
    {
      name: project["name"],
      url: project["self"],
      project_id: project["id"],
    }
  end
end
