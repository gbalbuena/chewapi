require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  let (:page) { build(:page) }

  it "gets index" do
    get pages_url
    value(response).must_be :success?
  end

  it "creates page" do
    expect {
      post pages_url, params: { page: { url: page.url } }
    }.must_change "Page.count"

    value(response.status).must_equal 201
  end

  it "shows page" do
    page = create(:page)
    get page_url(page)
    value(response).must_be :success?
  end
end
