require 'rails_helper'

RSpec.describe "animals/index", type: :view do
  before(:each) do
    assign(:animals, [
      Animal.create!(
        name: "Name",
        species: "Species"
      ),
      Animal.create!(
        name: "Name",
        species: "Species"
      )
    ])
  end

  it "renders a list of animals" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Species".to_s), count: 2
  end
end
