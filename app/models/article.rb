class Article
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def likes
    ArticleLike.where(article_id: id).count
  end
end
