# frozen_string_literal: true


class MembershipModelAdapter
  attr_reader :store

  def initialize(store = ::Membership)
    @store = store
  end

  def create(params)
    store.create(params)
  end
end