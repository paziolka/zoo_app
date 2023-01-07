require 'rails_helper'

RSpec.describe Animal, type: :model do
  context "when name and species are present" do
    let(:animal) { create(:animal, name: "Pepsi", species: "Dog") }

    it "is valid" do
      expect(animal.valid?).to eq(true)
    end
  end

  context "when name is empty and species is present" do
    let(:animal) { build(:animal, name: "", species: "Dog") }

    it "is invalid" do
      expect(animal.valid?).to eq(false)
    end
  end

  context "when name is present and species is empty" do
    let(:animal) { build(:animal, name: "Pepsi", species: "") }

    it "is invalid" do
      expect(animal.valid?).to eq(false)
    end
  end

  context "when name is nil and species is present" do
    let(:animal) { build(:animal, name: nil, species: "Dog") }

    it "is invalid" do
      expect(animal.valid?).to eq(false)
    end
  end

  context "when name is present and species is nil" do
    let(:animal) { build(:animal, name: "Pepsi", species: nil) }

    it "is invalid" do
      expect(animal.valid?).to eq(false)
    end
  end

  describe "#age_in_months" do
    context "when an animal birth is 2021/01/12" do
      before { allow(Date).to receive(:today).and_return(Date.new(2022, 12, 24)) }

      let(:animal) { create(:animal, name: "Pepsi", birth: Date.new(2021, 02, 12)) }

      it "return an animal with age as month" do
        expect(animal.age_in_months).to eq(10)
      end
    end
  end

  describe ".is_beautiful?" do
    subject(:animal) { described_class.is_beautiful? }

    it "return true when animal is beautiful" do
      expect(animal).to eq(true)
    end
  end
end
