class ArticlesService
  JSON_URL = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'.freeze

  def self.all
    fetch_articles_json
      .then { |json| JSON.parse(json) }
      .then { |articles| convert_articles_to_models(articles) }
  end


  class << self
    private

    def convert_articles_to_models(articles)
      articles.map do |article|
        Article.new(formatted_article(article))
      end
    end

    def formatted_article(article)
      article.symbolize_keys
    end

    def fetch_articles_json
      Faraday.get(JSON_URL).body
    end
  end
end
