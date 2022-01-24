# frozen_string_literal: true

require "rspec"

RSpec.describe OpenFdaApi::Tobacco do
  let(:instance) { client.tobacco }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#problem_reports API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/tobacco/problem.json") do |_env|
          [200, { "Content-Type" => "application/json" },
           File.read("spec/fixtures/tobacco/problem.json")]
        end
      end
    end
    subject(:problem_reports_call) { instance.problem_reports }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end
end
