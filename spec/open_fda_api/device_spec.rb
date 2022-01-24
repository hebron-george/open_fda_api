# frozen_string_literal: true

RSpec.describe OpenFdaApi::Device do
  let(:instance) { client.device }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#adverse_events API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/event.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/adverse_events.json")]
        end
      end
    end
    subject(:adverse_events_call) { instance.adverse_events }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#classification API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/classification.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/classification.json")]
        end
      end
    end
    subject(:classification_call) { instance.classification }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#premarket_501ks API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/501k.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/501k.json")]
        end
      end
    end
    subject(:premarket_501ks_call) { instance.premarket_501ks }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#recall_enforcement_reports API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/enforcement.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/enforcement.json")]
        end
      end
    end
    subject(:recall_enforcement_reports_call) { instance.recall_enforcement_reports }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#premarket_approval API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/pma.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/pma.json")]
        end
      end
    end
    subject(:premarket_approval_call) { instance.premarket_approval }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#recalls API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/recall.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/recall.json")]
        end
      end
    end
    subject(:recalls_call) { instance.recalls }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#registrations_and_listings API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/registrationlisting.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/registrationlisting.json")]
        end
      end
    end
    subject(:registrations_and_listings_call) { instance.registrations_and_listings }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#covid19_serological_tests API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/covid19serology.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/covid19serology.json")]
        end
      end
    end
    subject(:covid19_serological_tests_call) { instance.covid19_serological_tests }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#unique_device_identifier API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/device/udi.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/device/udi.json")]
        end
      end
    end
    subject(:unique_device_identifier_call) { instance.unique_device_identifier }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end
end
