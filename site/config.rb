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

# Errors layout
page '/404.html', :layout => :error

# Blog layout
page 'localizable/blog/*', :layout => :post

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'


activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.permalink = "/{locale}/blog/{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "/{locale}/blog/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"

  # 'Regex or string that delimits the article summary from the rest of the article.'
  blog.summary_separator = /(READMORE)/

  blog.summary_length = 160
  # blog.default_extension = ".markdown.erb"

  blog.generate_year_pages = false
  # blog.year_link = "{year}.html"
  # blog.year_template = 'summary'

  blog.generate_month_pages = false
  # blog.month_link = "{year}/{month}.html"

  blog.generate_day_pages = false
  # blog.day_link = "{year}/{month}/{day}.html"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  # blog.per_page = 5
  # blog.page_link = "page/{num}"
end


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
