require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    assign(:organization, Organization.create!(
      name: "Name",
      url: "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
  end
end
