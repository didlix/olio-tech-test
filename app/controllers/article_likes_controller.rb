# frozen_string_literal: true

class ArticleLikesController < ApplicationController
  def create
    article = ArticleLike.new(article_id: params[:article_id])

    redirect_to(articles_path) if article.save
  end
end
