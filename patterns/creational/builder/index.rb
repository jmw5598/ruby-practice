
class HttpRequest
  def initialize
  end
end

module HttpRequestMethod
  GET = "GET"
  POST = "POST"
  PUT = "PUT"
  PATCH = "PATCH"
  DELETE = "DELETE"
  OPTION = "OPTION"
  HEAD = "HEAD"
end

class HttpRequestBuilder
  def self.create_builder
    HttpRequestBuilder.new
  end

  def initialize
    @request = HttpRequest.new
  end

  def with_method(method)
    puts "setting request method"
    self
  end

  def with_url(url)
    puts "setting request url"
    self
  end

  def with_query_params(params)
    puts "setting query params"
    self
  end

  def with_header(headers)
    puts "adding headers"
    self
  end

  def with_content_type(type)
    puts "setting content type"
    self
  end

  def with_body(body)
    puts "adding body"
    self
  end

  def with_authorization(prefix, token)
    puts "adding authorization: #{prefix} #{token}"
    self
  end

  def build
    puts "building request..."
    @request
  end
end



request = HttpRequestBuilder.create_builder
  .with_url('https://localhost:3000')
  .with_query_params({ idd: 1 })
  .with_method(HttpRequestMethod::GET)
  .with_header("headers")
  .with_content_type("application/json")
  .with_body({})
  .with_authorization("Bearer", "kajsdfkljalsdjfljasdf")
  .build;

puts request
