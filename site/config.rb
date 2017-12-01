# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require 'time'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Addons
set :haml, { :format => :html5 }

# Activate extensions
activate :i18n, :path => "/:locale/", :langs => [:en, :pl] , :mount_at_root => false
activate :directory_indexes

#desactive warnings
Haml::TempleEngine.disable_option_validator!

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/404.html', :layout => :error
# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

helpers do

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

  def get_current_time
    t = Time.now
    return t.httpdate
  end

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

  def full_translated_url(locale, page_name)
    relative_url=translated_url(locale, page_name)
    "http://montazownia.com.pl#{relative_url}"
  end

  def current_lang
    I18n.locale
  end

  def other_langs
    langs - [I18n.locale]
  end

  def get_alt(image)
    name = image.path.gsub("images/portfolio/", '').gsub(".", "")
    data.alts.list.each do |alt|
      if alt.name.to_s.eql? name.to_s
        if current_lang.to_s.eql? "pl"
          return alt.pl
        elsif current_lang.to_s.eql? "en"
          return alt.en
        end
      end
    end
  end

  def get_faq_list
    if current_lang.to_s.eql? "pl"
      return data.faq_pl.list
    elsif current_lang.to_s.eql? "en"
      return data.faq_en.list
    end
  end

end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
end
