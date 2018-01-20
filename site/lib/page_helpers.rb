module PageHelpers

  def get_navlink_sites
    return sitemap.resources
    .select{ |r| r.url =~ /^(\/#{current_lang}\/)(?!.*page).*$/ }
    .select{ |r| r.data.id? }
    .sort_by{ |r| r.data.ordinal }
  end
    

  def get_alt(image)
    name = image.path.gsub("assets/images/portfolio/", '').gsub(".", "")
    data.alts.list.each do |alt|
      if alt.name.to_s.eql? name.to_s
        if check_language "pl"
          return alt.pl
        elsif check_language "en"
          return alt.en
        end
      end
    end
  end

  def get_faq_list
    if check_language "pl"
      return data.faq_pl.list
    elsif check_language "en"
      return data.faq_en.list
    end
  end

  def get_tattoo_care_list
    if check_language "pl"
      return data.tattoo_care_pl.list
    elsif check_language "en"
      return data.tattoo_care_en.list
    end
  end

  def is_current_page(page)
    return page.data.id.eql? current_page.data.id
  end

  def get_nav_link_class(is_active)
    elementClass="mdl-navigation__link nav-bar__link"    
    if is_active
      elementClass.concat(" nav-bar__link--active")    
    end
    return elementClass
  end

  def generate_nav_link(page)
    return link_to(get_navlink_title(page.data.id), 
      page.url, 
      :class => get_nav_link_class(is_current_page(page)),
      :id => "nav-"+page.data.id)
  end

  def get_anchor_nav(title, is_active)
    return link_to(get_navlink_title(title), 
    "#"+get_navlink_title(title), 
    :class=> get_nav_link_class(is_active))
  end

end
