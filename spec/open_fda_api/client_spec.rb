# frozen_string_literal: true

RSpec.describe "OpenFdaApi::Client" do
  let(:instance) { OpenFdaApi::Client.new }
  context "#drugs" do
    subject(:drugs) { instance.drugs }
    it "has the right type" do
      expect(drugs).to be_a(OpenFdaApi::Drugs)
    end
  end
end
