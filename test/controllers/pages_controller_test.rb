require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  it "gets index" do
    get pages_url
    value(response).must_be :success?
  end

  it "creates page" do
    VCR.use_cassette("github") do
      expect {
        post pages_url, params: { page: { url: 'https://www.github.com' } }
      }.must_change "Page.count"

      value(response.status).must_equal 201
    end
  end

  it "shows page" do
    VCR.use_cassette("github") do
      page = create(:page, url: 'https://www.github.com')
      get page_url(page)
      value(response).must_be :success?
    end
  end
end
