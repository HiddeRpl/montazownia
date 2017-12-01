# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require "lib/language_helpers"
require "lib/translation_helpers"
require "lib/page_helpers"
require "lib/utility_helpers"

helpers LanguageHelpers
helpers TranslationHelpers
helpers PageHelpers
helpers UtilityHelpers

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

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
end
