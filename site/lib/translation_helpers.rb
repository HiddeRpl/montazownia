module TranslationHelpers

  def get_title(name)
    if name.eql? "main"
      return "Montażownia Tatuażu"
    end
    title=I18n.translate("titles.#{name}", I18n.locale)
    if title.include? "translation missing"
      title=name.capitalize
    end
    "#{title} | Montażownia Tatuażu"
  end

  def translated_url(locale, page_name)
    if page_name.eql? "main"
      return "/#{locale}"
    end
    begin
      translated = I18n.translate!("paths.#{page_name}", locale: locale)
    rescue I18n::MissingTranslationData
      translated = page_name
    end
    "/#{locale}/#{translated}"
  end

  def local_url(page_name)
    return translated_url(I18n.locale, page_name)
  end
  
end
