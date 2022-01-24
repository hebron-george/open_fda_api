# frozen_string_literal: true

RSpec.describe OpenFdaApi do
  it "has a version number" do
    expect(OpenFdaApi::VERSION).not_to be nil
  end

  describe ".client" do
    context "with an api key" do
      subject(:client) { OpenFdaApi::Client.new(api_key: "gibberish") }
      it { expect { client }.to_not raise_error }
    end

    context "without an api key" do
      subject(:client) { OpenFdaApi::Client.new }
      it { expect { client }.to_not raise_error }
    end
  end
end
