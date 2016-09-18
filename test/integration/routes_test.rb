class RoutesTest < ActionDispatch::IntegrationTest
  test 'v1 module with defaults' do
    assert_generates '/pages', { controller: 'v1/pages', action: 'index' }
  end
end
