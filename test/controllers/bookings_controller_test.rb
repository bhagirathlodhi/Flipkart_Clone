require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get my_bookings" do
    get bookings_my_bookings_url
    assert_response :success
  end
end
