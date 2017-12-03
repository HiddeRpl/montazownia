module PageHelpers

  def get_navlink_sites
    return sitemap.resources
    .select{ |r| r.url =~ /^(\/#{current_lang}\/)(?!.*page).*$/ }
    .select{ |r| r.data.id? }
    .sort_by{ |r| r.data.ordinal }
  end
    

  def get_alt(image)
    name = image.path.gsub("images/portfolio/", '').gsub(".", "")
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

end
