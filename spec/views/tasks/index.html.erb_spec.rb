require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        organization: nil,
        name: "Name",
        url: "Url",
        id_task: "Id Task",
        status: "Status",
        priority: "Priority",
        created_by: "Created By"
      ),
      Task.create!(
        organization: nil,
        name: "Name",
        url: "Url",
        id_task: "Id Task",
        status: "Status",
        priority: "Priority",
        created_by: "Created By"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Id Task".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Priority".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Created By".to_s), count: 2
  end
end
