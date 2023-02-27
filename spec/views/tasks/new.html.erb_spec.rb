require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      organization: nil,
      name: "MyString",
      url: "MyString",
      id_task: "MyString",
      status: "MyString",
      priority: "MyString",
      created_by: "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[organization_id]"

      assert_select "input[name=?]", "task[name]"

      assert_select "input[name=?]", "task[url]"

      assert_select "input[name=?]", "task[id_task]"

      assert_select "input[name=?]", "task[status]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[created_by]"
    end
  end
end
