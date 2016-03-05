require 'rails_helper'

RSpec.describe "todo_lists/show", type: :view do
  before(:each) do
    @todo_list = assign(:todo_list, TodoList.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

end
