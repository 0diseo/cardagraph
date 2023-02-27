class CreateProjectsJob < ApplicationJob
  queue_as :default

  def perform(organization)
    ProjectService.create_from_organization(organization)
    organization.save
  end
end
