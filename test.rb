require "ruby/openai"
class Test
  client = OpenAI::Client.new(access_token: "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")

  response = client.images.generate(
    parameters: {
      prompt: "golang image with background black solid"
    }
  )
  puts response
  # puts response["choices"].map { |c| c["text"] }
end
