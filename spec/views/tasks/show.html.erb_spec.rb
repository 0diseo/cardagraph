require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    assign(:task, Task.create!(
      organization: nil,
      name: "Name",
      url: "Url",
      id_task: "Id Task",
      status: "Status",
      priority: "Priority",
      created_by: "Created By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Id Task/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Priority/)
    expect(rendered).to match(/Created By/)
  end
end
