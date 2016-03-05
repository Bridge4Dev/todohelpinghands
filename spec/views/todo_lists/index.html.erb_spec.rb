require 'rails_helper'

RSpec.describe "todo_lists/index", type: :view do
  before(:each) do
    assign(:todo_lists, [
      TodoList.create!(
        :title => "Title",
        :description => "MyText"
      ),
      TodoList.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

end
