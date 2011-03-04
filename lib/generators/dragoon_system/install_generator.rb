require 'rails/generators'

module DragoonSystem
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/dragoon_system.en.yml"
        copy_file "../../../config/locales/zh-CN.yml", "config/locales/dragoon_system.zh-CN.yml"
      end

    end
  end
end
