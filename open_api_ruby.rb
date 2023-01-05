require "ruby/openai"
class OpenApiRuby
  client = OpenAI::Client.new(access_token: "YOUR_APIKEY")

  response = client.images.generate(
    parameters: {
      prompt: "go programming image with background black solid"
    }
  )
  puts response
  # puts response["choices"].map { |c| c["text"] }
end
