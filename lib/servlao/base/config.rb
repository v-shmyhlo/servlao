module Servlao
  class Base
    module Config
      attr_writer :base_uri

      def base_uri
        @base_uri || fail(Servlao::Errors::MissingConfiguration, 'base_uri')
      end
    end
  end
end
