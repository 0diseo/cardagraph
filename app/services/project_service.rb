# frozen_string_literal: true

require 'jira_api'
require 'azura_api'
module ProjectService
  def self.create_project(params, organization)
    organization.projects.new(params)
  end

  def self.create_from_organization(organization)
    create_project_from[organization.app_type.to_sym].(organization)
  end

  def self.create_projects_from_jira(organization)
    projects = JiraApi.get_projects(organization.url, organization.access_user, organization.access_token)
    projects.map{|params|organization.projects.new(params.merge(organization_id: organization.id))}
  end

  def self.create_projects_from_azura(organization)
    projects = AzuraApi.get_projects(organization.url, organization.access_user, organization.access_token)
    projects.map{|params|organization.projects.new(params.merge(organization_id: organization.id))}
  end

  def self.create_project_from
    {
      jira: -> (organization){ create_projects_from_jira(organization)},
      azura: -> (organization){ create_projects_from_azura(organization)}
    }
  end

end