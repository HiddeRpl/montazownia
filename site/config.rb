# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require 'babel/transpiler'
require 'uglifier'
require 'colorize'

load "lib/language_helpers.rb"
load "lib/translation_helpers.rb"
load "lib/page_helpers.rb"
load "lib/utility_helpers.rb"
load "lib/blog_helpers.rb"

helpers LanguageHelpers
helpers TranslationHelpers
helpers PageHelpers
helpers UtilityHelpers
helpers BlogHelpers


activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Addons
set :haml, { :format => :html5 }

# Activate extensions
activate :i18n, :path => "/:locale/", :langs => [:pl, :en] , :mount_at_root => false
activate :directory_indexes

set :images_dir, 'assets/images'

#desactive warnings
Haml::TempleEngine.disable_option_validator!

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Errors layout
page '/404.html', :layout => :error

# Blog layout
page 'localizable/blog/posts/*', :layout => :post

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'


activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "/{locale}"
  blog.permalink = "/blog/posts/{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "/blog/posts/{year}-{month}-{day}-{title}.html"
  # blog.layout = "layout"

  # 'Regex or string that delimits the article summary from the rest of the article.'
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 160

  # blog.default_extension = ".markdown.erb"

  # blog.tag_template = "localizable/blog_tag.html"
  # blog.taglink = "/{locale}/blog/posts/tag/{tag}.html"

  # blog.calendar_template = "localizable/blog_calendar.html"
  blog.generate_year_pages = false
  # blog.year_link = "/blog/posts/{year}.html"

  # blog.year_template = 'summary'
  blog.generate_month_pages = false
  # blog.month_link = "/{locale}/blog/posts/{year}/{month}.html"
  # blog.month_template = 'summary'
  blog.generate_day_pages = false

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
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
  # activate :minify_css
  # Dir.foreach("source/javascripts/") do |jsfile|
  #   if File.extname(jsfile).eql?(".js")
  #     puts "Compilation: #{jsfile}".blue
  #     read_source = File.read("source/javascripts/#{jsfile}")
  #     code_compiled = Babel::Transpiler.transform read_source
  #     write_source = File.open("source/javascripts/#{jsfile}", "w")
  #     write_source.write(code_compiled['code'])
  #     puts "Compilation success".green
  #   end
  # end
  # obj = Uglifier.compile(File.read("site.js"), :output => { :quote_style => :single })
  # activate :minify_javascript
  # activate :asset_hash
  # currently disable caching 
end
