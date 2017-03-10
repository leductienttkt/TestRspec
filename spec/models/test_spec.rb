require 'rails_helper'

RSpec.describe Test, type: :model do
  
  context "associations" do
    it {is_expected.to have_many :ahihis}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :score}
  end
end
