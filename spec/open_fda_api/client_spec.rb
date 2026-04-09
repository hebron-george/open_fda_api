# frozen_string_literal: true

RSpec.describe "OpenFdaApi::Client" do
  let(:instance) { OpenFdaApi::Client.new }

  context "#drugs" do
    it { expect(instance.drugs).to be_a(OpenFdaApi::Drugs) }
  end

  context "#device" do
    it { expect(instance.device).to be_a(OpenFdaApi::Device) }
  end

  context "#food" do
    it { expect(instance.food).to be_a(OpenFdaApi::Food) }
  end

  context "#animal_and_veterinary" do
    it { expect(instance.animal_and_veterinary).to be_a(OpenFdaApi::AnimalAndVeterinary) }
  end

  context "#tobacco" do
    it { expect(instance.tobacco).to be_a(OpenFdaApi::Tobacco) }
  end

  context "#other" do
    it { expect(instance.other).to be_a(OpenFdaApi::Other) }
  end
end
