module ApplicationHelper
  def js(*file_name)
    content_for :head do
      javascript_include_tag(*file_name)
    end
  end

  def css(*file_name)
    content_for :head do
      stylesheet_link_tag(*file_name)
    end
  end

  def render_form
    render :partial => "form"
  end

  def for_select(name, data, style = {})
    select_tag(name.to_s, options_for_select(data.merge({""=>""}), params[name] || ""), style)
  end

  def select_all_check_box
    check_box_tag "select-all"
  end

  def check_box_belongs_select_all(model, *additional_classes)
    klass = (["select_all"] + additional_classes).join(" ")
    check_box_tag "ids[]", model.id, false, :class => klass
  end
end
