module StoresHelper

  def sort_link
    if session[:sort] == "pop"
      link = link_to "sort by name", :sort => "name", :search => params[:search]
    else
      link = link_to "sort by pop.", :sort => "pop", :search => params[:search]
    end
    ("<span class=\"sort_link\">(" + link + ")</span>").html_safe
  end
  
  def aisle_link(item)
    if (item.store.aisles.count < 1)
      return ""
    end    
    if (item.aisle)
      item.aisle.name
    else
      link_to "-", edit_store_item_path(item.store.id, item.id), html_options = {:title => "edit item to select aisle"}
    end
  end
  
end
