module Servlao
  module Base
    module Request
      %i(get post put patch delete).each do |m|
        define_method m do |uri, **opts, &block|
          opts[:method] = m
          request_for(uri, opts, &block)
        end
      end

      def request_for(uri, **opts)
        Typhoeus::Request.new(base_uri + uri, opts).tap do |request|
          if block_given?
            request.on_complete { |response| yield Yajl.load(response.body) }
          end
        end
      end
    end
  end
end
