module ActionController
  class Base
    extend ActiveSupport::Memoizable

    helper_method :current_identifier, :current_model
    
    private

    def helpers
      self.class.helpers
    end

    def reload_page
      render :update do |page| page.reload end
    end

    def replace_html(part, content)
      render :update do |page|
        page.select(part).show().html(content)
      end
    end

    def current_identifier
      params[:controller].split("/").last.singularize
    end

    def current_model
      current_identifier.classify.constantize
    end

    memoize :current_identifier, :current_model

    def base_action(&block)
      case current_model.each_with_transaction(params[:ids], &block)
      when :success
        flash.notice = t("dragoon_system.transaction.success")
      when :empty
        flash.alert = t("dragoon_system.transaction.empty")
      else
        flash.alert = t("dragoon_system.transaction.error")
      end
      redirect_to :back
    end


    class << self

      def ajax_destroy
        if instance_methods.include?("resource")
          define_method :destroy do
            super do |format|
              format.js do
                render :update do |page|
                  page.select(dom_id(resource)).remove()
                end
              end
            end
          end
        else
          raise t("dragoon_system.lack_necessary_method")
        end
      end

    end
  end
end
