require "test_helper"

describe Page do

  it "must be valid" do
    value(build(:page)).must_be :valid?
  end

  it "wont be valid" do
    value(build(:page, url: "")).wont_be :valid?
    value(build(:page, url: "badurl")).wont_be :valid?
  end

  it "should parse the url" do
    VCR.use_cassette("google") do
      create(:page, url: 'http://www.google.com').content.must_match /Google/
    end
  end
end
