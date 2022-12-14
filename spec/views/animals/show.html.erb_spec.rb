require 'rails_helper'

RSpec.describe "animals/show", type: :view do
  before(:each) do
    assign(:animal, Animal.create!(
      name: "Name",
      species: "Species"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Species/)
  end
end
