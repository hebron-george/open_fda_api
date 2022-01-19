# frozen_string_literal: true

RSpec.describe OpenFdaApi::Drugs do
  let(:instance) { described_class.new }

  context "#adverse_events" do
    subject(:adverse_events_call) { instance.adverse_events }
    let(:url) { URI("https://api.fda.gov/drug/event.json?") }
    it "makes a call to the API" do
      expect(Net::HTTP).to receive(:get).with(url).and_return("{}")
      adverse_events_call
    end
  end
end
