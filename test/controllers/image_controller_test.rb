require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest
  test "should optimize image" do
    # Load the image from file
    image_data = File.read(Rails.root.join('test', 'fixtures', 'files', 'test.png'))

    # Optimize the image using Tinify API
    Tinify.key = "YfNcx057LyVwlVnTbypf8mY7CNYW6LVj"
    Tinify.proxy = "http://user:pass@192.168.0.1:8080"
    optimized_data = Tinify.from_buffer(image_data).to_buffer

    # Verify that the optimized image is smaller than the original image
    assert optimized_data.length < image_data.length

    # Verify that the optimized image is returned when the image is optimized
    post '/images/optimize', params: { image: fixture_file_upload('files/test.png', 'image/png') }
    assert_response :success
    assert_equal optimized_data, response.body
  end
end