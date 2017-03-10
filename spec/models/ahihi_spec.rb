require 'rails_helper'

RSpec.describe Ahihi, type: :model do
  
  context "associations" do
    it {is_expected.to belong_to :test}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
  end
end
