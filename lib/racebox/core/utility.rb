module Racebox
  module Core
    module Utility
      module_function

      def is_uuid(uuid_string)
        return false if uuid_string.class != String

        uuid_components = uuid_string.downcase.scan(Regexp.new('^([0-9a-f]{8})-([0-9a-f]{4})-([0-9a-f]{4})-' + '([0-9a-f]{2})([0-9a-f]{2})-([0-9a-f]{12})$')).first

        uuid_components == nil ? false : true
      end
    end
  end
end