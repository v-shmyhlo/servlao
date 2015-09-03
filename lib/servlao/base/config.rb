module Servlao
  module Base
    module Config
      attr_writer :base_uri

      def base_uri
        @base_uri || fail(Servlao::Errors::ConfigurationMissing, 'base_uri')
      end
    end
  end
end
