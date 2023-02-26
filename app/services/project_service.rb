# frozen_string_literal: true

module ProjectService
    def self.create_project(params, organization)
      organization.projects.new(params)
  end
end