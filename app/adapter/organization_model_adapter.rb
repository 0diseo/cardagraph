# frozen_string_literal: true

class OrganizationModelAdapter
  attr_reader :store

  def initialize(store = ::Organization)
    @store = store
  end

  def create(params)
    store.create(params)
  end
end