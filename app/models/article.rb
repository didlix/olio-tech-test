# frozen_string_literal: true

class Article
  attr_reader :title

  def initialize(attributes)
    @title = attributes[:title]
  end
end
