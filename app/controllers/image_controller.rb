require 'tinify'

class ImageController < ApplicationController
  def optimise
    Tinify.key = Rails.application.credentials.tinify_api_key
    # source = Tinify.from_file(params[:file].tempfile.path)
    # source.to_file(params[:file].tempfile.path)

    source_data = File.read("C:/Irani/Work/SE/CodeCabin/Projects/images/Image4.jpg")
    result_data = Tinify.from_buffer(source_data).to_buffer

    uri = URI("https://api.tinify.com/shrink")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = "Basic " + Base64.strict_encode64("api:" + Tinify.key)
    request.body = result_data

    response = http.request(request)

    if response.code == "201"
   # Handle successful response
    puts "Image successfully optimized"
    else
    # Handle error response
    puts "Error #{response.code}: #{response.message}"

    render json: { success: true }
  rescue Tinify::Error => error
    render json: { success: false, error: error.message }
  end
end
