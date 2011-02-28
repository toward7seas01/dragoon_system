require 'active_record'

module ActiveRecord
  class Base
    extend ActiveSupport::Memoizable

    def helpers
      ApplicationController.helpers
    end


  end
end


