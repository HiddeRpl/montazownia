module BlogHelpers

    def get_articles_by_date
        return blog.articles.select{ |article| article.locale==current_lang }
        .group_by {|a| [a.date.year, a.date.month]}
    end

    def local_blog_posts
        return blog.articles.select{|article| article.locale==current_lang}
    end

    def tag_hashmap
        tags=Hash.new
        local_blog_posts.each do |article|
            article.tags.each do |tag|
                if tags[tag].nil?
                    tags[tag]=Array.new
                end
                tags[tag].push(article)
            end
        end
        return tags
    end
end