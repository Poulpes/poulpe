require 'json'
require 'open-uri'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets


data.portfolio.keys.each do |project|
  proxy "/work/#{project}.html", "/work/show.html", :locals => { project: project }, :ignore => true
end

helpers do
  def color
    ["blue", "orange", "red"].sample
  end

  def nav_active(path)
    current_page.path == path ? "active" : ""
  end

  def insta_posts
    url = "https://www.instagram.com/agencepoulpe/media/"
    insta_response = JSON.parse(open(url).read)
    posts = []
    insta_response["items"].each do |item|
      post = {}
      post[:link] = item["link"]
      post[:caption] = item["caption"]["text"]
      post[:likes] = item["likes"]["count"]
      post[:image_url] = item["images"]["low_resolution"]["url"]
      posts << post
    end
    return posts
  end
end


page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

# Sitemap
set :url_root, 'http://www.poulpe.co'

activate :search_engine_sitemap

# Deployment
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end






