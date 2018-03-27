module CategoriesHelper
  def find_all_subcategories(category)
    if !category.children.empty?
      html_code = ''
      category.children.each do |sub_category|
        if !sub_category.children.empty?
          html_code += print_category(sub_category)
          html_code += find_all_subcategories(sub_category)
          html_code += '</div>'
        else
          html_code += print_category(sub_category)
          html_code += '</div>'
        end
      end
      html_code += '</div>'
    end
  end

  def print_category(category)
    html_code = ''
    html_code += '<div class="media">'
    html_code += '<div class="media-left">'
    html_code += image_tag category.category_image.url(:medium), :class => "media-object", :style => "width: 64px; height: 64px;"
    html_code += '</div>'
    html_code += '<div class="media-body">'
    html_code += link_to 'Edit', edit_category_path(category), :class =>"btn btn-success pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light"
    html_code += link_to 'Delete', category, method: :delete, data: { confirm: 'Are you sure?' }, :class =>"btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light"
    html_code += link_to category do
      content_tag(:h4, category.category_name, class:'media-heading')
    end
    html_code += content_tag(:p, "Text for categories(TBA)")
  end

  def get_category(categories)
    html_code = ''
    categories.roots.each do |category|
      html_code += print_category(category)
      if !category.children.empty?
        html_code += find_all_subcategories(category)
      end
      html_code += '</div></div>'
    end
    html_code.html_safe
  end
end
