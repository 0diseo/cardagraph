require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        organization: nil,
        name: "Name",
        url: "Url"
      ),
      Project.create!(
        organization: nil,
        name: "Name",
        url: "Url"
      )
    ])
  end

  it "renders a list of projects" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
  end
end
