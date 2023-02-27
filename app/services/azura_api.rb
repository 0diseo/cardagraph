# frozen_string_literal: true

require 'rest-client'
class AzuraApi
  @@endpoints = {
    get_projects: "_apis/projects?api-version=7.0"
  }

  def self.get_projects(url, user, token)
    uri = URI.join(url, @@endpoints[:get_projects])
    response = RestClient::Request.new(method: :get, url:uri.to_s, user:user, password: token).execute
    JSON.parse(response.to_str)["value"].map{|project| projects_params(project)}
  end

  def self.projects_params(project)
    {
      name: project["name"],
      url: project["url"],
      project_id: project["id"],
    }
  end
end