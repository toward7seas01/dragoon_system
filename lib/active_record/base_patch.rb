module ActiveRecord
  class Base
    extend ActiveSupport::Memoizable

    def error_messages
      errors.full_messages.join("<br />")
    end

    private

    def helpers
      ApplicationController.helpers
    end

    class << self

      def method_chains(params, *method_names)
        method_names.inject(scoped) do |result, method_name|
          result.send(method_name, params[method_name])
        end
      end

      private

      def or_empty_hash(param)
        unless param.blank?
          yield
        else
          {}
        end
      end

      def handle_input(input)
        if input.blank?
          []
        else
          input.split(" ").uniq
        end
      end
    end


  end
end


