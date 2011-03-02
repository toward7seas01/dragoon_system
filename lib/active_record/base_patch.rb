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

      def fuzzy(args)
        or_empty_scope(args) do
          query_params = []
          query_string = []

          args.each {|model, attrs|
            table, field, data = model, *attrs.to_a.flatten
            table, field, data = [table.table_name, field.to_s, handle_input(data).join("|")]

            unless data.blank?
              query_string << "#{table}.#{field} regexp ?"
              query_params << data
            end
          }

          unless query_string.empty?
            query_string = query_string.join(" or ")
            scoped({:conditions => [query_string] + query_params})
          else
            scoped
          end
        end
      end

      def newest
        scoped(:order => "#{self.table_name}.updated_at desc")
      end

      def desc
        scoped(:order => "#{self.table_name}.created_at desc")
      end

      def regexp(field, data, table = table_name)
        table_name = if table.is_a?(String)
          table
        elsif table < ActiveRecord::Base
          table.table_name
        else
          raise ArgumentError
        end

        regexp_condition(field, data, table_name)
      end

      private

      def or_empty_scope(param)
        unless param.blank?
          yield
        else
          scoped
        end
      end

      def handle_input(input)
        if input.blank?
          []
        else
          input.split(" ").uniq
        end
      end

      def regexp_condition(field, data, table)
        or_empty_scope(data) do
          data = handle_input(data).join("|")
          where("#{table}.#{field} regexp ? ", data)
        end
      end
    end


  end
end


