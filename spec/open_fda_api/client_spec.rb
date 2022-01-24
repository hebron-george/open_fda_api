# frozen_string_literal: true

RSpec.describe "OpenFdaApi::Client" do
  let(:instance) { OpenFdaApi::Client.new }
  context "#drugs" do
    subject(:drugs) { instance.drugs }
    it "has the right type" do
      expect(drugs).to be_a(OpenFdaApi::Drugs)
    end
  end

  context "#device" do
    subject(:device) { instance.device }
    it "has the right type" do
      expect(device).to be_a(OpenFdaApi::Device)
    end
  end

  context "#food" do
    subject(:food) { instance.food }
    it "has the right type" do
      expect(food).to be_a(OpenFdaApi::Food)
    end
  end
end
