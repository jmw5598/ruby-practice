class HttpRequest

end


class HttpRequestMiddleware
  attr_reader :next_middleware

  def initialize(next_middleware)
    @next_middleware = next_middleware
  end

  def handle(request)
    raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
  end
end


class NullHttpRequestMiddleware
  def handle(request)
    puts "End of HTTP Request Middleware Chain"
    request
  end
end


class AuthorizedHttpRequestMiddleware < HttpRequestMiddleware
  def handle(request)
    puts "Authorizing HTTP request..."
    @next_middleware.handle(request);
  end
end


class ValidateHttpRequestBodyMiddleware < HttpRequestMiddleware
  def handle(request)
    puts "Validating HTTP request body..."
    @next_middleware.handle(request);
  end
end

class ResolveTenantHttpRequestMiddleware < HttpRequestMiddleware
  def handle(request)
    puts "Resolving tenant from HTTP request header..."
    @next_middleware.handle(request);
  end
end

class ResolveAuthenticatedUserHttpRequestMiddleware < HttpRequestMiddleware
  def handle(request)
    puts "Resolving authenticated user from Authorization header..."
    @next_middleware.handle(request);
  end
end


class HttpRequestMiddlewareBuilder
  def self.create_builder
    HttpRequestMiddlewareBuilder.new
  end

  def initialize
    @middleware = []
  end  

  def with_middleware(middleware)
    @middleware.unshift(middleware)
    self
  end

  def build
    @middleware.reduce(NullHttpRequestMiddleware.new) { |root, middleware| middleware.new(root) }
  end
end

############################################################

middleware_filter_chain = HttpRequestMiddlewareBuilder
  .create_builder
  .with_middleware(AuthorizedHttpRequestMiddleware)
  .with_middleware(ResolveTenantHttpRequestMiddleware)
  .with_middleware(ResolveAuthenticatedUserHttpRequestMiddleware)
  .with_middleware(ValidateHttpRequestBodyMiddleware)
  .build

request = HttpRequest.new
middleware_filter_chain.handle(request);
