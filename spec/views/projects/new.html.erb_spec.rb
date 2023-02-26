require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      organization: nil,
      name: "MyString",
      url: "MyString"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[organization_id]"

      assert_select "input[name=?]", "project[name]"

      assert_select "input[name=?]", "project[url]"
    end
  end
end
