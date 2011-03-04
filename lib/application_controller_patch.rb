class ApplicationController
  private

  def reload_page
    render :update do |page| page.reload end
  end

  def replace_html(part, content)
    render :update do |page|
      page.select(part).show().html(content)
    end
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
        raise l("lack necessary method")
      end
    end

  end
end
