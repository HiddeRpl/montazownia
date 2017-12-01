module LanguageHelpers

  def check_language (var)
    return current_lang.to_s.eql? var
  end

  def full_lang_name(lang)
    case lang.to_s
    when "pl"
      "Polski"
    when "en"
      "English"
    when "es"
      "Español"
    end
  end

  def current_lang
    I18n.locale
  end

  def other_langs
    langs - [I18n.locale]
  end

end
