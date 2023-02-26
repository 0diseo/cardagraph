# frozen_string_literal: true
require_relative '../../app/adapter/membership_model_adapter'
require_relative '../../app/adapter/organization_model_adapter'

module OrganizationService
  def self.membership_adapter
    @membership_adapter ||= MembershipModelAdapter.new
  end

  def self.membership_adapter=(membership)
    @membership_adapter = membership
  end

  def self.organization_adapter
    @organization_adapter ||= ReadingModelAdapter.new
  end

  def self.organization_adapter=(organization)
    @organization_adapter = organization
  end

  def self.create_organization(params, user)
    user.organizations.new(params)
  end

  def self.find(id, user)
    user.organizations.find(id)
  end

  def self.app_type
    [:jira, :azura]
  end

end
