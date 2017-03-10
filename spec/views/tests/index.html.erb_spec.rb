require "rails_helper"

RSpec.describe "tests/index.html.erb", type: :view do
  context "expected elements when init new" do
    let(:test) {FactoryGirl.create :test}

    before do
      assign :test, test
      assign :tests, Test.all
    end

    it "should include test" do
      render
      expect(rendered).to include test.name
    end
  end
end
